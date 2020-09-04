//
//  AMBCategories.h
//  AMBCategories
//
//  Created by   马海林 on 2018/6/14.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG

#define AMBDebugLog(log, ...)   NSLog((@"%s [Line %d]" log), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define AMBWarnLog(log, ...)  NSLog((@"⚠️ %s [Line %d]" log), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define AMBErrorLog(log, ...)  NSLog((@"❌ %s [Line %d] " log), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define AMBDebugLog(log, ...)  ((void)0)
#define AMBWarnLog(log, ...)  ((void)0)
#define AMBErrorLog(log, ...)  ((void)0)

#endif

/**
 *  处理arc环境下调用performSelector:的警告
 *
 */
#define SUPPRESS_PERFORM_SELECTOR_LEAK_WARNING(code)                        \
_Pragma("clang diagnostic push")                                            \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")         \
code;                                                                       \
_Pragma("clang diagnostic pop")                                             \
((void)0)

//Foudation
#import "NSArray+AMBAdd.h"
#import "NSData+AMBAdd.h"
#import "NSString+AMBAdd.h"
#import "NSDate+AMBAdd.h"
#import "NSTimer+AMBAdd.h"
#import "NSDictionary+AMBAdd.h"
#import "NSObject+AMBAdd.h"
#import "NSURL+AMBAdd.h"

//UIKit
#import "UIApplication+AMBAdd.h"
#import "UIDevice+AMBAdd.h"
#import "UIImage+AMBAdd.h"
#import "UIColor+AMBAdd.h"
#import "UIView+AMBAdd.h"
#import "UIViewController+AMBAdd.h"
#import "UITableView+AMBAdd.h"
#import "UICollectionView+AMBAdd.h"
#import "UINavigationItem+AMBAdd.h"


