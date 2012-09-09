//
//  DetailViewController.m
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import "DetailViewController.h"
#import "Ingredient.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item
@synthesize categoryLable;
@synthesize prepareTimeLable;
@synthesize cookTimeLable;
@synthesize servings;
@synthesize ingredienceLable;
@synthesize recipeTextView;

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationItem setTitle:self.recipe.name];
    [self.categoryLable setText:self.recipe.category];
    [self.prepareTimeLable setText:self.recipe.prepareTime];
    [self.cookTimeLable setText:self.recipe.cookTime];
    [self.servings setText:self.recipe.servings];
    NSMutableString* ingridiants = [[NSMutableString alloc] init];
    for (Ingredient* ing in self.recipe.ingrediants) {
        [ingridiants appendFormat:@"%@. ",ing.name];
    }
    [self.ingredienceLable setText:ingridiants];
    [self.recipeTextView setText:self.recipe.recipe];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setCategoryLable:nil];
    [self setPrepareTimeLable:nil];
    [self setCookTimeLable:nil];
    [self setServings:nil];
    [self setIngredienceLable:nil];
    [self setRecipeTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)playClicked:(id)sender {
    NSString *stringURL = @"http://www.youtube.com/watch?v=lSyOUhHzIoQ";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}
@end
