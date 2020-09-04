//
//  UICollectionView+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "UICollectionView+AMBAdd.h"
#import "NSString+AMBAdd.h"

@implementation UICollectionView (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 注册UICollectionView所需的cell(nib文件名与类名相同)
 
 @param nibClass nib文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithClass:(Class)nibClass forCellWithReuseIdentifier:(NSString *)identifier
{
    [self amb_registerNibWithNibName:NSStringFromClass(nibClass) bundleName:nil forCellWithReuseIdentifier:identifier];
}

/**
 注册UICollectionView所需的cell(nib文件名与类名相同)
 
 @param nibClass nib文件名
 @param bundleName bundle文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithClass:(Class)nibClass bundleName:(NSString *)bundleName forCellWithReuseIdentifier:(NSString *)identifier
{
    [self amb_registerNibWithNibName:NSStringFromClass(nibClass) bundleName:bundleName forCellWithReuseIdentifier:identifier];
}

/**
 注册UICollectionView所需的cell
 
 @param nibName nib文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithNibName:(NSString *)nibName forCellWithReuseIdentifier:(NSString *)identifier
{
    [self amb_registerNibWithNibName:nibName bundleName:nil forCellWithReuseIdentifier:identifier];
}

/**
 注册UICollectionView所需的cell
 
 @param nibName nib文件名
 @param bundleName bundle文件名
 @param identifier 标记
 */
- (void)amb_registerNibWithNibName:(NSString *)nibName bundleName:(NSString *)bundleName forCellWithReuseIdentifier:(NSString *)identifier
{
    if ([NSString amb_isEmpty:nibName] || [NSString amb_isEmpty:identifier])
    {
        return;
    }
    
    NSString *bundlePath = bundleName.length > 0 ? [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"] : @"";
    NSBundle *bundle = bundlePath.length > 0 ? [NSBundle bundleWithPath:bundlePath] : [NSBundle mainBundle];
    [self registerNib:[UINib nibWithNibName:nibName bundle:bundle] forCellWithReuseIdentifier:identifier];
}

@end
