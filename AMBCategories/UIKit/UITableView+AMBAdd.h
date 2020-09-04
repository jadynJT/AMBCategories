//
//  UITableView+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UITableView (AMBAdd)

/**
 注册UITableView所需的cell(nib文件名与类名相同)
 
 @param nibClass nib文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithClass:(Class)nibClass forCellWithReuseIdentifier:(NSString *)identifier;

/**
 注册UITableView所需的cell(nib文件名与类名相同)
 
 @param nibClass nib文件名
 @param bundleName bundle文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithClass:(Class)nibClass bundleName:(NSString *)bundleName forCellWithReuseIdentifier:(NSString *)identifier;

/**
 注册UITableView所需的cell
 
 @param nibName nib文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithNibName:(NSString *)nibName forCellWithReuseIdentifier:(NSString *)identifier;

/**
 注册UITableView所需的cell
 
 @param nibName nib文件名
 @param bundleName bundle文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithNibName:(NSString *)nibName bundleName:(NSString *)bundleName forCellWithReuseIdentifier:(NSString *)identifier;

@end
