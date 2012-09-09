//
//  ShelfCell.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ingredient.h"

@protocol buttonProtocol <NSObject>

-(void)ingredientClicked:(Ingredient*)ingredient;

@end

@interface ShelfCell : UITableViewCell

@property (strong, nonatomic) Ingredient* leftIngredient;
@property (strong, nonatomic) Ingredient* rightIngredient;

@property (strong, nonatomic) IBOutlet UIImageView *leftCheck;
@property (strong, nonatomic) IBOutlet UIImageView *rightCheck;


@property (strong, nonatomic) IBOutlet UIButton *leftItem;
@property (strong, nonatomic) IBOutlet UIButton *rightItem;

@property (assign) id <buttonProtocol> delegate;

- (IBAction)rightClicked:(id)sender;
- (IBAction)leftClicked:(id)sender;

@end
