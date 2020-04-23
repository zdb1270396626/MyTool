//
//  NewsListTableViewCell.h
//  MyTool
//
//  Created by Jarvan-zhang on 2019/5/14.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewsModel.h"

@interface NewsListTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *dateLabel;
@property (nonatomic, strong)UILabel *authorLbl;
@property (nonatomic, strong)UIImageView *pic;
@property (nonatomic, strong)UIImageView *pic2;
@property (nonatomic, strong)UIImageView *pic3;

@property (nonatomic, strong)NewsModel *newsModel;


@end


