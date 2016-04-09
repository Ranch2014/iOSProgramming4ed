//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by 焦相如 on 4/8/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize"; // 设置标签项的标题
        
        UIImage *i = [UIImage imageNamed:@"Hypno"];
        self.tabBarItem.image = i;
    }
    return self;
}

- (void)loadView {
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init]; //初始化时会调用 drawRect: 方法
    self.view = backgroundView; //将 BNRHypnosisView 对象赋给视图控制器的 view 属性
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
