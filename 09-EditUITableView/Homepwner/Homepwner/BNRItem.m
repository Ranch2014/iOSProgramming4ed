//
//  BNRItem.m
//  RandomItems
//
//  Created by 焦相如 on 3/23/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];

//    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
//                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
//                            [randomNounList objectAtIndex:nounIndex]];

    // 使用下标访问
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10, //0-9 十个数字
                                    'A' + arc4random() % 26, //26 个字母
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;
}

// 初始化方法链
- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    // 调用父类的指定初始化方法
    self = [super init];
    
    // 父类的指定初始化方法是否成功创建了父类对象？
    if (self) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        
        // 设置 _dateCreated 的值为系统当前时间
        _dateCreated = [[NSDate alloc] init];
    }
    
    // 返回初始化后的对象的新地址
    return self;
}

- (void)setItemName:(NSString *)name
{
    _itemName = name;
}

- (NSString *)itemName
{
    return _itemName;
}

- (void)setSerialNumber:(NSString *)number
{
    _serialNumber = number;
}

- (NSString *)serialNumber
{
    return _serialNumber;
}

- (void)setValueInDollars:(int)dallors
{
    _valueInDollars = dallors;
}

- (int)valueInDollars
{
    return _valueInDollars;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}

// 重写 description 方法
- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@(%@): Worth $%d, recorded on: %@",
     self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    
    return descriptionString;
}

// 重写 dealloc 方法
- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
