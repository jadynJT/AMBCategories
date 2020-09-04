//
//  NSDictionary+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "NSDictionary+AMBAdd.h"

@implementation NSDictionary (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 将字典转为json字符串
 
 @return 转化成功的话返回相应的json字符串，失败则返回nil
 */
- (NSString *)amb_jsonStringEncode
{
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        return !error ? [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] : nil;
    }
    
    return nil;
}

/**
 判断是否包含指定的key

 @param key 指定的key
 @return 包含返回YES，否则返回NO
 */
- (BOOL)amb_containObjectForKey:(id)key
{
    if (!key)
    {
        return NO;
    }
    
    return self[key] != nil ? YES : NO;
}

@end
