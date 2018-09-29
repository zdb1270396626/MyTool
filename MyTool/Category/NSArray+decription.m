//
//  NSArray+decription.m
//  dianshang
//
//  Created by Jarvan-zhang on 2018/9/29.
//  Copyright © 2018年 yunjobs. All rights reserved.
//

#import "NSArray+decription.h"

@implementation NSArray (decription)

- (NSString *)descriptionWithLocale:(id)locale{
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    for (id obj in self) {
        [str appendFormat:@"\t%@, \n", obj];
    }
    
    [str appendString:@")"];
    
    return str;
}

@end
