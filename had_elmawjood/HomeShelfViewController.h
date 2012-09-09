//
//  HomeShelfViewController.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeShelfCell.h"
#import "ModelController.h"

@interface HomeShelfViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) ModelController* modelController;

@property (strong, nonatomic) NSMutableArray*  ingrediants;
@property (strong, nonatomic) NSMutableArray* homeIngridients;
@property (strong, nonatomic) IBOutlet UIButton *recipesButton;

@end
