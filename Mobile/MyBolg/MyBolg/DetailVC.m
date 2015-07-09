//
//  DetailVC.m
//  MyBolg
//
//  Created by GX on 15/7/9.
//  Copyright (c) 2015年 AG. All rights reserved.
//

#import "DetailVC.h"

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    [self.view addSubview:textView];
    
    textView.text = [NSString stringWithFormat:@"%@\nCreated By %@\n%@\n%@",_blog.title,_blog.username,_blog.createTime,_blog.detail];
}

@end
