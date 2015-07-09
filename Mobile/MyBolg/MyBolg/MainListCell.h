//
//  MainListCell.h
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainListCell : UITableViewCell

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *createTime;

@property (strong, nonatomic) NSArray *comments;
@property (strong, nonatomic) NSArray *picture;

@end
