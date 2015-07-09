//
//  LocalDataBase.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "LocalDataBase.h"
#import "AppDelegate.h"
#import "User.h"
#import "Bolg.h";

@implementation LocalDataBase

+ (void)addNewUser:(User *)user {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [app managedObjectContext];
    
    NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"LocalDataBaseUser" inManagedObjectContext:context];
    [newUser setValue:user.username forKey:@"username"];
    [newUser setValue:user.password forKey:@"password"];
    [newUser setValue:user.sign forKey:@"sign"];
    [newUser setValue:user.avatar forKey:@"avatar"];
    [app saveContext];
}

+ (User*)checkUserByUsername:(NSString*)username AndPassword:(NSString*)password {
    User *user = [User new];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"USER"];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(%K = %@)",@"username",username];
    [request setPredicate:pred];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects.count > 0) {
        NSManagedObject *oneObject = [objects objectAtIndex:0];
        if ([username isEqualToString:[oneObject valueForKey:@"username"]]&&[password isEqualToString:[oneObject valueForKey:@"password"]]) {
            user.username = [oneObject valueForKey:@"username"];
            user.password = [oneObject valueForKey:@"password"];
            user.sign = [oneObject valueForKey:@"sign"];
            user.avatar = [oneObject valueForKey:@"avatar"];
            return user;
        }
    }
    return nil;
}


+ (void)addNewBlog:(Bolg*)bolg{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [app managedObjectContext];
    
    NSManagedObject *newBolg = [NSEntityDescription insertNewObjectForEntityForName:@"LocalDataBaseBolg" inManagedObjectContext:context];
    [newBolg setValue:bolg.username forKey:@"username"];
    [newBolg setValue:bolg.avatar forKey:@"avatar"];
    [newBolg setValue:bolg.createTime forKey:@"createtime"];
    [newBolg setValue:bolg.detail forKey:@"detail"];
    [newBolg setValue:bolg.title forKey:@"title"];
    [app saveContext];
}
+ (void)deleteBlog{
    
}

+ (NSArray*)getAllBolg {
    NSMutableArray *array = [NSMutableArray new];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"LocalDataBaseBolg"];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    for (NSManagedObject *oneObject in objects) {
        Bolg *bolg = [Bolg new];
        bolg.title = [oneObject valueForKey:@"title"];
        bolg.avatar = [oneObject valueForKey:@"avatar"];
        bolg.createTime = [oneObject valueForKey:@"createtime"];
        bolg.detail = [oneObject valueForKey:@"detail"];
        bolg.username = [oneObject valueForKey:@"username"];
        [array addObject:bolg];
    }
    return array;
}

@end
