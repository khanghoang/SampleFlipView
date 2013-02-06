//
//  TransitionController.m
//
//  Created by XJones on 11/25/11.
//

#import "TransitionController.h"
#import <QuartzCore/QuartzCore.h>

@implementation TransitionController

@synthesize containerView = _containerView,
            viewController = _viewController;

- (id)initWithViewController:(UIViewController *)viewController
{
    if (self = [super init]) {
        _viewController = viewController;
    }
    return self;
}

- (void)loadView
{
    self.wantsFullScreenLayout = YES;
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.view = view;
    
    _containerView = [[UIView alloc] initWithFrame:view.bounds];
    _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_containerView];
    
    [_containerView addSubview:self.viewController.view];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return [self.viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.viewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.viewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

- (void)transitionToViewController:(UIViewController *)aViewController
                     withOptions:(UIViewAnimationOptions)options
{
    
    [UIView transitionWithView:self.containerView
                      duration:0.65f
                       options:options
                    animations:^{
                        aViewController.view.frame = self.containerView.bounds;
                        [self.viewController.view removeFromSuperview];
                        [self.containerView addSubview:aViewController.view];
                        
                    }
                    completion:^(BOOL finished){
                        self.viewController = aViewController;
                    }];
}


- (void)transitionFromUIView:(UIView*)view
            toViewController:(UIViewController *)viewController
              withTransition:(UIViewAnimationOptions)transition
                   withSpeed:(float)speed
{
    viewController.view.frame = view.bounds;
    
    [UIView transitionWithView:view
                      duration:speed
                       options:transition
                    animations:^{
                        [view addSubview:viewController.view];
                    }
                    completion:^(BOOL finished){
                        [self presentModalViewController:viewController animated:NO];
                    }];
    
    [UIView animateWithDuration:speed animations:^{
        view.frame = [[UIScreen mainScreen] bounds];
    }];
    
}

- (void)transitionFromUIView:(UIView*)view
          fromViewController:(UIViewController*)fromViewController
            toViewController:(UIViewController *)viewController
              withTransition:(UIViewAnimationOptions)transition
                   withSpeed:(float)speed
{
    viewController.view.frame = view.bounds;
    
    [UIView transitionWithView:view
                      duration:speed
                       options:transition
                    animations:^{
                        [view addSubview:viewController.view];
                    }
                    completion:^(BOOL finished){
                        [self presentModalViewController:viewController animated:NO];
                    }];

    [UIView animateWithDuration:speed animations:^{        
        view.frame = fromViewController.view.bounds;
    }];
    
}
@end
