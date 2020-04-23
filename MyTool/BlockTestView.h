//
//  BlockTestView.h
//  MyTool
//
//  Created by Jarvan-zhang on 2019/11/8.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^block1)(NSString *str);

@interface BlockTestView : UIView

- (void)blockTestBlock:(block1)block1;

@end


