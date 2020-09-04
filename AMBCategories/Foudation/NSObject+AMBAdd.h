//
//  NSObject+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AMBAdd)

/**
 获取类名
 
 @return 类名
 */
+ (NSString *)amb_className;

/**
 添加观察
 
 @param keyPath 观察的key
 @param block 回调
 */
- (void)amb_addObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(__weak id obj, id oldValue, id newValue))block;

/**
 移除观察
 
 @param keyPath 观察的key
 */
- (void)amb_removeObserverBlocksForKeyPath:(NSString *)keyPath;

/**
 移除所有观察
 */
- (void)amb_removeObserverBlocks;

@end
