//
//  UIViewController+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "UIViewController+AMBAdd.h"
#import "NSString+AMBAdd.h"

@implementation UIViewController (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 根视图，用于获取keyWindow的rootViewController的view

 @return 根视图，找不到的话返回nil
 */
- (UIView *)amb_rootView
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    if (keyWindow.rootViewController)
    {
        return keyWindow.rootViewController.view;
    }
    
    return nil;
}

/**
 载入nib文件并返回UIViewcontroller实例(nib文件名与类名相同)

 @return UIViewcontroller实例
 */
+ (instancetype)amb_viewControllerWithClassNamedNib
{
    return [[self class] amb_viewControllerWithNibName:NSStringFromClass([self class]) bundleName:nil];
}

/**
 载入nib文件并返回UIViewcontroller实例

 @param nibName nib文件名
 @return UIViewcontroller实例
 */
+ (instancetype)amb_viewControllerWithNibName:(NSString *)nibName
{
    return [[self class] amb_viewControllerWithNibName:nibName bundleName:nil];
}

/**
 载入nib文件并返回UIViewcontroller实例

 @param nibName nib文件名
 @param bundleName bundle文件名
 @return UIViewcontroller实例
 */
+ (instancetype)amb_viewControllerWithNibName:(NSString *)nibName bundleName:(NSString *)bundleName
{
    if ([NSString amb_isEmpty:nibName])
    {
        return nil;
    }
    
    NSString *bundlePath = bundleName.length > 0 ? [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"] : @"";
    NSBundle *bundle = bundlePath.length > 0 ? [NSBundle bundleWithPath:bundlePath] : [NSBundle mainBundle];
    return [[self alloc] initWithNibName:nibName bundle:bundle];
}

/**
 根据键盘位置移动view的位置

 @param view 要移动的view
 @param notification 键盘通知
 @param up 上移为YES，下移为NO
 */
- (void)amb_moveView:(UIView *)view forKeyboardNotification:(NSNotification *)notification up:(BOOL)up
{
    NSDictionary *userInfo = notification.userInfo;
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    CGRect newFrame = view.frame;
    CGRect keyboardFrame = [self.view convertRect:keyboardEndFrame toView:nil];
    newFrame.origin.y -= keyboardFrame.size.height * (up? 1 : -1);
    view.frame = newFrame;
    [UIView commitAnimations];
}

@end
