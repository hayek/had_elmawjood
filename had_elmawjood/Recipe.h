//
//  Recipe.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* prepareTime;
@property (strong, nonatomic) NSString* cookTime;
@property (strong, nonatomic) NSString* servings;
@property (strong, nonatomic) NSString* recipe;
@property (strong, nonatomic) NSURL* url;
@property (strong, nonatomic) NSMutableArray* ingrediants;

@end
