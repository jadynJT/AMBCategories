//
//  UIView+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (AMBAdd)

/**
 截图当前view为image
 
 @return image
 */
- (UIImage *)amb_snapshotImage;

/**
 遍历出当前view所在的viewcontroller
 
 @return 当前view所在的viewcontroller，找不到的话返回nil
 */
- (UIViewController *)amb_viewController;

/**
 载入nib文件并返回UIView的实例(nib文件名与类名相同)
 
 @return UIView的实例，失败返回nil
 */
+ (instancetype)amb_viewWithClassNamedNib;

/**
 载入nib文件并返回UIView的实例
 
 @param nibName nib文件名
 @return UIView的实例，失败返回nil
 */
+ (instancetype)amb_viewWithNibName:(NSString *)nibName;

/**
 载入nib文件并返回UIView的实例
 
 @param nibName nib文件名
 @param bundleName bundle文件名
 @return UIView的实例，失败返回nil
 */
+ (instancetype)amb_viewWithNibName:(NSString *)nibName bundleName:(NSString *)bundleName;

@end
