Class {
	#name : #CATCraftingAnalysisToolsSlides,
	#superclass : #GtLiveShow,
	#category : #'Crafting-Analysis-Tools-Slides'
}

{ #category : #accessing }
CATCraftingAnalysisToolsSlides >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Analysis Tools with Moose' asRopedText 
			fontSize: 70;
			glamorousRegularFont;
			thin;
			in: [:t | (t from: 1 to: 'Analysis Tools' size ) bold];
			yourself).
]
