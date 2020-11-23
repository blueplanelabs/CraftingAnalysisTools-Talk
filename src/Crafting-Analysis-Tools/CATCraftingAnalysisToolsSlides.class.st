Class {
	#name : #CATCraftingAnalysisToolsSlides,
	#superclass : #GtLiveShow,
	#category : #'Crafting-Analysis-Tools-Slides'
}

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> assessmentReports [
    | reportCoversDir gridElement cards |
	gridElement := BlElement new.
	gridElement layout: BlLinearLayout horizontal.
	gridElement constraintsDo: [ :c | 
		c horizontal fitContent.
		c vertical fitContent.
		c linear horizontal alignCenter].
		
	cards := self assessmentReportsInfo collect: [ :info |
		| file |
		file := self reportCoversDir / (info at: #fileName).
		BrCard new
			size: 360@550;
			look: BrShadowLook + BrTextLabelLook + BrIconLook + BrDescriptionLook;
			background: Color white;
			margin: (BlInsets all: 20);
			padding: (BlInsets all: 5);
			layout: BlLinearLayout vertical;
			title: '';
			description: (info at: #statement);
			picture: (BlFileImageElement new file: file; size: 350@425)
			
	].
	gridElement addChildren: cards.
	^ gridElement
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> assessmentReportsInfo [
 
| fundamentalText mentalModelsText lastSummerText |

	fundamentalText := 'Maintenance typically consumes about 40 to 80 percent (60 percent average) of software costs. Therefore, it is probably the most important life cycle phase.' asRopedText foreground: Color gray; fontSize: 15.
	(fundamentalText from: 38 to: 92) foreground: (Color blue alpha: 0.5).
	
	mentalModelsText := '66% of developers stated that understanding the code is the biggest development problem; 82% stated that it takes a lot of effort to understand the existing code.' asRopedText foreground: Color gray; fontSize: 15.
	(mentalModelsText from: 1 to: 88) foreground: (Color blue alpha: 0.5).
	
	lastSummerText := 'Program understanding is as expected the dominant activity, but as we see our analysis attributes to it even more importance than what the common knowledge suggests, reaching a value of roughly 70%.' asRopedText foreground: Color gray; fontSize: 15.
	(lastSummerText from: 75 to: 164) foreground: (Color blue alpha: 0.5).
	(lastSummerText from: 176 to: 197) foreground: (Color blue alpha: 0.5).
	
^ { 
	{ (#fileName -> 'Frequently_Forgotten_Fundamental_Facts_About_Software_Engineering.png').
	(#statement -> fundamentalText) } asDictionary.
	{ (#fileName ->'Maintaining_Mental_Models.png').
	  (#statement ->mentalModelsText) } asDictionary.
    { (#fileName -> 'I_Know_What_You_Did_Last_Summer.png').
	(#statement -> lastSummerText)} asDictionary }

]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> reportCoversDir [
"^ (IceRepository registeredRepositoryIncludingPackage: self class package) location /
		'images' / 'assessment-reports'."
	^ GtResourcesUtility resourceAtPath: Path * 'blueplanelabs' / 'CraftingAnalysisTools-Talk' / 'images' / 'assessment-reports'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentEffortSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 40;
		newFadedText: 'Great part of the development effort is spent on assessing the software system.';
		element: [ self assessmentReports ]
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentIntroSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		element: [ self softwareAssessmentPicture ];
		elementWeight: 0.5;
		priority: 30;
		newText: 'The construction of software captures almost all our attention.';
		newText: 'However, the process of building software is only one of the activities involved in the software development process.';
		newText: 'Great part of the development effort is spent on assessing the software system.';
		newText: 'For the process of building software we have a body of knowledge: patterns, principles, technologies, etc. and tools.';
		newText: 'Regarding software assessment we mostly rely on reading through the system''s code to build enough understanding and then trust our gut feeling for finding a needle in a haystack.'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentPicture [
^ BlUrlImageElement url: 'http://humane-assessment.com/pierfiles/f5/avdkl6oavdc6f2qxhmv0s0tllum441/icons-600-200-5.png'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentSectionSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 20;
		titleWithFormat:
			('software assessment' asRopedText
				fontSize: 50;
				glamorousRegularFont).
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Crafting Analysis Tools with Pharo' asRopedText 
			fontSize: 70;
			glamorousRegularFont;
			thin;
			in: [:t | (t from: 1 to: 'Crafting Analysis Tools' size ) bold];
			yourself);
		subtitleWithFormat: ('An example: AWS lambda data leaks' asRopedText
			fontSize: 45;
			glamorousRegularFont;
			thin).
]
