//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by 焦相如 on 5/9/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView {
//    self.view = [[BNRDrawView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]; //有用吗？
    self.view = [[BNRDrawView alloc] init]; //有用吗？
}

@end
