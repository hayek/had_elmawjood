//
//  HomeShelfViewController.m
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import "HomeShelfViewController.h"
#import "GlobalShelfViewController.h"
#import "MasterViewController.h"

@interface HomeShelfViewController ()
{
    IBOutlet UITableView *_tableView;
}
@end

@implementation HomeShelfViewController
@synthesize recipesButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage *buttonImage = [[UIImage imageNamed:@"whiteButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    // Set the background for any states you plan to use
    [self.recipesButton setBackgroundImage:buttonImage forState:UIControlStateNormal];

    if (self.homeIngridients == nil) {
        self.homeIngridients = [[NSMutableArray alloc] init];
    }
    
    if (self.modelController == nil) {
        self.modelController = [[ModelController alloc] init];
    }
    [self.modelController loadIngrediantsFromJson];
    [self.modelController loadRecipesFromJson];
    if (_ingrediants == nil) {
        _ingrediants = [self.modelController ingrediants];
    }
}

- (void)viewDidUnload
{
    [self setRecipesButton:nil];
    _tableView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    int i =1;
    if ([self.homeIngridients count] % 2 == 0) {
        i = 0;
    }
    
    int rows = [self.homeIngridients count]/2 + i;
    
    if (rows < 4) {
        rows = 4;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HomeCell";
    HomeShelfCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ([self.homeIngridients count] > indexPath.row*2) {
        Ingredient* ingredient = [self.homeIngridients objectAtIndex:indexPath.row*2];
        if (ingredient) {
            UIImage* ingredientImage = [UIImage imageNamed:ingredient.name];
            if (ingredientImage) {
                [cell.hleftItem setImage:ingredientImage forState:UIControlStateNormal];
            }else{
                [cell.hrightItem setImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
            }
        }
        if ([self.homeIngridients count] > indexPath.row*2 + 1) {
            ingredient = [self.homeIngridients objectAtIndex:indexPath.row*2 + 1];
            if (ingredient) {
                UIImage* ingredientImage = [UIImage imageNamed:ingredient.name];
                if (ingredientImage) {
                    [cell.hrightItem setImage:ingredientImage forState:UIControlStateNormal];
                }else{
                    [cell.hrightItem setImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
                }
            }
        }else{
            [cell.hrightItem setImage:nil forState:UIControlStateNormal];
        }

    }else{
        [cell.hleftItem setImage:nil forState:UIControlStateNormal];
        [cell.hrightItem setImage:nil forState:UIControlStateNormal];
    }

    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"globalShelf"])
    {
        UINavigationController* navCtrl = segue.destinationViewController;
        GlobalShelfViewController* globalShelfViewController = [navCtrl.childViewControllers objectAtIndex:0];
        if (globalShelfViewController) {
            [globalShelfViewController setModelController:self.modelController];
            [globalShelfViewController setIngrediants:self.ingrediants];
            [globalShelfViewController setHomeIngredients:self.homeIngridients];
        }
    }
    if ([segue.identifier isEqualToString:@"MasterView"])
    {
        UINavigationController* navCtrl = segue.destinationViewController;
        MasterViewController* masterViewController = [navCtrl.childViewControllers objectAtIndex:0];
        if (masterViewController) {
            [self.modelController setIngrediants:self.homeIngridients];
            [masterViewController setModelController:self.modelController];
            [masterViewController setRecepies:[self.modelController getRecipesWithIngrediants]];
        }
    }
}

@end
