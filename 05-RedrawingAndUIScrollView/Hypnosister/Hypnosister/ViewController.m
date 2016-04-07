//
//  ViewController.m
//  Hypnosister
//
//  Created by 焦相如 on 4/3/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:CGRectMake(160, 240, 100, 150)];
    
    // bounds 表示的矩形位于自己的坐标系，而 frame 表示的矩形位于父视图的坐标系
//    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:self.view.bounds]; //这样写会全屏
    
//    [self.view addSubview:firstView];
    
    
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
//    bigRect.size.height *= 2.0;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [scrollView setPagingEnabled:YES]; //分页显示
    [self.view addSubview:scrollView];
    
//    BNRHypnosisView *hy = [[BNRHypnosisView alloc] initWithFrame:bigRect];
//    [scrollView addSubview:hy];
    BNRHypnosisView *hy = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hy];
    
    
    screenRect.origin.x += screenRect.origin.x + screenRect.size.width;
    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
    
    scrollView.contentSize = bigRect.size; //告诉 UIScrollView 对象“取景”范围多大
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
