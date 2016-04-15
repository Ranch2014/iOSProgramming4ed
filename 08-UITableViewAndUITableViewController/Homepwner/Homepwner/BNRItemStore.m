//
//  BNRItemStore.m
//  Homepwner
//
//  Created by 焦相如 on 4/13/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems; /**< 内部可变数组 */

@end

@implementation BNRItemStore

+ (instancetype)sharedStore {
    static BNRItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

/** 如果调用 [[BNRItemStore alloc] init]，就提示应该使用 [BNRItemStore sharedStore] */
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [BNRItemStore sharedStore]"
                                 userInfo:nil];
}

/** 这是真正的（私有的）初始化方法 */
- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BNRItem *)createItem {
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

/** 注意：方法返回值类型为 NSArray, 但实际返回的是 NSMutableArray 类型，这样是可以的；反之则不行 */
- (NSArray *)allItems {
    return self.privateItems;
}

@end
