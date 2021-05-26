Class {
	#name : #CATCraftingAnalysisToolsSlidesSectionHome,
	#superclass : #GtHomeSection,
	#category : #'Crafting-Analysis-Tools-GToolkit-Home'
}

{ #category : #accessing }
CATCraftingAnalysisToolsSlidesSectionHome >> create [
	| tmp1 tmp2 |
	tmp1 := self newSectionContainer.
	tmp1
		addChild: (self newSectionTitle: 'Herramientas de An√°lisis de Software').
	tmp2 := self newCardsContainer.
	tmp2
		addChild:
			(self
				newShowCardWithTitle: 'Creando Herramientas de An√°lisis de Sofware con Pharo'
				slideshow: [ CATCraftingAnalysisToolsSlides new ]
				description: 'C√≥mo crear herramientas de an√°lisis de software usando Pharo, Moose y GToolkitHow.').
	tmp1 addChild: tmp2.
	^ tmp1
]
