//
//  ModelController.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Recipe.h"
#import "Ingredient.h"

@interface ModelController : NSObject

-(void)loadIngrediantsFromJson;
-(void)loadRecipesFromJson;

-(NSArray*) getRecipesWithIngrediants;

@property (strong, nonatomic) NSMutableArray* ingrediants;
@property (strong, nonatomic) NSMutableSet* recipes;

@end
