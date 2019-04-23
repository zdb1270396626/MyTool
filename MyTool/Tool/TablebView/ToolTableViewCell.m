//
//  ToolTableViewCell.m
//  MyTool
//
//  Created by hjf1234 on 2019/3/28.
//  Copyright © 2019 Jarvan-zhang. All rights reserved.
//

#import "ToolTableViewCell.h"
#import "UITableViewCell+YQIndexPath.h"

@implementation ToolTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creat];
    }
    return self;
}

- (void)creat {
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.contentView addSubview:_button];
}

- (void)setStr:(NSString *)str {
    _str = str;
}

- (void)click:(UIButton *)button {
    if (self.buttonClick) {
        self.buttonClick([self indexPathWithView:button]);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
