//
//  NSDictionary+decription.m
//  dianshang
//
//  Created by Jarvan-zhang on 2018/9/29.
//  Copyright © 2018年 yunjobs. All rights reserved.
//

#import "NSDictionary+decription.h"

@implementation NSDictionary (decription)

- (NSString *)descriptionWithLocale:(id)locale{
    
    NSArray *allKeys = [self allKeys];
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
    for (NSString *key in allKeys) {
        id value= self[key];
        [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
    }
    [str appendString:@"}"];
    return str;
    
}

@end
