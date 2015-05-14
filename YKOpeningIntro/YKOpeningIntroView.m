//
//  YKOpeningIntroView.m
//  YKOpeningIntro
//
//  Created by p2p on 15-3-31.
//  Copyright (c) 2015年 Li Long. All rights reserved.
//

#import "YKOpeningIntroView.h"

@interface YKOpeningIntroView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *introScrollView;
@property (nonatomic, strong) UIPageControl *introPageControl;

@end

@implementation YKOpeningIntroView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImage *backImage = [UIImage imageNamed:@"intro_backgnd"];
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.frame];
        backImageView.image = backImage;
        [self addSubview:backImageView];
        
        self.introScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        self.introScrollView.pagingEnabled = YES;
        [self addSubview:self.introScrollView];

        self.introPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 0.8f, self.frame.size.width, 10)];
        [self addSubview:self.introPageControl];
        
        // configure
        [self.introScrollView setContentSize:CGSizeMake(self.frame.size.width * 4, self.frame.size.height)];
        [self.introScrollView setContentOffset:CGPointMake(0.f, 0.f) animated:YES];
        self.introScrollView.delegate = self;
        self.introScrollView.showsVerticalScrollIndicator = NO;
        self.introScrollView.showsHorizontalScrollIndicator = NO;
        
        self.introPageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.15 green:0.52 blue:0.83 alpha:1.0];
        self.introPageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.17 green:0.17 blue:0.17 alpha:1.0f];
        self.introPageControl.numberOfPages = 4;
        
        [self addIntroPageView1];
        [self addIntroPageView2];
        [self addIntroPageView3];
        [self addIntroPageView4];
    }
    
    return self;
}

- (void)addIntroPageView1
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    UIView *introView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    UIImage *introImage = [UIImage imageNamed:@"intro_page_1"];
    UIImageView *introImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width*0.1, height*0.1, width*0.8, width*0.8)];
    introImageView.image = introImage;
    [introView addSubview:introImageView];
    [self.introScrollView addSubview:introView];
    
}

- (void)addIntroPageView2
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    UIView *introView = [[UIView alloc] initWithFrame:CGRectMake(width*1, 0, width, height)];
    UIImage *introImage = [UIImage imageNamed:@"intro_page_2"];
    UIImageView *introImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width*0.1, height*0.1, width*0.8, width*0.8)];
    introImageView.image = introImage;
    [introView addSubview:introImageView];
    [self.introScrollView addSubview:introView];
}

- (void)addIntroPageView3
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    UIView *introView = [[UIView alloc] initWithFrame:CGRectMake(width*2, 0, width, height)];
    UIImage *introImage = [UIImage imageNamed:@"intro_page_3"];
    UIImageView *introImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width*0.1, height*0.1, width*0.8, width*0.8)];
    introImageView.image = introImage;
    [introView addSubview:introImageView];
    [self.introScrollView addSubview:introView];
}

- (void)addIntroPageView4
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    UIView *introView = [[UIView alloc] initWithFrame:CGRectMake(width*3, 0, width, height)];
    UIImage *introImage = [UIImage imageNamed:@"intro_page_4"];
    UIImageView *introImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width*0.1, height*0.1, width*0.8, width*0.8)];
    introImageView.image = introImage;
    [introView addSubview:introImageView];
    
    UIButton *goButton = [[UIButton alloc] initWithFrame:CGRectMake(width*0.1, height*0.85, width*0.8, 60)];
    [goButton setTintColor:[UIColor whiteColor]];
    [goButton setTitle:@"开始体验" forState:UIControlStateNormal];
    [goButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0]];
    goButton.backgroundColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000];
    goButton.layer.borderColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000].CGColor;
    [goButton addTarget:self action:@selector(finishIntroAction:) forControlEvents:UIControlEventTouchUpInside];
    goButton.layer.borderWidth =.5;
    goButton.layer.cornerRadius = 15;
    [introView addSubview:goButton];
    [self.introScrollView addSubview:introView];
}

- (IBAction)finishIntroAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(finishIntroAction)])
    {
        [self.delegate finishIntroAction];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    self.introPageControl.currentPage = roundf(scrollView.contentOffset.x / pageWidth);
}

@end
