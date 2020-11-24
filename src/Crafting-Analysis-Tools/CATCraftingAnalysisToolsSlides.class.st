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
			size: 360@450;
			look: BrShadowLook + BrTextLabelLook + BrIconLook + BrDescriptionLook;
			background: Color white;
			margin: (BlInsets all: 20);
			padding: (BlInsets all: 5);
			layout: BlLinearLayout vertical;
			title: '';
			description: (info at: #statement);
			picture: (BlFileImageElement new file: file; size: 350@350)
			
	].
	gridElement addChildren: cards.
	^ gridElement
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> assessmentReportsInfo [
 
| fundamentalText mentalModelsText lastSummerText |

	fundamentalText := 'Maintenance typically consumes about 40 to 80 percent (60 percent average) of software costs. Therefore, it is probably the most important life cycle phase.' asRopedText foreground: Color gray; fontSize: 15; glamorousRegularFont; italic.
	(fundamentalText from: 38 to: 92) foreground: (Color blue alpha: 0.5).
	
	mentalModelsText := '66% of developers stated that understanding the code is the biggest development problem; 82% stated that it takes a lot of effort to understand the existing code.' asRopedText foreground: Color gray; fontSize: 15; glamorousRegularFont; italic.
	(mentalModelsText from: 1 to: 88) foreground: (Color blue alpha: 0.5).
	
	lastSummerText := 'Program understanding is as expected the dominant activity, but as we see our analysis attributes to it even more importance than what the common knowledge suggests, reaching a value of roughly 70%.' asRopedText foreground: Color gray; fontSize: 15; glamorousRegularFont; italic.
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
CATCraftingAnalysisToolsSlides >> howDevelopersSpendTimeReport [
	| file |
	
	file := self reportCoversDir/ 'Minelli-how-developers-spend-time.png'.
	
	^ BrCard new
		size: 460@460;
		look: BrIconLook;
		background: Color white;
		margin: (BlInsets all: 20);
		padding: (BlInsets all: 5);
		layout: BlLinearLayout vertical;
		picture: (BlFileImageElement new file: file; size: 450@450)
	
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> howDevelopersSpendTimeSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 50;
		newText: 'How developers spend their time?';
		newTextWithFormat: ('From I Know What You Did Last Summer: An Investigation of How Developers Spend Their Time. Roberto Minelli et. al.' asRopedText glamorousRegularFont; 
			fontSize: 15;
			thin;
			in: [:t | (t from: 6 to: ('I Know What You Did Last Summer: An Investigation of How Developers Spend Their Time.' size+ 6)) bold];
			yourself);
		element: [ self howDevelopersSpendTimeReport ]
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> humaneAssessmentLogo [
	| file |
	file := self imagesDir/ 'humane-assessment-logo.png'.
	
	^ BlFileImageElement new file: file; size: 400@400
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> humaneAssessmentSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 70;
		newText: 'Assessment must be recognized explicitly and approached as a distinct discipline.';
		newText: 'Software systems are complex and present many contextual problems. To be effective, assessment must be tailored to deal with the context of the system and of the problem at hand.';
		newText: 'The ability to assess a situation is a skill. Like any skill, it needs to and can be educated.';
		element: [ self humaneAssessmentLogo ]
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> imagesDir [
	^ GtResourcesUtility resourceAtPath: Path * 'blueplanelabs' / 'CraftingAnalysisTools-Talk' / 'images'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> reportCoversDir [
"^ (IceRepository registeredRepositoryIncludingPackage: self class package) location /
		'images' / 'assessment-reports'."
	^ self imagesDir / 'assessment-reports'
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> rethinkingSoftwareAssessmentSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 60;
		newTextWithFormat: ('Software assessment is a critical activity. It needs rethinking.' asRopedText 
			glamorousRegularFont; 
			fontSize: 20;
			in: [:t | (t from: 'Software assessment is a ' size to: 'Software assessment is a critical activity.' size) 
				foreground: Color blue];
			yourself);
		element: [ self humaneAssessmentLogo ]
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
