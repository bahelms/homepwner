//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Barrett Helms on 6/14/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@implementation BNRItemsViewController

// Designated initializer
- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i=0; i < 5; i++)
            [[BNRItemStore sharedStore] createItem];
    }
    return self;
}


- (instancetype)initWithStyle:(UITableViewStyle)style { return [self init]; }


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}


#pragma mark - DataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                        forIndexPath:indexPath];
    cell.textLabel.text = [[[BNRItemStore sharedStore] allItems][indexPath.row] description];
    return cell;
}

@end
