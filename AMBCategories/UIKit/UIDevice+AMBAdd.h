//
//  UIDevice+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIDevice (AMBAdd)

/**
 设备机器型号名称
 */
@property (nonatomic, readonly) NSString *amb_machineModelName;

/**
 获取系统版本号
 
 @return 系统版本号
 */
+ (NSString *)amb_getSystemVersion;

/**
 获取系统主版本号
 
 @return 系统主版本号(如系统版本号为8.1，则取出的系统主版本号为8)
 */
+ (NSString *)amb_getSystemMainVersion;

@end
