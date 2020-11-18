Class {
	#name : #CATCraftingAnalysisToolsSlides,
	#superclass : #GtLiveShow,
	#category : #'Crafting-Analysis-Tools-Slides'
}

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> assessmentReports [
 	| gridElement scrollPane jpgs previewSize children reportCovers reportCoversDir |

	gridElement := BlElement new.
	gridElement layout: (BlGridLayout new columnCount: 3; cellSpacing: 20).
	gridElement constraintsDo: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ].

	reportCoversDir := (IceRepository registeredRepositoryIncludingPackage: self class package) location /
		'images' / 'assessment-reports'.
	reportCovers := reportCoversDir children sorted
		select: [ :each | each extension asLowercase = 'png' ].
	previewSize := 300@400.
	children :=  reportCovers collect: [ :file |
			BlFileImageElement new 
				size: previewSize;
				file: file;
				yourself ].

	gridElement addChildren: children.

	^ gridElement
]

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> softwareAssessmentEffortSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 40;
		newFadedText: 'Label';
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
