//
//  GlobalShelfViewController.m
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import "GlobalShelfViewController.h"
#import "Ingredient.h"


@interface GlobalShelfViewController ()

@end

@implementation GlobalShelfViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (self.modelController == nil) {
        self.modelController = [[ModelController alloc] init];
    }
    
//    [self.modelController loadIngrediantsFromJson];
//    if (_ingrediants == nil) {
//        _ingrediants = [self.modelController ingrediants].allObjects;
//    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    if ([_ingrediants count] % 2 == 0) {
        i = 0;
    }
    
    int rows = [_ingrediants count]/2 + i;
    
    if (rows < 4) {
        rows = 4;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ShelfCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ([_ingrediants count] > indexPath.row*2) {
        Ingredient* ingredient = [_ingrediants objectAtIndex:indexPath.row*2];
        if (ingredient) {
            UIImage* ingredientImage = [UIImage imageNamed:ingredient.name];
            if (ingredientImage) {
                [cell.leftItem setImage:ingredientImage forState:UIControlStateNormal];
            }else{
                [cell.leftItem setImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
            }
            [cell setLeftIngredient:ingredient];
            
            if ([self.homeIngredients containsObject:ingredient]) {
                [cell.leftCheck setHidden:NO];
            }else{
                [cell.leftCheck setHidden:YES];
            }
        }
        if ([_ingrediants count] > indexPath.row*2 + 1) {
            ingredient = [_ingrediants objectAtIndex:indexPath.row*2 + 1];
            if (ingredient) {
                UIImage* ingredientImage = [UIImage imageNamed:ingredient.name];
                if (ingredientImage) {
                    [cell.rightItem setImage:ingredientImage forState:UIControlStateNormal];
                }else{
                    [cell.rightItem setImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
                }
                [cell setRightIngredient:ingredient];
                
                if ([self.homeIngredients containsObject:ingredient]) {
                    [cell.rightCheck setHidden:NO];
                }else{
                    [cell.rightCheck setHidden:YES];
                }
            }
        }else{
            [cell.rightItem setImage:nil forState:UIControlStateNormal];
        }
    }else{
        [cell.leftItem setImage:nil forState:UIControlStateNormal];
        [cell.rightItem setImage:nil forState:UIControlStateNormal];
    }
    
    cell.delegate = self;
    
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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

- (IBAction)doneClicked:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

-(void)ingredientClicked:(Ingredient *)ingredient
{
    //add to home
    if (ingredient) {
        if ([self.homeIngredients containsObject:ingredient] == NO) {
            [self.homeIngredients addObject:ingredient];
        }else{
            [self.homeIngredients removeObject:ingredient];
        }
    }
}


@end
