//
//  DetailViewController.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Recipe* recipe;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) IBOutlet UILabel *categoryLable;
@property (strong, nonatomic) IBOutlet UILabel *prepareTimeLable;
@property (strong, nonatomic) IBOutlet UILabel *cookTimeLable;
@property (strong, nonatomic) IBOutlet UILabel *servings;
@property (strong, nonatomic) IBOutlet UILabel *ingredienceLable;
@property (strong, nonatomic) IBOutlet UITextView *recipeTextView;
- (IBAction)playClicked:(id)sender;

@end
