//
//  YKOpeningIntroView.h
//  YKOpeningIntro
//
//  Created by p2p on 15-3-31.
//  Copyright (c) 2015年 Li Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YKOpeningIntroViewDelegate <NSObject>
- (void)finishIntroAction;
@end

@interface YKOpeningIntroView : UIView
@property (nonatomic, weak) id<YKOpeningIntroViewDelegate> delegate;
@end
