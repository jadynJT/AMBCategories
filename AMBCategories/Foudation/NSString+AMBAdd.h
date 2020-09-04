//
//  NSString+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/23.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (AMBAdd)

/**
 创建uuid

 @return uuid字符串
 */
+ (NSString *)amb_createUUID;

/**
 判断字符串是否为空(字符串为nil或者长度为0即为空)
 
 @param string 字符串
 @return 为空返回YES，否则返回NO
 */
+ (BOOL)amb_isEmpty:(NSString *)string;

/**
 去除字符串首、尾的空白字符串跟换行符
 
 @return 去除字符串首、尾的空白字符串跟换行符后的字符串
 */
- (NSString *)amb_trim;

/**
 移除字符串中所有的空格
 
 @return 移除所有空格后的字符串
 */
- (NSString *)amb_removeAllWhiteSpace;

/**
 判断是否包含指定的字符串，默认忽略字母大小写
 
 @param string 指定的字符串
 @return 包含返回YES，否则返回NO
 */
- (BOOL)amb_containString:(NSString *)string;

/**
 判断是否包含指定的字符串
 
 @param string 指定的字符串
 @param compareOption 字符串比较选项
 @return 包含返回YES，否则返回NO
 */
- (BOOL)amb_containString:(NSString *)string options:(NSStringCompareOptions)compareOption;

/**
 判断是否以给定的字符串开始，默认忽略字母大小写
 
 @param string 给定字符串
 @return 是-YES，否-NO
 */
- (BOOL)amb_startWith:(NSString *)string;

/**
 判断是否以给定的字符串开始
 
 @param string 给定字符串
 @param compareOption 字符串比较选项
 @return 是-YES，否-NO
 */
- (BOOL)amb_startWith:(NSString *)string options:(NSStringCompareOptions)compareOption;

/**
 判断是否以给定的字符串结束，默认忽略字母大小写
 
 @param string 给定字符串
 @return 是-YES，否-NO
 */
- (BOOL)amb_endWith:(NSString *)string;

/**
 判断是否以给定的字符串结束
 
 @param string 给定字符串
 @param compareOption 字符串比较选项
 @return 是-YES，否-NO
 */
- (BOOL)amb_endWith:(NSString *)string options:(NSStringCompareOptions)compareOption;

/**
 计算字符串所占用的大小
 
 @param font 字体，若为nil则默认为[UIFont systemFontOfSize:12]
 @param size 预占用的大小
 @param lineBreakMode 显示样式
 @return 字符串所占用的大小
 */
- (CGSize)amb_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/**
 将字符串转化为json对象
 
 @return json对象，转换失败的话返回nil
 */
- (id)amb_jsonObjectDecode;

/**
 base64编码
 
 @return base64字符串
 */
- (NSString *)amb_base64EncodedString;

/**
 base64解码
 
 @return NSString实例
 */
- (NSString *)amb_base64DecodedString;

/**
 md5编码
 
 @return md5字符串
 */
- (NSString *)amb_md5String;

/**
 sha1编码
 
 @return sha1字符串
 */
- (NSString *)amb_sha1String;

/**
 sha224编码
 
 @return sha224字符串
 */
- (NSString *)amb_sha224String;

/**
 sha256编码
 
 @return sha256字符串
 */
- (NSString *)amb_sha256String;

/**
 sha384编码
 
 @return sha384字符串
 */
- (NSString *)amb_sha384String;

/**
 sha512编码
 
 @return sha512字符串
 */
- (NSString *)amb_sha512String;

/**
 des编码
 
 @param key 秘钥
 @return des编码后后再进行base64的编码的字符串(若秘钥或者要编码的字符串为空，或者des编码失败都返回nil)
 */
- (NSString *)amb_desEncryptWithKey:(NSString *)key;

/**
 des解码(对应desEncryptWithKey方法，故先进行base64解码再进行des解码)
 
 @param key 秘钥
 @return 解码后的字符串(若秘钥或者要编码的字符串为空，或者des解码失败都返回nil)
 */
- (NSString *)amb_desDecryptWithkey:(NSString *)key;

/**
 url编码
 
 @return url编码后的字符串
 */
- (NSString *)amb_stringByURLEncode;

/**
 url解码
 
 @return url解码后的字符串
 */
- (NSString *)amb_stringByURLDecode;

@end
