//
//  UIColor+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "UIColor+AMBAdd.h"

@implementation UIColor (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 判断颜色是否相同

 @param color 颜色
 @return 相同返回YES，否则返回NO
 */
- (BOOL)amb_isTheSameColor:(UIColor *)color
{
    return CGColorEqualToColor(self.CGColor, color.CGColor) ? YES : NO;
}

@end
