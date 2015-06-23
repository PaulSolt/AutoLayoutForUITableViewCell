//
//  CustomTableViewCell.m
//  FontTableView
//
//  Created by Paul on 3/20/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// CODE FIX layouts by setting the maxPreferredWidth on any UILabel that can be
//  multiline – you may have to do similar settings to other UI elements
//  This logic fixes the layout for any UILabels that don't go up to the margins, they
//  might be offset by a constraint that isn't the standard.

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];
    self.fontNameLabel.preferredMaxLayoutWidth = self.fontNameLabel.frame.size.width;
    self.quoteLabel.preferredMaxLayoutWidth = self.quoteLabel.frame.size.width;
}

@end
