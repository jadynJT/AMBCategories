//
//  NSArray+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/23.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "NSArray+AMBAdd.h"

@implementation NSArray (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 根据给定下标安全获取数组里的元素
 
 @param index 下标
 @return 指定下标的元素，下标越界时返回nil
 */
- (id)amb_safeGetObjectAtIndex:(NSUInteger)index
{
    return index < self.count ? self[index] : nil;
}

/**
 指定两端下标，返回一个新的子数组，会判断传入参数的合理性
 
 @param fromIndex 起始下标
 @param toIndex 结束下标
 @return 原数组的子数组(包含起始下标和结束下标的数据)，若传入下标不合理返回nil
 */
- (NSArray *)amb_subarrayFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    NSUInteger count = self.count;
    
    if (fromIndex > toIndex || fromIndex >= count)
    {
        return nil;
    }
    
    NSUInteger lastIndex = toIndex < count ? toIndex : count - 1;
    return [self subarrayWithRange:NSMakeRange(fromIndex, lastIndex - fromIndex + 1)];
}

/**
 遍历数组查找元素
 
 @param block 查找条件
 @return 找到的元素，找不到的话返回nil
 */
- (id)amb_find:(BOOL (^)(id object))block
{
    id object = nil;
    
    if (block)
    {
        for (id item in self)
        {
            if (block(item))
            {
                object = item;
                break;
            }
        }
    }
    
    return object;
}

/**
 遍历数组，让每个元素都执行block
 
 @param block 要执行的block
 */
- (void)amb_each:(void (^)(id object))block
{
    if (block)
    {
        for (id item in self)
        {
            block(item);
        }
    }
}

/**
 遍历数组找到所有符合条件的元素组成新数组返回
 
 @param block 查找条件
 @return 新的数组(若block为nil或者找不到，则返回nil)
 */
- (NSArray *)amb_filter:(BOOL (^)(id object))block
{
    if (!block)
    {
        return nil;
    }
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (id item in self)
    {
        if (block(item))
        {
            [resultArray addObject:item];
        }
    }
    
    return resultArray.count > 0 ? [resultArray copy] : nil;
}

/**
 将数组转为json字符串
 
 @return 转化成功的话返回相应的json字符串，失败则返回nil
 */
- (NSString *)amb_jsonStringEncode
{
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        return !error ? [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] : nil;
    }
    
    return nil;
}

@end

@implementation NSMutableArray (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 安全添加元素
 
 @param object 需要添加的元素，为nil时不添加
 */
- (void)amb_safeAddObject:(id)object
{
    if (object)
    {
        [self addObject:object];
    }
}

/**
 安全添加元素到指定的下标
 
 @param object 要添加的元素，为nil时不添加
 @param index 指定的下标，下标越界时将其添加为最后一个元素
 */
- (void)amb_safeInsertObject:(id)object atIndex:(NSUInteger)index
{
    if (object)
    {
        NSUInteger i = index < self.count ? index : self.count;
        [self insertObject:object atIndex:i];
    }
}

/**
 安全将所给数组的每一个元素添加到接收数组里

 @param array 数组，为nil时不添加
 */
- (void)amb_safeAddObjectsFromArray:(NSArray *)array
{
    if (array)
    {
        [self addObjectsFromArray:array];
    }
}

/**
 安全将所给数组的每一个元素从指定的下标开始逐一添加进来，若指定的下标越界则直接从数组的末尾开始添加

 @param array 数组
 @param index 指定的下标
 */
- (void)amb_safeInsertObjects:(NSArray *)array atIndex:(NSUInteger)index
{
    NSUInteger i = index < self.count ? index : self.count;
    
    for (id object in array)
    {
        [self insertObject:object atIndex:i++];
    }
}

/**
 移除第一个元素并返回该元素

 @return 第一个元素，无数据时返回nil
 */
- (id)amb_popFirstObject
{
    id object = nil;
    
    if (self.count)
    {
        object = self[0];
        [self removeObjectAtIndex:0];
    }
    
    return object;
}

/**
 移除最后一个元素并返回该元素

 @return 最后一个元素，无数据时返回nil
 */
- (id)amb_popLastObject
{
    id object = nil;
    
    if (self.count)
    {
        object = self[self.count - 1];
        [self removeLastObject];
    }
    
    return object;
}

/**
 反转数组
 */
- (void)amb_reverse
{
    NSUInteger count = self.count;
    int middle = floor(count / 2.0);
    
    for (NSUInteger i = 0; i < middle; i++)
    {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - i - 1)];
    }
}

@end
