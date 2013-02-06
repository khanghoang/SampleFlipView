//
//  TransitionController.h
//
//  Created by XJones on 11/25/11.
//

#import <UIKit/UIKit.h>

@interface TransitionController : UIViewController

@property (nonatomic, strong)   UIView *                containerView;
@property (nonatomic, strong)   UIViewController *      viewController;

- (id)initWithViewController:(UIViewController *)viewController;
- (void)transitionToViewController:(UIViewController *)viewController
                     withOptions:(UIViewAnimationOptions)options;

- (void)transitionFromUIView:(UIView*)view
            toViewController:(UIViewController *)viewController
              withTransition:(UIViewAnimationOptions)transition
                   withSpeed:(float)speed;

- (void)transitionFromUIView:(UIView*)view
          fromViewController:(UIViewController*)fromViewController
            toViewController:(UIViewController *)toController
              withTransition:(UIViewAnimationOptions)transition
                   withSpeed:(float)second;

@end
