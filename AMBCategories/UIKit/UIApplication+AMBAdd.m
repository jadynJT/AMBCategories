//
//  UIApplication+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "UIApplication+AMBAdd.h"
#import "NSString+AMBAdd.h"

@implementation UIApplication (AMBAdd)

#pragma mark -
#pragma mark ==== 数据初始化 ====
#pragma mark -

- (NSString *)amb_appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)amb_appBuildVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

- (NSString *)amb_appUniqueSign
{
    NSString *appUniqueSign = [[NSUserDefaults standardUserDefaults] objectForKey:@"appUniqueSign"];
    
    if ([NSString amb_isEmpty:appUniqueSign])
    {
        appUniqueSign = [NSString amb_createUUID];
        [[NSUserDefaults standardUserDefaults] setObject:appUniqueSign forKey:@"appUniqueSign"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return appUniqueSign;
}

@end
