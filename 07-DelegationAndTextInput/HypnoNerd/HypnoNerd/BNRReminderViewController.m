//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by 焦相如 on 4/8/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Reminder";
        
        UIImage *i = [UIImage imageNamed:@"Time"];
        self.tabBarItem.image = i;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *notetification = [[UILocalNotification alloc] init];
    
    notetification.timeZone = [NSTimeZone defaultTimeZone]; //使用本地时区
    notetification.fireDate = date;
    
    notetification.alertBody = @"Hypnotize me!"; //设置提醒的文字内容
//    notetification.fireDate = date;
    
    notetification.soundName = UILocalNotificationDefaultSoundName; //通知提示音，使用默认的
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notetification]; //将通知添加到系统中
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"BNRReminderViewController loaded its view.");
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
