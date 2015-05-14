//
//  ViewController.m
//  YKOpeningIntro
//
//  Created by p2p on 15-3-31.
//  Copyright (c) 2015年 Li Long. All rights reserved.
//

#import "ViewController.h"
#import "YKOpeningIntroView.h"

@interface ViewController () <YKOpeningIntroViewDelegate>

@property (nonatomic, strong) YKOpeningIntroView *openingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.openingView = [[YKOpeningIntroView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.openingView];
    self.openingView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YKOpeningIntroViewDelegate
- (void)finishIntroAction
{
    [UIView animateWithDuration:1.f animations:^{
        self.openingView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self.openingView removeFromSuperview];
    }];
    
}

@end
