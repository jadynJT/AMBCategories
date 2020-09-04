//
//  NSObject+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <objc/runtime.h>

#import "NSObject+AMBAdd.h"

static const int ambBlock_key;

@interface AMBObjectKVOBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(__weak id obj, id oldValue, id newValue);

@end

@implementation AMBObjectKVOBlockTarget

- (id)initWithBlock:(void (^)(__weak id obj, id oldValue, id newValue))block
{
    self = [super init];
    
    if (self)
    {
        self.block = block;
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.block)
    {
        return;
    }
    
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    
    if (oldValue == [NSNull null])
    {
        oldValue = nil;
    }
    
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    if (newValue == [NSNull null])
    {
        newValue = nil;
    }
    
    self.block(object, oldValue, newValue);
}

@end

@implementation NSObject (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 获取类名

 @return 类名
 */
+ (NSString *)amb_className
{
    return NSStringFromClass(self);
}

/**
 添加观察

 @param keyPath 观察的key
 @param block 回调
 */
- (void)amb_addObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(__weak id obj, id oldValue, id newValue))block
{
    if (!keyPath || keyPath.length == 0 || !block)
    {
        return;
    }
    
    AMBObjectKVOBlockTarget *target = [[AMBObjectKVOBlockTarget alloc] initWithBlock:block];
    NSMutableDictionary *dictionary = [self ambAllObjectObserverBlocks];
    NSMutableArray *array = dictionary[keyPath];
    
    if (!array)
    {
        array = [NSMutableArray new];
        dictionary[keyPath] = array;
    }
    
    [array addObject:target];
    [self addObserver:target forKeyPath:keyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
}

/**
 移除观察

 @param keyPath 观察的key
 */
- (void)amb_removeObserverBlocksForKeyPath:(NSString *)keyPath
{
    if (!keyPath || keyPath.length == 0)
    {
        return;
    }
    
    NSMutableDictionary *dictionary = [self ambAllObjectObserverBlocks];
    NSMutableArray *array = dictionary[keyPath];
    
    [array enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        
        [self removeObserver:obj forKeyPath:keyPath];
    }];
    
    [dictionary removeObjectForKey:keyPath];
}

/**
 移除所有观察
 */
- (void)amb_removeObserverBlocks
{
    NSMutableDictionary *dictionary = [self ambAllObjectObserverBlocks];
    
    [dictionary enumerateKeysAndObjectsUsingBlock: ^(NSString *key, NSArray *array, BOOL *stop) {
        
        [array enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
            
            [self removeObserver:obj forKeyPath:key];
        }];
    }];
    
    [dictionary removeAllObjects];
}

#pragma mark -
#pragma mark ==== 内部使用方法 ====
#pragma mark -

- (NSMutableDictionary *)ambAllObjectObserverBlocks
{
    NSMutableDictionary *dictionary = objc_getAssociatedObject(self, &ambBlock_key);
    
    if (!dictionary)
    {
        dictionary = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &ambBlock_key, dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return dictionary;
}

@end
