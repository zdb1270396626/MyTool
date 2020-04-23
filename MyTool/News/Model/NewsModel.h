//
//  NewsModel.h
//  MyTool
//
//  Created by Jarvan-zhang on 2019/5/14.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *category;//分类
@property (nonatomic, strong)NSString *date;//时间
@property (nonatomic, strong)NSString *author_name;
@property (nonatomic, strong)NSString *url;//详情url
@property (nonatomic, strong)NSString *thumbnail_pic_s;//缩略图
@property (nonatomic, strong)NSString *thumbnail_pic_s02;
@property (nonatomic, strong)NSString *thumbnail_pic_s03;

+ (instancetype)entityWithDict:(NSDictionary *)dict;

@end


