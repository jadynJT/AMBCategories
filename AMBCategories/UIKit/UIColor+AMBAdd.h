//
//  UIColor+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 供16进制的颜色值使用

 @param rgbValue 16进制的色值
 @return UIColor
 */
#define AMBUIColorFromRGB(rgbValue) [UIColor colorWithRed:((rgbValue >> 16) & 0xFF) / 255.f green:((rgbValue >> 8) & 0xFF) / 255.f blue:(rgbValue & 0xFF) / 255.f alpha:1.0f]

/**
 供16进制的颜色值使用

 @param rgbValue 16进制的色值
 @param a 透明度，值为0到1
 @return UIColor
 */
#define AMBUIColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((rgbValue >> 16) & 0xFF) / 255.f green:((rgbValue >> 8) & 0xFF) / 255.f blue:(rgbValue & 0xFF) / 255.f alpha:a]

@interface UIColor (AMBAdd)

/**
 判断颜色是否相同
 
 @param color 颜色
 @return 相同返回YES，否则返回NO
 */
- (BOOL)amb_isTheSameColor:(UIColor *)color;

@end
