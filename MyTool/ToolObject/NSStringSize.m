//
//  NSStringSize.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/16.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "NSStringSize.h"

@implementation NSStringSize
//只有字号
+ (CGSize)getNSStringSize:(NSString *)str Font:(float)font {
    if ([str isKindOfClass:[NSString class]] && str.length > 0) {
        CGSize maxSize = CGSizeMake(WIDTH , 8000);
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
        CGSize labelSzie = [str boundingRectWithSize:maxSize options:options attributes:dic context:nil].size;
        return labelSzie;
    } else {
        return CGSizeMake(0 , 0);
    }
}

//指定字体和字号
+ (CGSize)getNSStringSize:(NSString *)str withFontName:(NSString *)name Font:(float)font {
    if ([str isKindOfClass:[NSString class]] && str.length > 0) {
        CGSize maxSize = CGSizeMake(WIDTH - 30, 8000);
        NSDictionary *dic = @{NSFontAttributeName:[UIFont fontWithName:name size:font]};
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
        CGSize labelSzie = [str boundingRectWithSize:maxSize options:options attributes:dic context:nil].size;
        return labelSzie;
    } else {
        return CGSizeMake(0 , 0);
    }
}

//指定字号和最大范围
+ (CGSize)getNSStringHeight:(NSString *)str Font:(float)font maxSize:(CGSize)maxSize {
    if ([str isKindOfClass:[NSString class]] && str.length > 0) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize: font]};
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
        CGSize labelSzie = [str boundingRectWithSize:maxSize options:options attributes:dic context:nil].size;
        return labelSzie;
    } else {
        return CGSizeMake(0 , 0);
    }
}
@end
