//
//  ViewController.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "CoreDataUser.h"
#import "LocalDataBase.h"
#import "MainListVC.h"

@interface ViewController ()<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *loginView;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextFeild;

@property (strong, nonatomic) IBOutlet UIButton *registerBtn;
@property (strong, nonatomic) IBOutlet UIButton *signInBtn;
@property (strong, nonatomic) IBOutlet UIButton *vistorBtn;
@end

@implementation ViewController

#pragma mark- Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    [CoreDataUser deleteUser];
}

#pragma mark- UI

- (void)setupUI {
    self.navigationController.navigationBarHidden = YES;
    
    _loginView.layer.cornerRadius = 10.f;
    
    _emailTextField.layer.masksToBounds = YES;
    _passwordTextFeild.layer.masksToBounds = YES;
    [_emailTextField.layer setBorderWidth:1.f];
    [_passwordTextFeild.layer setBorderWidth:1.f];
    [_emailTextField.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [_passwordTextFeild.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    _registerBtn.layer.cornerRadius = _registerBtn.bounds.size.height / 2;
    _signInBtn.layer.cornerRadius = _signInBtn.bounds.size.height / 2;
    _vistorBtn.layer.cornerRadius = _vistorBtn.bounds.size.height / 2;
}

#pragma mark- BtnAction

- (IBAction)vistorModeBtnAction:(id)sender {
    //TODO vistorMode
    MainListVC *mainListVC = [MainListVC new];
    [self.navigationController pushViewController:mainListVC animated:YES];
}

- (IBAction)checkUserInfBtnAction:(id)sender {
    //TODO NormalMode
    if ([LocalDataBase checkUserByUsername:_emailTextField.text AndPassword:_passwordTextFeild.text]) {
        [CoreDataUser addNewUser:[LocalDataBase checkUserByUsername:_emailTextField.text AndPassword:_passwordTextFeild.text]];
        //下级页面
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码出错" delegate:self cancelButtonTitle:@"郑知道了" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)registerBtnAction:(id)sender {
    //TODO register
    if (![_emailTextField.text isEqualToString:@""]&&![_passwordTextFeild.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定注册信息" delegate:self cancelButtonTitle:@"点错了" otherButtonTitles:@"确定",nil];
        [alert show];
    }
}

#pragma mark- AlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        //下级页面
        MainListVC *mainListVC = [MainListVC new];
        [self.navigationController pushViewController:mainListVC animated:YES];
    }
}


@end
