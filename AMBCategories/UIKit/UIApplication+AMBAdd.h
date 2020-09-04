//
//  UIApplication+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIApplication (AMBAdd)

/**
 发布版本号
 */
@property (nonatomic, readonly) NSString *amb_appVersion;

/**
 内部版本号
 */
@property (nonatomic, readonly) NSString *amb_appBuildVersion;

/**
 应用唯一标记(通过获取uuid并保存下来，每个app的标记都不一样)
 */
@property (nonatomic, readonly) NSString *amb_appUniqueSign;

@end
