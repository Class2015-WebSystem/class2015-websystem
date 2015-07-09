//
//  MainListCell.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "MainListCell.h"
#import "GlobalDefine.h"

@implementation MainListCell

- (instancetype)init {
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIView *backGround = [UIView new];
    backGround.backgroundColor = [UIColor whiteColor];
    backGround.frame = CGRectMake(20, 20, 280, 131);
    [self.contentView addSubview:backGround];
    
    UILabel *title = [UILabel new];
    title.frame = CGRectMake(8, 8, 210, 21);
    title.textColor = [UIColor whiteColor];
    title.text = _title;
    
    UILabel *detail = [UILabel new];
    detail.frame = CGRectMake(8, 28, 264, 40);
    detail.font = [UIFont systemFontOfSize:14];
    detail.textColor = [UIColor whiteColor];
    detail.text = _detail;
    [backGround addSubview:detail];
    
    UIView *line = [UIView new];
    line.frame = CGRectMake(10, 82, 260, 1);
    [backGround addSubview:line];
    
    UIImageView *avatar = [UIImageView new];
    avatar.frame = CGRectMake(10, 91, 32, 32);
    avatar.image = [UIImage imageNamed:_avatar];
    [backGround addSubview:avatar];
    
    UILabel *username = [UILabel new];
    username.frame = CGRectMake(50, 91, 55, 16);
    username.font = [UIFont systemFontOfSize:16];
    username.textColor = [UIColor whiteColor];
    [backGround addSubview:username];
    
    UILabel *time = [UILabel new];
    time.frame = CGRectMake(197, 108, 75, 15);
    time.textColor = [UIColor whiteColor];
    time.font = [UIFont systemFontOfSize:13];
    time.textAlignment = NSTextAlignmentRight;
    [backGround addSubview:time];

}
@end
