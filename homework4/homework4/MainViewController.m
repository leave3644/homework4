//
//  MainViewController.m
//  homework4
//
//  Created by Kaili An on 6/21/14.
//  Copyright (c) 2014 Kelly An. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)handleNewsPan:(UIPanGestureRecognizer *)newsrecognizer;
@property (assign, nonatomic) CGPoint originalLocation;


@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu"]];
////        [backgroundImage setFrame:CGRectMake(0, 0, 100, 100)];
//        [self.view addSubview:backgroundImage];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
    }
     [self.view addGestureRecognizer:recognizer];
    
}

- (IBAction)handleNewsPan:(UIPanGestureRecognizer *)newsrecognizer  {
    CGPoint translation = [newsrecognizer translationInView:self.view];
    newsrecognizer.view.center = CGPointMake(newsrecognizer.view.center.x + translation.x,newsrecognizer.view.center.y + translation.y);
    
    [newsrecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (newsrecognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [newsrecognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(newsrecognizer.view.center.x + (velocity.x * slideFactor),
                                         newsrecognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            newsrecognizer.view.center = finalPoint;
        } completion:nil];
        
    }
    else if(newsrecognizer.state == UIGestureRecognizerStateBegan){
        
    }
   
    
}
@end
