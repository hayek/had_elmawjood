//
//  DetailViewController.h
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
