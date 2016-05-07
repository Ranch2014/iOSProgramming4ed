//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by 焦相如 on 4/8/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

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
    CGRect frame = [[UIScreen mainScreen] bounds];
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame]; //初始化时会调用 drawRect: 方法
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect; //设置边框样式
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self; //若无该句，则 textFieldShouldReturn 不会被调用
    
    [backgroundView addSubview:textField];
    
    self.view = backgroundView; //将 BNRHypnosisView 对象赋给视图控制器的 view 属性
}

/** 在屏幕随机位置绘制 20 个 UILabel 对象 */
- (void)drawHypnoticMessage:(NSString *)message {
    for (int i=0; i<20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // 设置 UILabel 对象的文字和颜色
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor orangeColor];
        messageLabel.text = message;
        
        // 根据需要显示的文字调整 UILabel 对象的大小
        [messageLabel sizeToFit];
        
        // 获取随机 x 坐标
        // 使 UILabel 对象的宽度不超过 BNRHypnosisViewController 的 view 宽度
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        // 获取随机 y 坐标
        // 使 UILabel 对象的高度不超过 BNRHypnosisViewController 的 view 高度
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @""; //清空文本内容
    [textField resignFirstResponder]; //放弃 firstResponder，关闭键盘。
    
    return YES;
}

//- (void)clearButtonTapped {
//    SEL clearSelector = @selector(textFieldShouldClear:);
//    
//    if ([self.de]) {
//        
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
