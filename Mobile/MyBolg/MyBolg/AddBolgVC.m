//
//  AddBolgVC.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "AddBolgVC.h"
#import "CoreDataUser.h"
#import "LocalDataBase.h"
#import "Bolg.h"
#import "User.h";

@interface AddBolgVC()
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextView *detailTextView;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation AddBolgVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新博客";
}

- (IBAction)addNewBolg:(id)sender {
    Bolg *bolg = [Bolg new];
    bolg.title = _titleTextField.text;
    bolg.detail = _detailTextView.text;
    User *user = [CoreDataUser getUser];
    bolg.avatar = user.avatar;
    bolg.username = user.username;
    bolg.createTime = [self currentTime];
    [LocalDataBase addNewBlog:bolg];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString*)currentTime {
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    return currentTime;
}
- (IBAction)keyBoardDismiss:(id)sender {
    [_titleTextField resignFirstResponder];
    [_detailTextView resignFirstResponder];
}
@end
