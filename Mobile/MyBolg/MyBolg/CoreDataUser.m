//
//  CoreDataUser.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "CoreDataUser.h"
#import "AppDelegate.h"
#import "User.h"

@implementation CoreDataUser

+ (void)addNewUser:(User *)user {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [app managedObjectContext];
    
    NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"USER" inManagedObjectContext:context];
    [newUser setValue:user.username forKey:@"username"];
    [newUser setValue:user.password forKey:@"password"];
    [newUser setValue:user.sign forKey:@"sign"];
    [newUser setValue:user.avatar forKey:@"avatar"];
    [app saveContext];
}

+ (User*)getUser {
    User *user = [User new];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"USER"];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects.count > 0) {
        NSManagedObject *oneObject = [objects objectAtIndex:0];
        user.username = [oneObject valueForKey:@"username"];
        user.password = [oneObject valueForKey:@"password"];
        user.sign = [oneObject valueForKey:@"sign"];
        user.avatar = [oneObject valueForKey:@"avatar"];
        return user;
    }
    return nil;
}

+ (void)deleteUser {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"USER"];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects.count > 0) {
        NSManagedObject *one = [objects objectAtIndex:0];
        [context deleteObject:one];
    }
    [appDelegate saveContext];
}

@end
