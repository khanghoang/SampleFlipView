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
//    UIViewController* destinationVC = [[UIViewController alloc]init];
//    destinationVC.view.backgroundColor = [UIColor blueColor];
//    STAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    
//    [appDelegate.transitionController transitionFromUIView:self.img
//                                        fromViewController:self
//                                          toViewController:destinationVC
//                                            withTransition:UIViewAnimationOptionTransitionFlipFromRight
//                                                 withSpeed:1.0f];
}

@end
