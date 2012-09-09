//
//  GlobalShelfViewController.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelController.h"
#import "ShelfCell.h"


@interface GlobalShelfViewController : UITableViewController <buttonProtocol>

@property (strong, nonatomic) NSArray*  ingrediants;
@property (strong, nonatomic) NSMutableArray* homeIngredients;
@property (strong, nonatomic) ModelController* modelController;

- (IBAction)doneClicked:(id)sender;

@end
