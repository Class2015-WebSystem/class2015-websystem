//
//  LocalDataBase.h
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class Bolg;
@interface LocalDataBase : NSObject

+ (void)addNewUser:(User*)user;

+ (User*)checkUserByUsername:(NSString*)username AndPassword:(NSString*)password;


+ (void)addNewBlog:(Bolg*)blog;
+ (void)deleteBlog;

+ (NSArray*)getAllBolg;


@end
