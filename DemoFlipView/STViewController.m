//
//  STViewController.m
//  DemoFlipView
//
//  Created by Trieu Khang on 2/1/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import "STViewController.h"
#import "STFlipViewController.h"
#import "TransitionController.h"
#import "STAppDelegate.h"
#import "STFlipView.h"
#import <QuartzCore/QuartzCore.h>

@interface STViewController ()
@property (weak, nonatomic) IBOutlet STFlipView *img;

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer* tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    
    [self.img addGestureRecognizer:tapImage];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapImage:(id)sender
{
    UIViewController* destinationVC = [[UIViewController alloc]init];
    //    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"car.jpg"]];
    //    imageView.frame = CGRectMake(0,0,300,300);
    
    destinationVC.view.backgroundColor = [UIColor orangeColor];
    
    //    [destinationVC.view addSubview:imageView];
    
    STAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.transitionController transitionFromUIView:self.img toViewController:destinationVC withTransition:UIViewAnimationOptionTransitionFlipFromRight];
    
//    [appDelegate.transitionController transitionToViewController:destinationVC withOptions:UIViewAnimationOptionTransitionFlipFromRight];
    
//    [UIView transitionWithView:self.img
//                      duration:1.0f
//                       options:nil
//                    animations:^{
//                                CATransform3D t = self.img.layer.transform;
//                                t = CATransform3DTranslate(t, 0.0f, -self.img.bounds.size.height/2.0f, 0.0f);
//                                t = CATransform3DRotate(t, M_PI, 0.0f, 1.0f, 0.0f);
//                                t = CATransform3DTranslate(t, 0.0f, self.img.bounds.size.height/2.0f, 0.0f);
//                                self.img.layer.transform = t;
//                        [appDelegate.transitionController transitionFromUIView:self.img toViewController:destinationVC withTransition:UIViewAnimationOptionTransitionFlipFromRight];
//    } completion:^(BOOL finished) {
//        
//
//    }];
    
    

}

@end
