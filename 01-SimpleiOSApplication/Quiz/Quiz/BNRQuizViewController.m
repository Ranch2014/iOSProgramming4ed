//
//  BNRQuizViewController.m
//  test
//
//  Created by 焦相如 on 3/22/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    // 调用父类实现的初始化方法 (为了确保用户在看到应用界面时，数组已经存储了所需的问题和答案，必须在 BNRQuizViewController 对象创建完毕之后立即创建数组)
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of China?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Beijing"];
    }
    
    // 返回新对象的地址
    return self;
}

- (IBAction)showQuestion:(id)sender {
    self.currentQuestionIndex ++; // 进入下一个问题
    
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0; // 回到第一个问题
    }

    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question; //Q: 这里的问题是从第一个开始的
    
    self.answerLabel.text = @"???"; // 设置答案字符串(即,显示答案后,再显示新问题时答案区域改为???)
}

- (IBAction)showAnswer:(id)sender {
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
