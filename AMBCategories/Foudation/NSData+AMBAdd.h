//
//  NSData+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/23.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AMBAdd)

/**
 base64编码
 
 @return base64字符串
 */
- (NSString *)amb_base64EncodedString;

/**
 base64解码
 
 @param base64EncodedString base64字符串
 @return NSData实例
 */
+ (NSData *)amb_dataWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 md5编码
 
 @return md5字符串
 */
- (NSString *)amb_md5String;

/**
 md5编码
 
 @return md5 data
 */
- (NSData *)amb_md5Data;

/**
 sha1编码
 
 @return sha1字符串
 */
- (NSString *)amb_sha1String;

/**
 sha1编码
 
 @return sha1 data
 */
- (NSData *)amb_sha1Data;

/**
 sha224编码
 
 @return sha224字符串
 */
- (NSString *)amb_sha224String;

/**
 sha224编码
 
 @return sha224 data
 */
- (NSData *)amb_sha224Data;

/**
 sha256编码
 
 @return sha256字符串
 */
- (NSString *)amb_sha256String;

/**
 sha256编码
 
 @return sha256 data
 */
- (NSData *)amb_sha256Data;

/**
 sha384编码
 
 @return sha384字符串
 */
- (NSString *)amb_sha384String;

/**
 sha384编码
 
 @return sha384 data
 */
- (NSData *)amb_sha384Data;

/**
 sha512编码
 
 @return sha512字符串
 */
- (NSString *)amb_sha512String;

/**
 sha512编码
 
 @return sha512 data
 */
- (NSData *)amb_sha512Data;

@end
