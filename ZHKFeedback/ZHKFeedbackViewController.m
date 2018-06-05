//
//  ZHKFeedbackViewController.m
//  ZHKFeedback
//
//  Created by ZHK on 2018/6/5.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKFeedbackViewController.h"
#import "ZHKFeedbackMacros.h"
#import "ZHKFeedbackTextView.h"
#import <Masonry/Masonry.h>

#define PADDING 15.0
#define TEXT_VIEW_HEIGHT 150.0

@interface ZHKFeedbackViewController ()

@property (nonatomic, strong) ZHKFeedbackTextView *textView;
@property (nonatomic, strong) UIButton       *submitButton;

@end

@implementation ZHKFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户反馈";
    [self createUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UI

- (void)createUI {
    self.view.backgroundColor = ZHK_COLOR(245, 245, 245, 1);
 
    [self.view addSubview:[UIView new]];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.submitButton];
    
//     self.navigationController.navigationBar.translucent;
    CGFloat navHeight = 0.0f;
    
    if (@available(iOS 11.0, *)) {
        navHeight = self.view.safeAreaInsets.top;
    } else {
        navHeight = self.navigationController.navigationBar.translucent ? 64.0f : 0.0f;
    }

    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0.0f);
        make.top.mas_equalTo(15.0f + navHeight);
        make.height.mas_equalTo(200.0f);
    }];
    
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ZHK_BOUNDS.size.width - 2 * PADDING, 44));
        make.top.mas_equalTo(_textView.mas_bottom).offset(navHeight);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
}

#pragma mark - Action

- (void)submitAction {
    [self feedback:_textView.text];
}

- (void)feedback:(NSString *)text {
    
}

- (void)clearText {
    [_textView clearText];
}

#pragma mark - Getter

- (ZHKFeedbackTextView *)textView {
    if (_textView == nil) {
        self.textView = [[ZHKFeedbackTextView alloc] initWithFrame:ZHK_FRAME(0, PADDING, ZHK_BOUNDS.size.width, TEXT_VIEW_HEIGHT)];
    }
    return _textView;
}

- (UIButton *)submitButton {
    if (_submitButton == nil) {
        self.submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
        _submitButton.titleLabel.textColor = [UIColor whiteColor];
        _submitButton.titleLabel.font = [UIFont systemFontOfSize:17];
        _submitButton.backgroundColor = ZHK_COLOR(60, 67, 97, 1);
    }
    return _submitButton;
}

@end
