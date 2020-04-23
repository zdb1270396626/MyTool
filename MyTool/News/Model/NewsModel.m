//
//  NewsModel.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/5/14.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

+ (instancetype)entityWithDict:(NSDictionary *)dict {
    NewsModel *model = [NewsModel mj_objectWithKeyValues:dict];
    return model;
}

- (NSString *)date {
    if (_date.length >= 10) {
        return [_date substringToIndex:10];
    }
    return _date;
}
@end
