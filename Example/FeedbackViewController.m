//
//  FeedbackViewController.m
//  ZHKFeedback
//
//  Created by ZHK on 2018/6/5.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "FeedbackViewController.h"


@interface FeedbackViewController ()


@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)feedback:(NSString *)text {
    if (text.length > 200) {
        [self alert:@"用户反馈最多只能输入200个字符!"];
    } else if (text.length == 0) {
        [self alert:@"请输入反馈内容!"];
    } else {
        [self alert:text];
    }
}

- (void)alert:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户反馈" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
