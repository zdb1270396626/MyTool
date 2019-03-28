//
//  UIButton+YQButtonManger.m
//  dianshang
//
//  Created by haha on 2018/4/1.
//  Copyright © 2018年 yunjobs. All rights reserved.
//

#import "UIButton+YQButtonManger.h"

@implementation UIButton (YQButtonManger)

// 红色圆角按钮
+ (instancetype)redFilletBtn:(CGRect)frame
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.layer.cornerRadius = frame.size.height*0.5;
    button.layer.masksToBounds = YES;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:THEMECOLOR forState:UIControlStateNormal];
    return button;
}

// 红色方形按钮
+ (instancetype)redSquareBtn:(CGRect)frame
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:THEMECOLOR forState:UIControlStateNormal];
    return button;
}

// 白色方形按钮
+ (instancetype)whiteSquareBtn
{
    UIButton *button = [[UIButton alloc] init];
    
    return button;
}

// 圆角+边框按钮
+ (instancetype)borderFilletBtn
{
    UIButton *button = [[UIButton alloc] init];
    
    return button;
}

@end
