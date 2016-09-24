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
        
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        
//        [items insertObject:@"Zero" atIndex:0];
        
        // 快速枚举 (若需要在循环体中添加或删除对象，不能使用)
//        for (NSString *item in items) {
//            NSLog(@"%@", item);
//        }
        
//        BNRItem *item = [BNRItem randomItem];
//        NSLog(@"%@", item);
        
//        for (int i=0; i<5; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [items addObject:item];
//        }
        
        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        // 释放 items 所指向的 NSMutableArray 对象
        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}
