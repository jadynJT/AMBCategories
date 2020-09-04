//
//  UINavigationItem+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UINavigationItem (AMBAdd)

/**
 添加左边的UIBarButtonItem
 
 @param leftBarButtonItem UIBarButtonItem实例
 */
- (void)amb_addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;

/**
 将左边的UIBarButtonItem置空
 */
- (void)amb_removeLeftBarButtonItem;

/**
 添加右边的UIBarButtonItem
 
 @param rightBarButtonItem UIBarButtonItem实例
 */
- (void)amb_addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;

/**
 将右边的UIBarButtonItem置空
 */
- (void)amb_removeRightBarButtonItem;

@end
