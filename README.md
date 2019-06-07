# README

# Roughtly.Recipes Rails API Backend

## Domains

User has many Recipes

Recipe has many RecipeSteps

RecipeStep has many StepIngredients
RecipeStep has many StepSubRecipes

StepIngredient belongs to Ingredient & RecipeStep
StepSubRecipe belong to SubRecipe & RecipeStep

This proved to be a challenging structure as it is recursive in nature. Each SubRecipe is actually a Recipe record. The recursion would quickly lead to stack overflows when serializing the data into JSON. As a consequence I was not able to provide a branching tree of recipes and their dependencies. Instead, if we treat each recipe, and its various steps and ingredients as a node within a tree, what is served down to the client is that node, along with a reference to the next recipe nodes. Those recipe nodes can then be retrieved as needed, but only upon request.

This structure avoids the recursive aspect while still allowing the tree to be traversed. 

Implementing it required the use of a ShortSerializer which provides an alternate set of serialization rules, and allowed me to limit the record to only its own propertiers without any associations. 

## Auth

Auth uses bcrypt and JSON Web Tokens which must be included with every request besides /login POST and /users POST. 
