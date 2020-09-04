//
//  NSTimer+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (AMBAdd)

/**
 创建NSTimer
 
 @param seconds 秒数
 @param block 回调block
 @param repeats 是否重复
 @return NSTimer
 */
+ (NSTimer *)amb_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

/**
 创建NSTimer
 
 @param seconds 秒数
 @param block 回调block
 @param repeats 是否重复
 @return NSTimer
 */
+ (NSTimer *)amb_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

@end
