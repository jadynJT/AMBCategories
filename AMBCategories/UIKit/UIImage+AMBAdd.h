//
//  UIImage+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (AMBAdd)

/**
 从指定的bundle文件名里获取图片
 
 @param name 图片名称(如test.png，test@2x.png，test@3x.png，test.jpg)。1、若是png格式且没包含@2x或者@3x，内部会按照scale自行补上；2、若是png格式且资源里只有一倍图，最终加载出来的是一倍图；3、若是不包含后缀，则默认其为png格式
 @param bundleName bundle文件名，若是为空，则默认为从[NSBundle mainBundle]里读取
 @return 指定的bundle名称里获取到的图片，找不到图片的话返回nil
 */
+ (UIImage *)amb_imageWithName:(NSString *)name bundleName:(NSString *)bundleName;

/**
 为图片添加圆角，默认四个角都设置
 
 @param cornerRadius 角度
 @return 返回UIImage实例
 */
- (UIImage *)amb_imageWithCornerRadius:(CGFloat)cornerRadius;

/**
 为图片添加圆角，根据需要可以设置左上角、左下角、右上角、右下角
 
 @param cornerRadius 角度
 @param corners 圆角位置，可以为UIRectCornerTopLeft、UIRectCornerTopRight、UIRectCornerBottomLeft、UIRectCornerBottomRight、UIRectCornerAllCorners及其组合
 @return 返回UIImage实例
 */
- (UIImage *)amb_imageWithCornerRadius:(CGFloat)cornerRadius roundingCorners:(UIRectCorner)corners;

/**
 根据颜色、大小生成图片
 
 @param color 颜色
 @param size 大小
 @return UIImage实例
 */
+ (UIImage *)amb_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 缩放图片
 
 @param size 大小
 @return 返回缩放后的图片
 */
- (UIImage *)amb_scaleImageSize:(CGSize)size;

@end
