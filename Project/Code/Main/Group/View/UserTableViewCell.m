//
//  UserTableViewCell.m
//  Project
//
//  Created by mini on 2018/8/16.
//  Copyright © 2018年 CDJay. All rights reserved.
//

#import "UserTableViewCell.h"

@interface UserTableViewCell(){
    UIImageView *_icon;
    UILabel *_name;
    UIImageView *_sexIcon;
    UILabel *_count;
}
@end

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initData];
        [self initSubviews];
        [self initLayout];
    }
    return self;
}

#pragma mark ----- Data
- (void)initData{
    
}


#pragma mark ----- Layout
- (void)initLayout{
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(50));
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView.mas_top).offset(18);
        make.left.equalTo(self->_icon.mas_right).offset(12);
        
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [_count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_name.mas_bottom).offset(8);
        make.left.equalTo(self->_icon.mas_right).offset(8.1);
    }];
}

#pragma mark ----- subView
- (void)initSubviews{
    self.backgroundColor = [UIColor whiteColor];
    _icon = [UIImageView new];
    [self.contentView addSubview:_icon];
    _icon.layer.cornerRadius = 5;
    _icon.layer.masksToBounds = YES;
    
    _name = [UILabel new];
    [self.contentView addSubview:_name];
    _name.font = [UIFont systemFontOfSize2:16];
    _name.textColor = Color_0;
    
    _count = [UILabel new];
    _count.hidden = YES;
    [self.contentView addSubview:_count];
    _count.font = [UIFont systemFontOfSize2:13];
    _count.textColor = Color_6;
    
    UIView *sexBack =[UIView new];
    [self.contentView addSubview:sexBack];
    sexBack.layer.cornerRadius = 7.5;
    sexBack.layer.masksToBounds = YES;
    sexBack.backgroundColor = SexBack;
    [sexBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_name.mas_right).offset(6);
        make.centerY.equalTo(self->_name);
        make.width.height.equalTo(@(15));
    }];
    
    _sexIcon = [UIImageView new];
    [self.contentView addSubview:_sexIcon];
    
    [_sexIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(sexBack);
    }];
}

- (void)setObj:(id)obj{
    [_icon cd_setImageWithURL:[NSURL URLWithString:[NSString cdImageLink:[obj objectForKey:@"avatar"]]] placeholderImage:[UIImage imageNamed:@"user-default"]];
    _name.text = [NSString stringWithFormat:@"%@",[obj objectForKey:@"nick"]];
    _count.text = [NSString stringWithFormat:@"账号：%@",[obj objectForKey:@"userId"]];
    NSInteger sex = [[obj objectForKey:@"gender"] integerValue];
    _sexIcon.image = (sex==1)?[UIImage imageNamed:@"female"]:[UIImage imageNamed:@"male"];
}



@end