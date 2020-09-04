//
//  UIViewController+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIViewController (AMBAdd)

/**
 根视图，用于获取keyWindow的rootViewController的view
 
 @return 根视图，找不到的话返回nil
 */
- (UIView *)amb_rootView;

/**
 载入nib文件并返回UIViewcontroller实例(nib文件名与类名相同)
 
 @return UIViewcontroller实例
 */
+ (instancetype)amb_viewControllerWithClassNamedNib;

/**
 载入nib文件并返回UIViewcontroller实例
 
 @param nibName nib文件名
 @return UIViewcontroller实例
 */
+ (instancetype)amb_viewControllerWithNibName:(NSString *)nibName;

/**
 载入nib文件并返回UIViewcontroller实例
 
 @param nibName nib文件名
 @param bundleName bundle文件名
 @return UIViewcontroller实例
 */
+ (instancetype)amb_viewControllerWithNibName:(NSString *)nibName bundleName:(NSString *)bundleName;

/**
 根据键盘位置移动view的位置
 
 @param view 要移动的view
 @param notification 键盘通知
 @param up 上移为YES，下移为NO
 */
- (void)amb_moveView:(UIView *)view forKeyboardNotification:(NSNotification *)notification up:(BOOL)up;

@end
