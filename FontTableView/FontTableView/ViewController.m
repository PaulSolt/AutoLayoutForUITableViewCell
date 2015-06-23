//
//  ViewController.m
//  FontTableView
//
//  Created by Paul on 3/20/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    
    NSMutableArray *_fontArray;
    NSMutableArray *_quoteArray;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CustomTableViewCell *customCell;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _fontArray = [[UIFont familyNames] mutableCopy];
    for(int i = 0; i < 100; i++) {
        [_fontArray addObjectsFromArray:[UIFont familyNames]];
    }
    NSLog(@"Size: %d", [_fontArray count]);
    
    _quoteArray = [@[@"For the past 33 years, I have looked in the mirror every morning and asked myself: 'If today were the last day of my life, would I want to do what I am about to do today?' And whenever the answer has been 'No' for too many days in a row, I know I need to change something. -Steve Jobs",
                     @"Be a yardstick of quality. Some people aren't used to an environment where excellence is expected. - Steve Jobs",
                     @"Innovation distinguishes between a leader and a follower. -Steve Jobs"] mutableCopy];
    
 
    // Use iOS 8 new auto sizing feature for heights (don't need to calculate yourself)
//    _tableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_fontArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    cell.fontNameLabel.text = _fontArray[indexPath.row];
    
    int quoteIndex = indexPath.row % [_quoteArray count];
    cell.quoteLabel.text = _quoteArray[quoteIndex];
    NSString *fontName = _fontArray[indexPath.row];
    cell.quoteLabel.font = [UIFont fontWithName:fontName size:17];
    return cell;
    
}

// NOTE: in iOS 8 you can use the automatic height calculations from AutoLayout,
//  and you can avoid writing this height method. Just comment it out, and uncomment
//  the line in viewDidLoad for
//  _tableView.rowHeight = UITableViewAutomaticDimension;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Calculate a height based on a cell
    if(!self.customCell) {
        self.customCell = [self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    // Configure the cell
    self.customCell.fontNameLabel.text = _fontArray[indexPath.row];
    
    int quoteIndex = indexPath.row % [_quoteArray count];
    self.customCell.quoteLabel.text = _quoteArray[quoteIndex];
    NSString *fontName = _fontArray[indexPath.row];
    self.customCell.quoteLabel.font = [UIFont fontWithName:fontName size:17];

    
    // Layout the cell
    
    [self.customCell layoutIfNeeded];
    
    // Get the height for the cell

    CGFloat height = [self.customCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // Padding of 1 point (cell separator)
    CGFloat separatorHeight = 1;

    return height + separatorHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 140;
    
}

@end
