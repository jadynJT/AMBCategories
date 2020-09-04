//
//  NSURL+AMBAdd.m
//  AMBBaseFramework
//
//  Created by mahailin on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "NSURL+AMBAdd.h"
#import "NSString+AMBAdd.h"
#import "NSArray+AMBAdd.h"

@interface AMBQueryStringPair : NSObject

@property (nonatomic, strong) id field;
@property (nonatomic, strong) id value;

@end

@implementation AMBQueryStringPair

- (instancetype)initWithField:(id)field value:(id)value
{
    self = [super init];
    
    if (self)
    {
        self.field = field;
        self.value = value;
    }
    
    return self;
}

- (NSString *)urlEncodedStringValue
{
    if (!self.value || [self.value isEqual:[NSNull null]])
    {
        return [[self.field description] amb_stringByURLEncode];
    }
    else
    {
        return [NSString stringWithFormat:@"%@=%@", [[self.field description] amb_stringByURLEncode], [[self.value description] amb_stringByURLEncode]];
    }
}

@end

#pragma mark -

@implementation NSURL (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 根据给定的url以及参数字典, 生成NSURL类的实例
 
 @param urlString URL字符串
 @param dictionary 参数字典
 @return NSURL实例
 */
+ (instancetype)amb_urlWithString:(NSString *)urlString paramDictionary:(NSDictionary *)dictionary
{
    return [[[self class] alloc] amb_initWithString:urlString paramDictionary:dictionary];
}

/**
 根据给定的url以及参数字典, 生成NSURL类的实例
 
 @param urlString URL字符串
 @param dictionary 参数字典
 @return NSURL实例
 */
- (instancetype)amb_initWithString:(NSString *)urlString paramDictionary:(NSDictionary *)dictionary
{
    if ([NSString amb_isEmpty:urlString])
    {
        return nil;
    }
    
    if (!dictionary || dictionary.count == 0)
    {
        return [self initWithString:urlString];
    }
    
    NSString *result = @"";
    NSString *endString = @"";
    
    if ([urlString amb_containString:@"#"])
    {
        NSArray *resultArray = [urlString componentsSeparatedByString:@"#"];
        result = [result stringByAppendingString:[resultArray amb_safeGetObjectAtIndex:0]];
        endString = [NSString stringWithFormat:@"#%@", [resultArray amb_safeGetObjectAtIndex:1]];
    }
    else
    {
        result = [result stringByAppendingString:urlString];
    }
    
    NSString *query = [self amb_queryStringFromDictionary:dictionary];
    
    if (query.length > 0)
    {
        result = [result stringByAppendingFormat:[result containsString:@"?"] ? @"&%@" : @"?%@", query];
    }
    
    result = [result stringByAppendingString:endString];
    return [self initWithString:result];
}

#pragma mark -
#pragma mark ==== 内部使用方法 ====
#pragma mark -

/**
 生成参数字符串
 
 @param dictionary 参数字典
 @return 参数字符串
 */
- (NSString *)amb_queryStringFromDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *paramStringArray = [NSMutableArray array];
    
    for (AMBQueryStringPair *pair in [self amb_queryStringPairsWithKey:nil value:dictionary])
    {
        [paramStringArray addObject:[pair urlEncodedStringValue]];
    }
    
    return [paramStringArray componentsJoinedByString:@"&"];
}

/**
 生成AMBRequestQueryStringPair实例数组
 
 @param key key
 @param value value
 @return AMBRequestQueryStringPair实例数组
 */
- (NSArray *)amb_queryStringPairsWithKey:(NSString *)key value:(id)value
{
    NSMutableArray *pairsArray = [NSMutableArray array];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(compare:)];
    
    if ([value isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = value;
        
        for (id nestedKey in [dictionary.allKeys sortedArrayUsingDescriptors:@[sortDescriptor]])
        {
            id nestedValue = dictionary[nestedKey];
            
            if (nestedValue)
            {
                [pairsArray addObjectsFromArray:[self amb_queryStringPairsWithKey:(key ? [NSString stringWithFormat:@"%@[%@]", key, nestedKey] : nestedKey) value:nestedValue]];
            }
        }
    }
    else if ([value isKindOfClass:[NSArray class]])
    {
        NSArray *array = value;
        
        for (id nestedValue in array)
        {
            [pairsArray addObjectsFromArray:[self amb_queryStringPairsWithKey:[NSString stringWithFormat:@"%@[]", key] value:nestedValue]];
        }
    }
    else if ([value isKindOfClass:[NSSet class]])
    {
        NSSet *set = value;
        
        for (id object in [set sortedArrayUsingDescriptors:@[sortDescriptor]])
        {
            [pairsArray addObjectsFromArray:[self amb_queryStringPairsWithKey:key value:object]];
        }
    }
    else
    {
        [pairsArray addObject:[[AMBQueryStringPair alloc] initWithField:key value:value]];
    }
    
    return pairsArray;
}

@end
