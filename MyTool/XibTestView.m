//
//  XibTestView.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/12/31.
//  Copyright © 2019 Jarvan-zhang. All rights reserved.
//

#import "XibTestView.h"

@implementation XibTestView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"XibTestView" owner:self options:nil]firstObject];
    }
    return self;
}

@end
