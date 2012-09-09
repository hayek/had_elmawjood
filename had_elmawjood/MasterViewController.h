//
//  MasterViewController.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelController.h"


@interface MasterViewController : UITableViewController

@property (strong, nonatomic) NSArray* recepies;
@property (strong, nonatomic) ModelController* modelController;

- (IBAction)cancelClicked:(id)sender;

@end
