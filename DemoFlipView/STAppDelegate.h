//
//  STAppDelegate.h
//  DemoFlipView
//
//  Created by Trieu Khang on 2/1/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionController.h"

@interface STAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TransitionController *transitionController;

//- (void)transitionToViewController:(UIViewController *)viewController
//                    withTransition:(UIViewAnimationOptions)transition;

@end
