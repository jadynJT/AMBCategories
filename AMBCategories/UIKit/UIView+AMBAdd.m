//
//  UIView+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "UIView+AMBAdd.h"
#import "NSString+AMBAdd.h"

@implementation UIView (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 截图当前view为image

 @return image
 */
- (UIImage *)amb_snapshotImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}

/**
 遍历出当前view所在的viewcontroller

 @return 当前view所在的viewcontroller，找不到的话返回nil
 */
- (UIViewController *)amb_viewController
{
    for (UIView *view = self; view != nil; view = view.superview)
    {
        if ([view.nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)(view.nextResponder);
        }
    }
    
    return nil;
}

/**
 载入nib文件并返回UIView的实例(nib文件名与类名相同)

 @return UIView的实例，失败返回nil
 */
+ (instancetype)amb_viewWithClassNamedNib
{
    return [[self class] amb_viewWithNibName:NSStringFromClass([self class]) bundleName:nil];
}

/**
 载入nib文件并返回UIView的实例

 @param nibName nib文件名
 @return UIView的实例，失败返回nil
 */
+ (instancetype)amb_viewWithNibName:(NSString *)nibName
{
    return [[self class] amb_viewWithNibName:nibName bundleName:nil];
}

/**
 载入nib文件并返回UIView的实例

 @param nibName nib文件名
 @param bundleName bundle文件名
 @return UIView的实例，失败返回nil
 */
+ (instancetype)amb_viewWithNibName:(NSString *)nibName bundleName:(NSString *)bundleName
{
    if ([NSString amb_isEmpty:nibName])
    {
        return nil;
    }
    
    NSString *bundlePath = bundleName.length > 0 ? [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"] : @"";
    NSBundle *bundle = bundlePath.length > 0 ? [NSBundle bundleWithPath:bundlePath] : [NSBundle mainBundle];
    NSArray *viewArray = [bundle loadNibNamed:nibName owner:self options:nil];
    
    if (viewArray.count > 0 && [viewArray[0] isKindOfClass:[self class]])
    {
        return viewArray[0];
    }
    
    return nil;
}

@end
