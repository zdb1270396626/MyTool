//
//  ToolTableViewCell.h
//  MyTool
//
//  Created by hjf1234 on 2019/3/28.
//  Copyright © 2019 Jarvan-zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolTableViewCell : UITableViewCell

@property (nonatomic, strong)UIButton *button;

@property (nonatomic, copy)NSString *str;

@property (nonatomic, strong) void(^buttonClick)(NSIndexPath *path);

@end


