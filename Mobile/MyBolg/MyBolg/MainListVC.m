//
//  MainListVC.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "MainListVC.h"
#import "GlobalDefine.h"
#import "MainListCell.h"
#import "LocalDataBase.h"
#import "CoreDataUser.h"
#import "SettingVC.h"
#import "AddBolgVC.h"
#import "Bolg.h"
#import "User.h"
#import "DetailVC.h"

@interface MainListVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation MainListVC

#pragma mark- LifeCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"博客";
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [self loadList];
}

#pragma mark- UI
- (void)setupUI {
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(pushToSettingVC)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self setupTableView];
    
    UIButton *addBtn = [UIButton new];
    [addBtn addTarget:self action:@selector(addNewBolg) forControlEvents:UIControlEventTouchUpInside];
    addBtn.frame = CGRectMake(mainScreenWidth -50 , mainScreenHeight -50 , 30, 30);
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    addBtn.titleLabel.textColor = [UIColor whiteColor];
    addBtn.backgroundColor = [UIColor colorWithRed:108 green:0 blue:96 alpha:1];
    addBtn.layer.cornerRadius = addBtn.bounds.size.height / 2;
    [addBtn.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    addBtn.layer.masksToBounds = YES;
    addBtn.layer.borderWidth = 3;
    [self.view addSubview:addBtn];
    
    
    [self loadList];
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainScreenWidth, mainScreenHeight)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_tableView];
}

- (void)loadList {
    _dataArray = [LocalDataBase getAllBolg];
    [_tableView reloadData];
}

#pragma mark- TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainListCell"];
    if (!cell) {
        cell = [[MainListCell alloc] init];
    }
    Bolg *bolg = [_dataArray objectAtIndex:indexPath.row];
    cell.title = bolg.title;
    cell.detail = bolg.detail;
    cell.username = bolg.username;
    cell.avatar = bolg.avatar;
    cell.createTime = bolg.createTime;
    cell.comments = bolg.comments;
    cell.picture = bolg.picture;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupUI];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailVC *detailVC = [DetailVC new];
    detailVC.blog = [_dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark- BtnAction
- (void)pushToSettingVC {
    SettingVC *settingVC = [BOARD instantiateViewControllerWithIdentifier: @"SettingVC"];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)addNewBolg {
    User *user = [CoreDataUser getUser];
    if ([user.username isEqualToString:@"000000"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"游客不能发博客" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
        [alert show];
    }else {
        AddBolgVC *addBolgVC = [BOARD instantiateViewControllerWithIdentifier:@"AddBolgVC"];
        [self.navigationController pushViewController:addBolgVC animated:YES];

    }
    
}

@end
