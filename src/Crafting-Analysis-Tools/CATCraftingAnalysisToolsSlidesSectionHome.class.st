Class {
	#name : #CATCraftingAnalysisToolsSlidesSectionHome,
	#superclass : #GtHomeSection,
	#category : #'Crafting-Analysis-Tools-GToolkit-Home'
}

{ #category : #accessing }
CATCraftingAnalysisToolsSlidesSectionHome >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Analysis Tools Slides').
	cardsContainer := self newCardsContainer.
	cardsContainer addChild: (self 
		newShowCardWithTitle: 'Crafting Analysis Tools with Pharo' 
		slideshow: [ CATCraftingAnalysisToolsSlides new ]
		description: 'How to craft analysis tools using Pharo, Moose and GToolkit.').
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
