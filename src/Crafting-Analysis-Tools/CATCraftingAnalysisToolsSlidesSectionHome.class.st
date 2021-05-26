Class {
	#name : #CATCraftingAnalysisToolsSlidesSectionHome,
	#superclass : #GtHomeSection,
	#category : #'Crafting-Analysis-Tools-GToolkit-Home'
}

{ #category : #accessing }
CATCraftingAnalysisToolsSlidesSectionHome >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer
		addChild: (self newSectionTitle: 'Herramientas de Análisis de Software').
	cardsContainer := self newCardsContainer.
	
	cardsContainer
		addChild:
			(self
				newShowCardWithTitle: 'Creando Herramientas de Análisis de Sofware con Pharo'
				slideshow: [ GtLiveShow createWithArrowsVisible: CATCraftingAnalysisToolsSlides new ]
				description: 'Cómo crear herramientas de análisis de software usando Pharo, Moose y GToolkitHow.').
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
