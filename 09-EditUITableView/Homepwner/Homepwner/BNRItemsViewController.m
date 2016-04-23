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

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

// UITableViewController 的指定初始化方法是 initWithStyle:
- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
//        for (int i=0; i<10; i++) {
//            [[BNRItemStore sharedStore] createItem];
//        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
//    self.tableView.tableHeaderView = header;
}

- (IBAction)addNewItem:(id)sender {
    // 创建 NSIndexPath 对象，代表的位置是：第一个表格段，最后一个表格行
//    NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    
    // 创建新的 BNRItem 对象并将其加入到 BNRItemStore 对象
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];

    // 获取新创建的对象在 allItems 数组中的索引
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // 将新行插入 UITableView 对象
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingModel:(id)sender {
    // 若已经处于编辑模式
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES]; //关闭编辑模式
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES]; //开启编辑模式
    }
}

- (UIView *)headerView {
    // 如果还没有载入 headerview ...
    if (!_headerView) {
        // 载入 HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    return _headerView;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 2; //test
//}


#pragma mark 代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 2; //test
//    NSLog(@"hi");
//    NSLog(@"section-->%lu", section); //test
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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

/** 删除或插入行 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 如果 UITableView 对象请求确认的是删除操作……
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"Are you sure ?");
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        
        // 删除表格视图中的相应表格行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/** 移动一行 */
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];
}

/** 自定义删除确认按钮的标题(默认为 "Delete") */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

@end
