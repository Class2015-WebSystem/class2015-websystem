//
//  ViewController.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
}

- (IBAction)checkUserInfBtnAction:(id)sender {
    //TODO vistorMode
}

- (IBAction)registerBtnAction:(id)sender {
    //TODO register
}
@end
