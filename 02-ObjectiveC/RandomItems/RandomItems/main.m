//
//  main.m
//  RandomItems
//
//  Created by 焦相如 on 3/23/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        [items insertObject:@"Zero" atIndex:0];
        
        // 快速枚举 (若需要在循环体中添加或删除对象，不能使用)
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
//        int a = 1;
//        NSLog(@"%d", a);
        
//        BNRItem *item = [[BNRItem alloc] init];
//        
//        [item setItemName:@"Red Sofa"];
//        [item setSerialNumber:@"GA21y19h"];
//        [item setValueInDollars:29];
//        
//        // 点语法 (推荐)
//        item.itemName = @"chair";
//        item.serialNumber = @"shai180";
//        item.valueInDollars = 19;
        
//        NSLog(@"%@, %@, %@, %d", [item itemName], [item dateCreated],
//              [item serialNumber], [item valueInDollars]);
        
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa"
//                                           valueInDollars:100
//                                             serialNumber:@"shau187"];
//
////        BNRItem *item = [[BNRItem alloc] init];
//        
//        NSLog(@"%@, %@, %@, %d", item.itemName, item.dateCreated,
//              item.serialNumber, item.valueInDollars);
//        NSLog(@"%@", item);
        
//        NSDate *time = [[NSDate alloc] init];
//        NSLog(@"%@", time); //当前时间 (8小时时差？？)
        
        // 创建 10 个对象测试
//        for (int i=0; i<10; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [items addObject:item];
//        }
        
        // test Exception (unrecognized selector)
//        id lastObj = [items lastObject];
//        [lastObj count];
        
        
//        for (BNRItem *item in items) {
//            NSLog(@"%@", item);
//        }


//        int value = arc4random() % 10;
//        for (int i=0; i<20; i++) {
////            [arr addObject: arc4random() % 10];
//            int value = arc4random() % 10;
//            NSLog(@"%d", value);
//        }
        
        
        
        
        BNRItem *item = [BNRItem randomItem];
        NSLog(@"%@", item);
        
//        item = nil; // autoreleasepool 里面，自动释放
        
        // 释放 items 所指向的 NSMutableArray 对象
        items = nil;
    }
    return 0;
}
