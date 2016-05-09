//
//  BNRImageStore.m
//  Homepwner
//
//  Created by 焦相如 on 5/8/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;
@end

@implementation BNRImageStore

+ (instancetype)sharedStore {
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

/** 不允许直接调用 init 方法 */
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [BNRImageStore sharedStore]"
                                 userInfo:nil];
}

/** 私有初始化方法 */
- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
//    [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image; //二者等效
}

- (UIImage *)imageForKey:(NSString *)key {
//    return [self.dictionary objectForKey:key];
    return self.dictionary[key]; //效果同上
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
