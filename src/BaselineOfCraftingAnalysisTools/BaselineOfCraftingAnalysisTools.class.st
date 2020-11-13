Class {
	#name : #BaselineOfCraftingAnalysisTools,
	#superclass : #BaselineOf,
	#category : #BaselineOfCraftingAnalysisTools
}

{ #category : #accessing }
BaselineOfCraftingAnalysisTools >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			package: 'Crafting-Analysis-Tools'.

		spec 
			group: 'Core' with: #('Crafting-Analysis-Tools');
			group: 'default' with: #('Core') ]
]
