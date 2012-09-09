//
//  Ingredient.m
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient

-(id) initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    
    return self;
}

@end
