//
//  UINavigationItem+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/25.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "UINavigationItem+AMBAdd.h"

static const CGFloat kAMBBarButtonItemPadding = -8.0f;

typedef NS_ENUM(NSInteger, AMBBarButtonViewPosition)
{
    AMBBarButtonViewPositionLeft,
    AMBBarButtonViewPositionRight
};

@interface AMBBarButtonView : UIView

@property (nonatomic, assign) AMBBarButtonViewPosition position;
@property (nonatomic, assign) BOOL applied;

@end

@implementation AMBBarButtonView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.applied || [[[UIDevice currentDevice] systemVersion] doubleValue] < 11)
    {
        return;
    }
    
    if (@available(iOS 9.0, *))
    {
        UIView *view = self;
        
        while (![view isKindOfClass:[UINavigationBar class]] && [view superview] != nil)
        {
            view = [view superview];
            
            if ([view isKindOfClass:[UIStackView class]] && [view superview] != nil)
            {
                if (self.position == AMBBarButtonViewPositionLeft)
                {
                    for (NSLayoutConstraint *constraint in view.superview.constraints)
                    {
                        if ([constraint.firstItem isKindOfClass:[UILayoutGuide class]] &&
                            constraint.firstAttribute == NSLayoutAttributeLeading)
                        {
                            [view.superview removeConstraint:constraint];
                        }
                    }
                    
                    [view.superview addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                               attribute:NSLayoutAttributeLeading
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:view.superview
                                                                               attribute:NSLayoutAttributeLeading
                                                                              multiplier:1.0
                                                                                constant:8.0]];
                    
                    self.applied = YES;
                }
                else if (self.position == AMBBarButtonViewPositionRight)
                {
                    for (NSLayoutConstraint *constraint in view.superview.constraints)
                    {
                        if ([constraint.firstItem isKindOfClass:[UILayoutGuide class]] &&
                            constraint.firstAttribute == NSLayoutAttributeTrailing)
                        {
                            [view.superview removeConstraint:constraint];
                        }
                    }
                    
                    [view.superview addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                               attribute:NSLayoutAttributeTrailing
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:view.superview
                                                                               attribute:NSLayoutAttributeTrailing
                                                                              multiplier:1.0
                                                                                constant:-8.0]];
                    
                    self.applied = YES;
                }
                
                break;
            }
        }
    }
}

@end

#pragma mark -

@implementation UINavigationItem (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 添加左边的UIBarButtonItem

 @param leftBarButtonItem UIBarButtonItem实例
 */
- (void)amb_addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if (leftBarButtonItem.customView && [[[UIDevice currentDevice] systemVersion] floatValue] >= 11)
    {
        UIView *view = leftBarButtonItem.customView;
        AMBBarButtonView *barButtonView = [[AMBBarButtonView alloc] initWithFrame:view.bounds];
        view.center = barButtonView.center;
        barButtonView.position = AMBBarButtonViewPositionLeft;
        [barButtonView addSubview:view];
        [self setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:barButtonView]];
    }
    else
    {
        UIBarButtonItem *negativeSpacerItem = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil
                                               action:nil];
        
        negativeSpacerItem.width = kAMBBarButtonItemPadding;
        [self setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacerItem, leftBarButtonItem, nil]];
    }
}

/**
 将左边的UIBarButtonItem置空
 */
- (void)amb_removeLeftBarButtonItem
{
    self.leftBarButtonItem = nil;
    self.leftBarButtonItems = nil;
}

/**
 添加右边的UIBarButtonItem

 @param rightBarButtonItem UIBarButtonItem实例
 */
- (void)amb_addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if (rightBarButtonItem.customView && [[[UIDevice currentDevice] systemVersion] floatValue] >= 11)
    {
        UIView *view = rightBarButtonItem.customView;
        AMBBarButtonView *barButtonView = [[AMBBarButtonView alloc] initWithFrame:view.bounds];
        view.center = barButtonView.center;
        barButtonView.position = AMBBarButtonViewPositionRight;
        [barButtonView addSubview:view];
        [self setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:barButtonView]];
    }
    else
    {
        UIBarButtonItem *negativeSpacerItem = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil
                                               action:nil];
        
        negativeSpacerItem.width = kAMBBarButtonItemPadding;
        [self setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacerItem,rightBarButtonItem, nil]];
    }
}

/**
 将右边的UIBarButtonItem置空
 */
- (void)amb_removeRightBarButtonItem
{
    self.rightBarButtonItem = nil;
    self.rightBarButtonItems = nil;
}

@end
