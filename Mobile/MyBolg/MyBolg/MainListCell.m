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
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setupUI {
    UIImageView *back = [UIImageView new];
    back.frame = CGRectMake(20, 20, 280, 131);
    back.image = [UIImage imageNamed:[NSString stringWithFormat:@"81%d.jpg",arc4random() % 10]];
    [self.contentView addSubview:back];
    
    UIView *backGround = [UIView new];
    backGround.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.35];
    backGround.frame = CGRectMake(20, 20, 280, 131);
    [self.contentView addSubview:backGround];
    
    UILabel *title = [UILabel new];
    title.frame = CGRectMake(8, 8, 210, 21);
    title.textColor = [UIColor whiteColor];
    title.text = _title;
    [backGround addSubview:title];
    
    UILabel *detail = [UILabel new];
    detail.frame = CGRectMake(8, 28, 264, 40);
    detail.font = [UIFont systemFontOfSize:14];
    detail.textColor = [UIColor whiteColor];
    detail.text = _detail;
    detail.numberOfLines = 2;
    [backGround addSubview:detail];
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor whiteColor];
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
    username.text = _username;
    [backGround addSubview:username];
    
    UILabel *time = [UILabel new];
    time.frame = CGRectMake(197, 108, 75, 15);
    time.textColor = [UIColor whiteColor];
    time.font = [UIFont systemFontOfSize:13];
    time.textAlignment = NSTextAlignmentRight;
    time.text = _createTime;
    [backGround addSubview:time];

}
@end
