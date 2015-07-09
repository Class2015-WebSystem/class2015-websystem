//
//  SettingVC.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "SettingVC.h"
#import "AddBolgVC.h"
#import "CoreDataUser.h"
#import "User.h"

@interface SettingVC ()
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    User *user = [CoreDataUser getUser];
    _avatarImageView.image = [UIImage imageNamed:user.avatar];
    self.title = @"设置";
    
}
@end
