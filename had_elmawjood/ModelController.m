//
//  ModelController.m
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import "ModelController.h"

@implementation ModelController



-(void)loadIngrediantsFromJson
{
    NSError* error;

    NSData* jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ingredients" ofType:@"txt"]];
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:jsonData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* ingredients = [json objectForKey:@"ingredients"]; //2
    
    if(self.ingrediants == nil)
    {
        self.ingrediants = [[NSMutableArray alloc] initWithCapacity:[ingredients count]];
        for (NSString* string in ingredients) {
            [self.ingrediants addObject:[[Ingredient alloc] initWithName:string]];
        }
    }
}

-(void)loadRecipesFromJson
{
    NSError* error;
    
    NSData* jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"txt"]];
    NSArray* json = [NSJSONSerialization
                          JSONObjectWithData:jsonData
                          options:kNilOptions
                          error:&error];
    
    for(NSDictionary* dic in json)
    {
        Recipe* recipe = [[Recipe alloc] init];
        [recipe setName:[dic valueForKey:@"name"]];
        [recipe setCategory:[dic valueForKey:@"category"]];
        [recipe setPrepareTime:[dic valueForKey:@"prepareTime"]];
        [recipe setCookTime:[dic valueForKey:@"cookTime"]];
        [recipe setServings:[dic valueForKey:@"servings"]];
        [recipe setRecipe:[dic valueForKey:@"recipe"]];
        
        NSMutableArray* ingrediants = [[NSMutableArray alloc] init];
        NSArray* ingrediantsNames = [dic valueForKey:@"ingredients"];
        for (NSString* ingrediantName in ingrediantsNames) {
            Ingredient* ing = [[Ingredient alloc] initWithName:ingrediantName];
            [ingrediants addObject:ing];
        }
        [recipe setIngrediants:ingrediants];
        
        if(self.recipes == nil)
        {
            self.recipes = [[NSMutableSet alloc] init];
        }
        [self.recipes addObject:recipe];
    }
}

-(BOOL)areIgrediants:(NSArray*)recipeIng In:(NSArray*)allIng
{    
    for(Ingredient* rIng in recipeIng)
    {
        BOOL ingFound = NO;
        for(Ingredient* aIng in allIng)
        {
            if([aIng.name isEqualToString:rIng.name])
            {
                ingFound = YES;
            }
        }
        if(ingFound == NO)
        {
            return NO;
        }
    }
    
    return YES;
}


-(NSArray*) getRecipesWithIngrediants
{
    NSMutableArray* returnedRecipes = [[NSMutableArray alloc] init];
    
    for(Recipe* recipe in self.recipes)
    {
        NSMutableArray* ingrediantsInRecipe = recipe.ingrediants;
        NSArray* allIngredians = self.ingrediants;
        
        if([self areIgrediants:ingrediantsInRecipe In:allIngredians])
        {
            [returnedRecipes addObject:recipe];
        }
    }
    
    return returnedRecipes;
}

@end
