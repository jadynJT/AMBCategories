//
//  NSData+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/23.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "NSData+AMBAdd.h"

@implementation NSData (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 base64编码

 @return base64字符串
 */
- (NSString *)amb_base64EncodedString
{
    return [self base64EncodedStringWithOptions:0];
}

/**
 base64解码

 @param base64EncodedString base64字符串
 @return NSData实例
 */
+ (NSData *)amb_dataWithBase64EncodedString:(NSString *)base64EncodedString
{
    if (!base64EncodedString || base64EncodedString.length == 0)
    {
        return [NSData data];
    }
    
    return [[NSData alloc] initWithBase64EncodedString:base64EncodedString options:0];
}

/**
 md5编码

 @return md5字符串
 */
- (NSString *)amb_md5String
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x", result[i]];
    }
    
    return hash;
}

/**
 md5编码

 @return md5 data
 */
- (NSData *)amb_md5Data
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

/**
 sha1编码

 @return sha1字符串
 */
- (NSString *)amb_sha1String
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x", result[i]];
    }
    
    return hash;
}

/**
 sha1编码

 @return sha1 data
 */
- (NSData *)amb_sha1Data
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA1_DIGEST_LENGTH];
}

/**
 sha224编码

 @return sha224字符串
 */
- (NSString *)amb_sha224String
{
    unsigned char result[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_SHA224_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x", result[i]];
    }
    
    return hash;
}

/**
 sha224编码

 @return sha224 data
 */
- (NSData *)amb_sha224Data
{
    unsigned char result[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA224_DIGEST_LENGTH];
}

/**
 sha256编码

 @return sha256字符串
 */
- (NSString *)amb_sha256String
{
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x", result[i]];
    }
    
    return hash;
}

/**
 sha256编码

 @return sha256 data
 */
- (NSData *)amb_sha256Data
{
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA256_DIGEST_LENGTH];
}

/**
 sha384编码

 @return sha384字符串
 */
- (NSString *)amb_sha384String
{
    unsigned char result[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x", result[i]];
    }
    
    return hash;
}

/**
 sha384编码

 @return sha384 data
 */
- (NSData *)amb_sha384Data
{
    unsigned char result[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA384_DIGEST_LENGTH];
}

/**
 sha512编码

 @return sha512字符串
 */
- (NSString *)amb_sha512String
{
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x", result[i]];
    }
    
    return hash;
}

/**
 sha512编码

 @return sha512 data
 */
- (NSData *)amb_sha512Data
{
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA512_DIGEST_LENGTH];
}

@end
