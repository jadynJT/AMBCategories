//
//  UIImage+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "UIImage+AMBAdd.h"
#import "NSString+AMBAdd.h"

@implementation UIImage (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 从指定的bundle文件名里获取图片
 
 @param name 图片名称(如test.png，test@2x.png，test@3x.png，test.jpg)。1、若是png格式且没包含@2x或者@3x，内部会按照scale自行补上；2、若是png格式且资源里只有一倍图，最终加载出来的是一倍图；3、若是不包含后缀，则默认其为png格式
 @param bundleName bundle文件名，若是为空，则默认为从[NSBundle mainBundle]里读取
 @return 指定的bundle名称里获取到的图片，找不到图片的话返回nil
 */
+ (UIImage *)amb_imageWithName:(NSString *)name bundleName:(NSString *)bundleName
{
    if ([NSString amb_isEmpty:name])
    {
        return nil;
    }
    
    NSString *imageName;
    NSString *imageType;
    
    NSRange range = [name rangeOfString:@"." options:NSBackwardsSearch];
    imageName = range.location != NSNotFound ? [name substringToIndex:range.location] : name;
    imageType = range.location != NSNotFound ? [name substringFromIndex:range.location + 1].lowercaseString : @"png";
    
    if ([imageType isEqualToString:@"png"] && (!([imageName amb_endWith:@"@2x"] || [imageName amb_endWith:@"@3x"])))
    {
        if (fabs([UIScreen mainScreen].scale - 2) < CGFLOAT_MIN)
        {
            imageName = [imageName stringByAppendingString:@"@2x"];
        }
        else if (fabs([UIScreen mainScreen].scale - 3) < CGFLOAT_MIN)
        {
            imageName = [imageName stringByAppendingString:@"@3x"];
        }
    }
    
    NSString *bundlePath = bundleName.length > 0 ? [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"] : @"";
    NSBundle *bundle = bundlePath.length > 0 ? [NSBundle bundleWithPath:bundlePath] : [NSBundle mainBundle];
    NSString *imagePath = [bundle pathForResource:imageName ofType:imageType];
    
    //若是2、3倍图找不到，试着查找下是否存在1倍图
    if ([imageType isEqualToString:@"png"] && [NSString amb_isEmpty:imagePath])
    {
        imageName = [imageName substringToIndex:imageName.length - 3];//去除后3位
        imagePath = [bundle pathForResource:imageName ofType:imageType];
    }
    
    return imagePath.length > 0 ? [UIImage imageWithContentsOfFile:imagePath] : nil;
}

/**
 为图片添加圆角，默认四个角都设置
 
 @param cornerRadius 角度
 @return 返回UIImage实例
 */
- (UIImage *)amb_imageWithCornerRadius:(CGFloat)cornerRadius
{
    return [self amb_imageWithCornerRadius:cornerRadius roundingCorners:UIRectCornerAllCorners];
}

/**
 为图片添加圆角，根据需要可以设置左上角、左下角、右上角、右下角
 
 @param cornerRadius 角度
 @param corners 圆角位置，可以为UIRectCornerTopLeft、UIRectCornerTopRight、UIRectCornerBottomLeft、UIRectCornerBottomRight、UIRectCornerAllCorners及其组合
 @return 返回UIImage实例
 */
- (UIImage *)amb_imageWithCornerRadius:(CGFloat)cornerRadius roundingCorners:(UIRectCorner)corners
{
    CGRect rect = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, 0)] addClip];
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 根据颜色、大小生成图片

 @param color 颜色
 @param size 大小
 @return UIImage实例
 */
+ (UIImage *)amb_imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (!color || size.width <= 0 || size.height <= 0)
    {
        return nil;
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 缩放图片
 
 @param size 大小
 @return 返回缩放后的图片
 */
- (UIImage *)amb_scaleImageSize:(CGSize)size
{
    if (size.width <= 0 || size.height <= 0)
    {
        return nil;
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    [self drawInRect:rect];
    UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaleImage;
}

@end
