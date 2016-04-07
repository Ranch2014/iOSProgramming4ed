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
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:self.view.bounds]; //这样写会全屏
//    firstView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:firstView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
