//
//  CoreDataBolg.h
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bolg;
@interface CoreDataBolg : NSObject

+ (void)addNewBlog:(Bolg*)blog;
+ (void)deleteBlog;

+ (NSArray*)getAllBolg;

@end
