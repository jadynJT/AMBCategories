//
//  NSDictionary+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (AMBAdd)

/**
 将字典转为json字符串
 
 @return 转化成功的话返回相应的json字符串，失败则返回nil
 */
- (NSString *)amb_jsonStringEncode;

/**
 判断是否包含指定的key
 
 @param key 指定的key
 @return 包含返回YES，否则返回NO
 */
- (BOOL)amb_containObjectForKey:(id)key;

@end
