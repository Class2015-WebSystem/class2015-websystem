//
//  User.h
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *sign;

- (instancetype)initWithUserName:(NSString*)username AndPassword:(NSString*)password;

@end
