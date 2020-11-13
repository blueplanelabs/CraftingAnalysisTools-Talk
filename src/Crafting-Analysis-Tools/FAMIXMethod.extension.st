Extension { #name : #FAMIXMethod }

{ #category : #'*Crafting-Analysis-Tools' }
FAMIXMethod >> gtProcessWideStateFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Process-wide State';
		priority: 6;
		painting: [ :view |
			| path allInvokedMethods methods allAccessedAttributes nonInitializedAttributes  |
			path := OrderedCollection with: self.
			allInvokedMethods := Set new.

			[ path isNotEmpty] whileTrue: [
				| method |
				method := path removeFirst.
				(method parentType container mooseName beginsWith: 'es::osoco::bbva') 
					ifTrue: [
						allInvokedMethods add: method. 
						path addAll: (method invokedMethods select: [ :each |
							(allInvokedMethods includes: each) not ]).
					]
			].

			methods := allInvokedMethods asOrderedCollection.
			allAccessedAttributes := Set new.
methods inject: allAccessedAttributes into: [ :attributes :method |
	attributes addAll: ((method query: #out with: FAMIXAccess) 
		opposites atScope: FAMIXAttribute).
	attributes].
nonInitializedAttributes := allAccessedAttributes select:[:attribute | 
	(attribute incomingAccesses select: [:access | 
		allInvokedMethods includes: access accessor]) allSatisfy: [ :x |
			x isWrite not ]			
].

view nodes 
	shape: [ :each |
		| element |
		element := BlElement new
			size: 15@15;
			geometry: BlEllipse new;
			border: (BlBorder paint: (Color blue alpha: 0.5) width: 2).
		element background: (each accesses detect: [ :access | 
			nonInitializedAttributes includes: access variable ]
				ifFound: [ Color lightRed ] 
				ifNone: [Color lightGreen]); 
		yourself.
	];
	with: methods.

view nodes 
	shape: [ :each |
		BlElement new
			size: 9@9;
			geometry: (each hasClassScope 
				ifTrue: [BlPolygon vertices: { 0@5 . 5@0 . 10@5 . 5@10 }] 
				ifFalse: [ BlSquare new]);
			background: ((each incomingAccesses select: [:access | allInvokedMethods includes: access accessor ]) 
				detect: [:anAccess | anAccess isWrite ] 
				ifFound: [ Color lightGreen] 
				ifNone: [ Color lightRed])
	];
	with: allAccessedAttributes.
	
	
view edges 
	fromNearestCircle;
	toNearestCircle;
	shape: [:x | 
		BlLineElement new
			border: (BlBorder paint: (Color blue alpha: 0.5) width: 2);
			toHead: (BlArrowheadSimpleArrow new
				arrowLengthFraction: 5;
				arrowNoseAngle: 60;
				border: (BlBorder paint: (Color blue alpha: 0.5) width: 1))
	];
	connect: methods fromAll: [ :each |  each invokingMethods ].
	
		
view edges 
	fromNearestCircle;
	toNearestCircle;
	shape: [:x | 
		BlLineElement new
			border: (BlBorder paint: (Color lightGray alpha: 0.6) width: 3)
	];
	connect: allAccessedAttributes fromAll: [ :each | 
		each incomingAccesses 
			select: [:anAccess | anAccess isWrite not ] thenCollect: [ :a | a accessor ]
	].
		
view edges 
	fromNearestCircle;
	toNearestCircle;
	shape: [:x | 
		BlLineElement new
			border: (BlBorder paint: (Color lightGreen alpha: 0.6) width: 3)
	];
	connect: allAccessedAttributes fromAll: [ :each | 
		each incomingAccesses 
			select: [:anAccess | anAccess isWrite ] thenCollect: [ :a | a accessor ] ].

view layout tree 
	nodeDistance: 5;
	levelDistance: 20.

]

]
