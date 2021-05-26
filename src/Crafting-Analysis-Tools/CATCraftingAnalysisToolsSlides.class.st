Class {
	#name : #CATCraftingAnalysisToolsSlides,
	#superclass : #GtLiveShow,
	#category : #'Crafting-Analysis-Tools-Slides'
}

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> assessmentReports [
	| tmp1 tmp2 tmp3 |
	tmp2 := BlElement new.
	tmp2
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :arg1 | 
			arg1 horizontal fitContent.
			arg1 vertical fitContent.
			arg1 linear horizontal alignCenter ].
	tmp3 := self assessmentReportsInfo
		collect: [ :arg2 | 
			| tmp4 tmp6 tmp8 |
			tmp4 := self reportCoversDir / (arg2 at: #fileName).
			tmp6 := BrCard new.
			tmp6
				size: 360 @ 450;
				look: BrShadowLook + BrTextLabelLook + BrIconLook + BrDescriptionLook;
				background: Color white;
				margin: (BlInsets all: 20);
				padding: (BlInsets all: 5);
				layout: BlLinearLayout vertical;
				title: '';
				description: (arg2 at: #statement).
			tmp8 := BlFileImageElement new.
			tmp8 file: tmp4.
			tmp6 picture: (tmp8 size: 350 @ 350) ].
	tmp2 addChildren: tmp3.
	^ tmp2
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> assessmentReportsInfo [
	| tmp1 tmp2 tmp3 tmp5 tmp7 tmp9 |
	tmp5 := 'Maintenance typically consumes about 40 to 80 percent (60 percent average) of software costs. Therefore, it is probably the most important life cycle phase.'
		asRopedText.
	tmp5
		foreground: Color gray;
		fontSize: 15;
		glamorousRegularFont.
	tmp1 := tmp5 italic.
	(tmp1 from: 38 to: 92) foreground: (Color blue alpha: 0.5).
	tmp7 := '66% of developers stated that understanding the code is the biggest development problem; 82% stated that it takes a lot of effort to understand the existing code.'
		asRopedText.
	tmp7
		foreground: Color gray;
		fontSize: 15;
		glamorousRegularFont.
	tmp2 := tmp7 italic.
	(tmp2 from: 1 to: 88) foreground: (Color blue alpha: 0.5).
	tmp9 := 'Program understanding is as expected the dominant activity, but as we see our analysis attributes to it even more importance than what the common knowledge suggests, reaching a value of roughly 70%.'
		asRopedText.
	tmp9
		foreground: Color gray;
		fontSize: 15;
		glamorousRegularFont.
	tmp3 := tmp9 italic.
	(tmp3 from: 75 to: 164) foreground: (Color blue alpha: 0.5).
	(tmp3 from: 176 to: 197) foreground: (Color blue alpha: 0.5).
	^ {{(#fileName
		-> 'Frequently_Forgotten_Fundamental_Facts_About_Software_Engineering.png').
	(#statement -> tmp1)} asDictionary.
	{(#fileName -> 'Maintaining_Mental_Models.png').
	(#statement -> tmp2)} asDictionary.
	{(#fileName -> 'I_Know_What_You_Did_Last_Summer.png').
	(#statement -> tmp3)} asDictionary}
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> dataAndRealityBookCover [
	| tmp1 tmp3 |
	tmp1 := self imagesDir / 'DataAndReality-Cover.jpg'.
	tmp3 := BlFileImageElement new.
	tmp3 file: tmp1.
	^ tmp3 size: 200 @ 300
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> focusingOnProblemsSectionSlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 |
	tmp2 := arg1 title.
	tmp2 priority: 21.
	tmp4 := 'el problema antes que la soluci√≥n' asRopedText.
	tmp4 fontSize: 45.
	^ tmp2 titleWithFormat: tmp4 glamorousRegularFont
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> howDevelopersSpendTimeReport [
	| tmp1 tmp3 tmp5 |
	tmp1 := self reportCoversDir
		/ 'Minelli-how-developers-spend-time.png'.
	tmp3 := BrCard new.
	tmp3
		size: 460 @ 460;
		look: BrIconLook;
		background: Color white;
		margin: (BlInsets all: 20);
		padding: (BlInsets all: 5);
		layout: BlLinearLayout vertical.
	tmp5 := BlFileImageElement new.
	tmp5 file: tmp1.
	^ tmp3 picture: (tmp5 size: 450 @ 450)
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> howDevelopersSpendTimeSlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 |
	tmp2 := arg1 textAndElement.
	tmp2
		priority: 50;
		newText: 'How developers spend their time?'.
	tmp4 := 'From I Know What You Did Last Summer: An Investigation of How Developers Spend Their Time. Roberto Minelli et. al.'
		asRopedText.
	tmp4
		glamorousRegularFont;
		fontSize: 15;
		thin;
		in: [ :arg2 | 
			(arg2
				from: 6
				to:
					'I Know What You Did Last Summer: An Investigation of How Developers Spend Their Time.'
						size + 6) bold ].
	tmp2 newTextWithFormat: tmp4 yourself.
	^ tmp2 element: [ self howDevelopersSpendTimeReport ]
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> humaneAssessmentLogo [
	| tmp1 tmp3 |
	tmp1 := self imagesDir / 'humane-assessment-logo.png'.
	tmp3 := BlFileImageElement new.
	tmp3 file: tmp1.
	^ tmp3 size: 400 @ 400
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> humaneAssessmentSlideFor: arg1 [
	<gtSlide>
	| tmp2 |
	tmp2 := arg1 textAndElement.
	tmp2
		priority: 70;
		newText: 'Assessment must be recognized explicitly and approached as a distinct discipline.';
		newText: 'Software systems are complex and present many contextual problems. To be effective, assessment must be tailored to deal with the context of the system and of the problem at hand.';
		newText: 'The ability to assess a situation is a skill. Like any skill, it needs to and can be educated.'.
	^ tmp2 element: [ self humaneAssessmentLogo ]
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> imagesDir [
	^ GtResourcesUtility
		resourceAtPath: Path * 'blueplanelabs' / 'CraftingAnalysisTools-Talk' / 'images'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> problemDeclarationSlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 tmp6 tmp8 tmp10 |
	tmp2 := arg1 text.
	tmp2
		priority: 20;
		newText: 'La construcci√≥n de software consume casi toda nuestra atenci√≥n.';
		newText: 'Sin embargo, la construcci√≥n s√≥lo es una de las actividades involucradas en el proceso de desarrollo de software.'.
	tmp4 := 'Mi tesis es que ni siquiera es la m√°s importante y deber√≠amos prestar m√°s atenci√≥n a otras actividades, como la '
		asRopedText.
	tmp4 glamorousRegularFont.
	tmp6 := 'comprensi√≥n del problema' asRopedText.
	tmp6
		glamorousRegularFont;
		fontSize: 20;
		bold.
	tmp8 := ' o la ' asRopedText.
	tmp8 glamorousRegularFont.
	tmp10 := 'evaluaci√≥n del software.' asRopedText.
	tmp10
		glamorousRegularFont;
		fontSize: 20;
		bold.
	^ tmp2
		newTextWithFormat:
			(tmp4 fontSize: 20) , tmp6 yourself , (tmp8 fontSize: 20)
				, tmp10 yourself
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> problemFramesBookCover [
	| tmp1 tmp3 |
	tmp1 := self imagesDir / 'ProblemFrames-Cover.jpg'.
	tmp3 := BlFileImageElement new.
	tmp3 file: tmp1.
	^ tmp3 size: 200 @ 300
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> problemSpace1SlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 |
	tmp2 := arg1 textAndElement.
	tmp2
		element: [ self dataAndRealityBookCover ];
		elementWeight: 0.3;
		priority: 23.
	tmp4 := 'It is always easier (yet riskier) to attempt to solve a business problem through technology, rather than investing the effort to determine what the problem is by understanding people''s perspectives and, ultimately, what they are looking for in an application.'
		asRopedText.
	tmp4
		fontSize: 40;
		glamorousRegularFont.
	^ tmp2 newTextWithFormat: tmp4 italic
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> problemSpace2SlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 tmp6 |
	tmp2 := arg1 textAndElement.
	tmp2
		element: [ self problemFramesBookCover ];
		elementWeight: 0.3;
		priority: 22.
	tmp4 := 'It is important to focus directly on a problem, not just going straight to the design of a solution.'
		asRopedText.
	tmp4
		fontSize: 40;
		glamorousRegularFont.
	tmp2 newTextWithFormat: tmp4 italic.
	tmp6 := 'Most of the methods widely used today are strongly solution-oriented. You need solution-oriented methods to help you to produce solutions. But they give little help and are often a positive hindrance in structuring and analysing problems.'
		asRopedText.
	tmp6
		fontSize: 40;
		glamorousRegularFont.
	^ tmp2 newTextWithFormat: tmp6 italic
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> reportCoversDir [
	^ self imagesDir / 'assessment-reports'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> rethinkingSoftwareAssessmentSlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 |
	tmp2 := arg1 labelAndElement.
	tmp2 priority: 60.
	tmp4 := 'Software assessment is a critical activity. It needs rethinking.'
		asRopedText.
	tmp4
		glamorousRegularFont;
		fontSize: 20;
		in: [ :arg2 | 
			(arg2
				from: 'Software assessment is a ' size
				to: 'Software assessment is a critical activity.' size)
				foreground: Color blue ].
	tmp2 newTextWithFormat: tmp4 yourself.
	^ tmp2 element: [ self humaneAssessmentLogo ]
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentEffortSlideFor: arg1 [
	<gtSlide>
	| tmp2 |
	tmp2 := arg1 labelAndElement.
	tmp2
		priority: 40;
		newFadedText: 'Great part of the development effort is spent on assessing the software system.'.
	^ tmp2 element: [ self assessmentReports ]
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentIntroSlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 |
	tmp2 := arg1 textAndElement.
	tmp2
		element: [ self softwareAssessmentPicture ];
		elementWeight: 0.5;
		priority: 31.
	tmp4 := 'La construcci√≥n de software consume casi toda nuestra atenci√≥n.'
		asRopedText.
	tmp4 fontSize: 40.
	tmp2
		newTextWithFormat: tmp4 glamorousRegularFont;
		newText: 'Sin embargo, la construcci√≥n s√≥lo es una de las actividades involucradas en el proceso de desarrollo de software.';
		newText: 'Ni siquiera es la m√°s importante...';
		newText: 'For the process of building software we have a body of knowledge: patterns, principles, technologies, etc. and tools.'.
	^ tmp2
		newText: 'Regarding software assessment we mostly rely on reading through the system''s code to build enough understanding and then trust our gut feeling for finding a needle in a haystack.'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentPicture [
	^ BlUrlImageElement
		url: 'http://humane-assessment.com/pierfiles/f5/avdkl6oavdc6f2qxhmv0s0tllum441/icons-600-200-5.png'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentSectionSlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 |
	tmp2 := arg1 title.
	tmp2 priority: 30.
	tmp4 := 'evaluaci√≥n de software' asRopedText.
	tmp4 fontSize: 45.
	^ tmp2 titleWithFormat: tmp4 glamorousRegularFont
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> titleSlideFor: arg1 [
	<gtSlide>
	| tmp2 tmp4 tmp6 |
	tmp2 := arg1 title.
	tmp2 priority: 1.
	tmp4 := 'Creando Herramientas de An√°lisis de Software con Pharo'
		asRopedText.
	tmp4
		fontSize: 50;
		glamorousRegularFont;
		thin;
		in: [ :arg2 | 
			(arg2 from: 1 to: 'Creando Herramientas de An√°lisis de Software' size)
				bold ].
	tmp2 titleWithFormat: tmp4 yourself.
	tmp6 := 'Caso de estudio: Fuga de datos en AWS lambdas' asRopedText.
	tmp6
		fontSize: 40;
		glamorousRegularFont.
	^ tmp2 subtitleWithFormat: tmp6 thin
]
