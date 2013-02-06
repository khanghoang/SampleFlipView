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
{
    viewController.view.frame = view.frame;
    
    [UIView transitionWithView:view
                      duration:1.0f
                       options:transition
                    animations:^{
                        
                        CATransform3D t = view.layer.transform;
                        t = CATransform3DTranslate(t, 0.0f, -view.bounds.size.height/2.0f, 0.0f);
                        t = CATransform3DRotate(t, M_PI, 0.0f, 1.0f, 0.0f);
                        t = CATransform3DTranslate(t, 0.0f, view.bounds.size.height/2.0f, 0.0f);
                        view.layer.transform = t;
                        
                        viewController.view.frame = self.containerView.bounds;
                        [self.viewController.view removeFromSuperview];
                        [self.containerView addSubview:viewController.view];
                        
                        
                    }
                    completion:^(BOOL finished){
                        self.viewController = viewController;
                    }];}

@end
