//
//  CoreDataUser.h
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;
@interface CoreDataUser : NSObject

+ (void)addNewUser:(User*)user;
+ (void)deleteUser;

+ (User*)getUser;

@end
