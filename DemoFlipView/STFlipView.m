//
//  STFlipView.m
//  DemoFlipView
//
//  Created by Trieu Khang on 2/6/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import "STFlipView.h"
#import "STFlipViewController.h"
#import "STAppDelegate.h"

@implementation STFlipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
    UIViewController* destinationVC = [[UIViewController alloc]init];
    destinationVC.view.backgroundColor = [UIColor blueColor];
    STAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    [appDelegate.transitionController transitionFromUIView:self
                                          toViewController:destinationVC
                                            withTransition:UIViewAnimationOptionTransitionFlipFromRight
                                                 withSpeed:1.0f];
}

@end
