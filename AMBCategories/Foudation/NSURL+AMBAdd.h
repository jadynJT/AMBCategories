//
//  NSURL+AMBAdd.h
//  AMBBaseFramework
//
//  Created by mahailin on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (AMBAdd)

/**
 根据给定的url以及参数字典, 生成NSURL类的实例
 
 @param urlString URL字符串
 @param dictionary 参数字典
 @return NSURL实例
 */
+ (instancetype)amb_urlWithString:(NSString *)urlString paramDictionary:(NSDictionary *)dictionary;

/**
 根据给定的url以及参数字典, 生成NSURL类的实例
 
 @param urlString URL字符串
 @param dictionary 参数字典
 @return NSURL实例
 */
- (instancetype)amb_initWithString:(NSString *)urlString paramDictionary:(NSDictionary *)dictionary;

@end
