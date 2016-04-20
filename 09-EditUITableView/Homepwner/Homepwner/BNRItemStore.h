//
//  BNRItemStore.h
//  Homepwner
//
//  Created by 焦相如 on 4/13/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore; // 这是一个类方法，前缀是 +，不是 -

- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
