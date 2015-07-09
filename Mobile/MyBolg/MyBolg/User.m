//
//  User.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithUserName:(NSString*)username AndPassword:(NSString*)password {
    if (self) {
        self.username = username;
        self.password = password;
        self.avatar = @"";
        self.sign = @"";
    }
    return self;
}

@end
