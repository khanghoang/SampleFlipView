//
//  STFlipView.m
//  DemoFlipView
//
//  Created by Trieu Khang on 2/1/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import "STFlipView.h"
#import <QuartzCore/QuartzCore.h>

@interface STFlipView()

@property (assign, nonatomic) BOOL fullScreen;
@property (assign, nonatomic) CGRect originFrame;

@end

@implementation STFlipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.fullScreen = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if(self.originFrame.size.height == 0 && self.originFrame.size.width == 0)
        self.originFrame = self.frame;
    
    [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            if (self.fullScreen) {
                self.frame = screenRect;
            }else{
                self.frame = self.originFrame;
            }
        } completion:^(BOOL finished) {
            self.fullScreen = !self.fullScreen;
    }];
}
@end
