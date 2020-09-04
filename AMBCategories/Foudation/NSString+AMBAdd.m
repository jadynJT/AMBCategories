//
//  NSString+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/23.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <CommonCrypto/CommonCryptor.h>
#import <UIKit/UIKit.h>

#import "NSString+AMBAdd.h"
#import "NSData+AMBAdd.h"

@implementation NSString (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 创建uuid
 
 @return uuid字符串
 */
+ (NSString *)amb_createUUID
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

/**
 判断字符串是否为空(字符串为nil或者长度为0即为空)

 @param string 字符串
 @return 为空返回YES，否则返回NO
 */
+ (BOOL)amb_isEmpty:(NSString *)string
{
    return string && string.length > 0 ? NO : YES;
}

/**
 去除字符串首、尾的空白字符串跟换行符

 @return 去除字符串首、尾的空白字符串跟换行符后的字符串
 */
- (NSString *)amb_trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 移除字符串中所有的空格

 @return 移除所有空格后的字符串
 */
- (NSString *)amb_removeAllWhiteSpace
{
    return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""];
}

/**
 判断是否包含指定的字符串，默认忽略字母大小写

 @param string 指定的字符串
 @return 包含返回YES，否则返回NO
 */
- (BOOL)amb_containString:(NSString *)string
{
    return [self amb_containString:string options:NSCaseInsensitiveSearch];
}

/**
 判断是否包含指定的字符串

 @param string 指定的字符串
 @param compareOption 字符串比较选项
 @return 包含返回YES，否则返回NO
 */
- (BOOL)amb_containString:(NSString *)string options:(NSStringCompareOptions)compareOption
{
    BOOL contain = NO;
    
    if (string.length > 0 && self.length >= string.length)
    {
        contain = [self rangeOfString:string options:compareOption].location != NSNotFound;
    }
    
    return contain;
}

/**
 判断是否以给定的字符串开始，默认忽略字母大小写

 @param string 给定字符串
 @return 是-YES，否-NO
 */
- (BOOL)amb_startWith:(NSString *)string
{
    return [self amb_startWith:string options:NSCaseInsensitiveSearch];
}

/**
 判断是否以给定的字符串开始

 @param string 给定字符串
 @param compareOption 字符串比较选项
 @return 是-YES，否-NO
 */
- (BOOL)amb_startWith:(NSString *)string options:(NSStringCompareOptions)compareOption
{
    BOOL contain = NO;
    
    if (string.length > 0 && self.length >= string.length)
    {
        contain = [self rangeOfString:string options:compareOption].location == 0;
    }
    
    return contain;
}

/**
 判断是否以给定的字符串结束，默认忽略字母大小写

 @param string 给定字符串
 @return 是-YES，否-NO
 */
- (BOOL)amb_endWith:(NSString *)string
{
    return [self amb_endWith:string options:NSCaseInsensitiveSearch];
}

/**
 判断是否以给定的字符串结束

 @param string 给定字符串
 @param compareOption 字符串比较选项
 @return 是-YES，否-NO
 */
- (BOOL)amb_endWith:(NSString *)string options:(NSStringCompareOptions)compareOption
{
    BOOL contain = NO;
    
    if (string.length > 0 && self.length >= string.length)
    {
        contain = [self rangeOfString:string options:(compareOption | NSBackwardsSearch)].location == self.length - string.length;
    }
    
    return contain;
}

/**
 计算字符串所占用的大小

 @param font 字体，若为nil则默认为[UIFont systemFontOfSize:12]
 @param size 预占用的大小
 @param lineBreakMode 显示样式
 @return 字符串所占用的大小
 */
- (CGSize)amb_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode
{
    CGSize result = CGSizeZero;
    
    if (!font)
    {
        font = [UIFont systemFontOfSize:12];
    }
    
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        NSMutableDictionary *dictionary = [NSMutableDictionary new];
        dictionary[NSFontAttributeName] = font;
        
        if (lineBreakMode != NSLineBreakByWordWrapping)
        {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            dictionary[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:dictionary
                                         context:nil];
        
        result = rect.size;
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    
    return result;
}

/**
 将字符串转化为json对象

 @return json对象，转换失败的话返回nil
 */
- (id)amb_jsonObjectDecode
{
    if (!self || self.length == 0)
    {
        return nil;
    }
    
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error = nil;
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        return error ? nil : obj;
    }
    
    return nil;
}

/**
 base64编码
 
 @return base64字符串
 */
