//
//  NewsListTableViewCell.m
//  MyTool
//
//  Created by Jarvan-zhang on 2019/5/14.
//  Copyright © 2019年 Jarvan-zhang. All rights reserved.
//

#import "NewsListTableViewCell.h"


@implementation NewsListTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatViews];
    }
    return  self;
}

- (void)creatViews {
    UILabel *titleLbl = [[UILabel alloc]init];
    titleLbl.font = [UIFont systemFontOfSize:17.0 weight:0.5];
    [self.contentView addSubview:titleLbl];
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.height.offset(20);
        make.top.offset(10);
        make.right.offset(-15);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.mas_equalTo(titleLbl.mas_bottom).offset(10);
        make.width.offset((WIDTH-30-4)/3);
        make.height.offset((WIDTH-30-4)/4);
    }];
    
    UIImageView *imageView2 = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.width.equalTo(imageView);
        make.left.mas_equalTo(imageView.mas_right).offset(2);
    }];
    
    UIImageView *imageView3 = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.width.equalTo(imageView);
        make.left.mas_equalTo(imageView2.mas_right).offset(2);
    }];
    
    UILabel *authorLbl = [[UILabel alloc]init];
    authorLbl.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:authorLbl];
    
    [authorLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.height.offset(15);
        make.top.mas_equalTo(imageView.mas_bottom).offset(10);
    }];
    
    UILabel *dateLbl = [[UILabel alloc]init];
    dateLbl.textAlignment = NSTextAlignmentRight;
    dateLbl.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:dateLbl];
    
    [dateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.height.offset(15);
        make.top.mas_equalTo(imageView.mas_bottom).offset(10);
    }];
    
    self.titleLabel = titleLbl;
    self.dateLabel = dateLbl;
    self.authorLbl = authorLbl;
    self.pic = imageView;
    self.pic2 = imageView2;
    self.pic3 = imageView3;

}

- (void)setNewsModel:(NewsModel *)newsModel {
    _newsModel = newsModel;
    self.titleLabel.text = _newsModel.title;
    self.authorLbl.text = _newsModel.author_name;
    self.dateLabel.text = _newsModel.date;
   
    [self.pic sd_setImageWithURL:[NSURL URLWithString:_newsModel.thumbnail_pic_s] placeholderImage:nil];
    [self.pic2 sd_setImageWithURL:[NSURL URLWithString:_newsModel.thumbnail_pic_s02] placeholderImage:nil];
    [self.pic3 sd_setImageWithURL:[NSURL URLWithString:_newsModel.thumbnail_pic_s03] placeholderImage:nil];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
