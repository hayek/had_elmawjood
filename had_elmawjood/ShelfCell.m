//
//  ShelfCell.m
//  had_elmawjood
//
//  Created by black rabbit on 7/9/12.
//  Copyright (c) 2012 black rabbit. All rights reserved.
//

#import "ShelfCell.h"

@implementation ShelfCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)rightClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(ingredientClicked:)]) {
        if (self.rightCheck.hidden == YES) {
            [self.rightCheck setHidden:NO];
        }else{
            [self.rightCheck setHidden:YES];
        }
        [self.delegate ingredientClicked:self.rightIngredient];
    }
}

- (IBAction)leftClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(ingredientClicked:)]) {
        if (self.leftCheck.hidden == YES) {
            [self.leftCheck setHidden:NO];
        }else{
            [self.leftCheck setHidden:YES];
        }
        [self.delegate ingredientClicked:self.leftIngredient];
    }
}

@end
