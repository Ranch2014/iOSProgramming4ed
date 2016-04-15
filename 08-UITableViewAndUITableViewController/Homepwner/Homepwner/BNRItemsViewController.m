//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by 焦相如 on 4/13/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController () <UITableViewDataSource>

@end

@implementation BNRItemsViewController

// UITableViewController 的指定初始化方法是 initWithStyle:
- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i=0; i<10; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    // 创建或重用 UITableViewCell 对象
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
//    cell.contentView
    cell.textLabel.text = [item description];
//    cell.detailTextLabel.text = @"hello"; //contentView 包含的三个视图
//    cell.imageView;
    return cell;
}

@end
