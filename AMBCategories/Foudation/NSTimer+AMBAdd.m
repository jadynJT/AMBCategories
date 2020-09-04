//
//  NSTimer+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "NSTimer+AMBAdd.h"

@implementation NSTimer (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 创建NSTimer

 @param seconds 秒数
 @param block 回调block
 @param repeats 是否重复
 @return NSTimer
 */
+ (NSTimer *)amb_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats
{
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(ambExecBlock:) userInfo:[block copy] repeats:repeats];
}

/**
 创建NSTimer
 
 @param seconds 秒数
 @param block 回调block
 @param repeats 是否重复
 @return NSTimer
 */
+ (NSTimer *)amb_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats
{
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(ambExecBlock:) userInfo:[block copy] repeats:repeats];
}

#pragma mark -
#pragma mark ==== 内部使用方法 ====
#pragma mark -

+ (void)ambExecBlock:(NSTimer *)timer
{
    if (timer.userInfo)
    {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

@end