- (NSString *)amb_base64EncodedString
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    return [[self dataUsingEncoding:NSUTF8StringEncoding] amb_base64EncodedString];
}

/**
 base64解码
 
 @return NSString实例
 */
- (NSString *)amb_base64DecodedString
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    NSData *data = [NSData amb_dataWithBase64EncodedString:self];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/**
 md5编码
 
 @return md5字符串
 */
- (NSString *)amb_md5String
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    return [[self dataUsingEncoding:NSUTF8StringEncoding] amb_md5String];
}

/**
 sha1编码
 
 @return sha1字符串
 */
- (NSString *)amb_sha1String
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    return [[self dataUsingEncoding:NSUTF8StringEncoding] amb_sha1String];
}

/**
 sha224编码
 
 @return sha224字符串
 */
- (NSString *)amb_sha224String
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    return [[self dataUsingEncoding:NSUTF8StringEncoding] amb_sha224String];
}

/**
 sha256编码
 
 @return sha256字符串
 */
- (NSString *)amb_sha256String
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    return [[self dataUsingEncoding:NSUTF8StringEncoding] amb_sha256String];
}

/**
 sha384编码
 
 @return sha384字符串
 */
- (NSString *)amb_sha384String
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    return [[self dataUsingEncoding:NSUTF8StringEncoding] amb_sha384String];
}

/**
 sha512编码
 
 @return sha512字符串
 */
- (NSString *)amb_sha512String
{
    if (!self || self.length == 0)
    {
        return @"";
    }
    
    return [[self dataUsingEncoding:NSUTF8StringEncoding] amb_sha512String];
}

/**
 des编码

 @param key 秘钥
 @return des编码后后再进行base64的编码的字符串(若秘钥或者要编码的字符串为空，或者des编码失败都返回nil)
 */
- (NSString *)amb_desEncryptWithKey:(NSString *)key
{
    if ((!self || self.length == 0) || (!key || key.length == 0))
    {
        return nil;
    }
    
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numberOfBytes = 0;
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          key.UTF8String,
                                          kCCKeySizeDES,
                                          nil,
                                          data.bytes,
                                          data.length,
                                          buffer,
                                          1024,
                                          &numberOfBytes);
    
    if (cryptStatus == kCCSuccess)
    {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numberOfBytes];
        return [[NSString alloc] initWithFormat:@"%@",[data amb_base64EncodedString]];
    }
    
    return nil;
}

/**
 des解码(对应desEncryptWithKey方法，故先进行base64解码再进行des解码)

 @param key 秘钥
 @return 解码后的字符串(若秘钥或者要编码的字符串为空，或者des解码失败都返回nil)
 */
- (NSString *)amb_desDecryptWithkey:(NSString *)key
{
    if ((!self || self.length == 0) || (!key || key.length == 0))
    {
        return nil;
    }
    
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numberOfBytes = 0;
    NSData *data = [NSData amb_dataWithBase64EncodedString:self];
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          key.UTF8String,
                                          kCCKeySizeDES,
                                          nil,
                                          data.bytes,
                                          data.length,
                                          buffer,
                                          1024,
                                          &numberOfBytes);
    
    if (cryptStatus == kCCSuccess)
    {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numberOfBytes];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

/**
 url编码

 @return url编码后的字符串
 */
- (NSString *)amb_stringByURLEncode
{
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)])
    {
        static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@";
        static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
        
        NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
        static NSUInteger const batchSize = 50;
        
        NSUInteger index = 0;
        NSMutableString *escaped = [NSMutableString string];
        
        while (index < self.length)
        {
            NSUInteger length = MIN(self.length - index, batchSize);
            NSRange range = NSMakeRange(index, length);
            
            // To avoid breaking up character sequences such as 👴🏻👮🏽
            range = [self rangeOfComposedCharacterSequencesForRange:range];
            NSString *substring = [self substringWithRange:range];
            NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
            [escaped appendString:encoded];
            
            index += range.length;
        }
        
        return escaped;
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                     (CFStringRef)self,
                                                                                     NULL,
                                                                                     (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                     kCFStringEncodingUTF8);
#pragma clang diagnostic pop
    }
}

/**
 url解码

 @return url解码后的字符串
 */
- (NSString *)amb_stringByURLDecode
{
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)])
    {
        return [self stringByRemovingPercentEncoding];
    }
    else
    {
        NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
        result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        return result;
    }
}

@end
