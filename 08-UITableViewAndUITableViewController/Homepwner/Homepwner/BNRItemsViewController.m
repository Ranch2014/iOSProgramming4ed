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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 2; //test
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 2; //test
//    NSLog(@"hi");
//    NSLog(@"section-->%lu", section); //test
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建 UITableViewCell 对象，风格使用默认的 UITableViewCellStyleDefault
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    // 创建或重用 UITableViewCell 对象
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // 获取 allItems 的第 n 个 BNRItem 对象，
    // 然后将该 BNRItem 对象的描述信息赋给 UITableViewCell 对象的 textLabel
    // 这里的 n 是该 UITableViewCell 对象所对应的表格行索引
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row]; //0-9
    
    NSLog(@"indexPath.row == %lu", indexPath.row);
    
    cell.textLabel.text = [item description];

    return cell;
}

@end
