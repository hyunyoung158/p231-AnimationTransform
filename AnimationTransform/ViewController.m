//
//  ViewController.m
//  AnimationTransform
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)series:(id)sender {
    //연속 애니메이션
    [self rotate:nil];
    //delay 따로
    [self performSelector:@selector(combination:) withObject:nil afterDelay:0.7];
}

//원상복귀
- (IBAction)setOriginal:(id)sender {
    [UIView beginAnimations:@"original" context:nil];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
    
    //블록 방식
    /*
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.transform = CGAffineTransformIdentity;
    }];
     */
}

//두개의 트랜스폼 결합
- (IBAction)combination:(id)sender {
    CGAffineTransform t1 = CGAffineTransformMakeScale(1.2, 1.2);
    CGAffineTransform t2 = CGAffineTransformMakeTranslation(30, 30);
    CGAffineTransform comb = CGAffineTransformConcat(t1, t2);
    CGAffineTransform t = CGAffineTransformConcat(self.imageView.transform, comb);
    
    [UIView beginAnimations:@"id_move" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = t;
    
    [UIView commitAnimations];
    
    //블록방식
    /*
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.transform = t;
    }];
    */
}

- (IBAction)rotate:(id)sender {
    [UIView beginAnimations:@"id_rotate" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    
    [UIView commitAnimations];
    
    //블록방식
    /*
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.transform =CGAffineTransformRotate(self.imageView.transform, M_PI);
    }];
    */
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
