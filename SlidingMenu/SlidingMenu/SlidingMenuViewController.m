//
//  SlidingMenuViewController.m
//  SlidingMenuViewController
//
//  Created by Andrew Long on 6/3/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import "SlidingMenuViewController.h"
#import <QuartzCore/QuartzCore.h>

#define SLIDING_MENU_DEFAULT_ANIMATION_SPEED    .2
#define SLIDING_MENU_DEFAULT_SLIDE_DISTANCE     250

@interface SlidingMenuViewController ()
{
    SlidingMenuSlideState _currentSlideState;
}

- (void)setSlideState:(SlidingMenuSlideState)slideState;

@end

@implementation SlidingMenuViewController

@synthesize menuViewController = _menuViewController;
@synthesize slidingViewController = _slidingViewController;
@synthesize slideAnimationDuration = _slideAnimationDuration;
@synthesize maxSlideDistance = _maxSlideDistance;
@synthesize allowRotation = _allowRotation;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization 
        CGRect fullScreen = [[UIScreen mainScreen] bounds];
        self.view.frame = CGRectMake(0, 0, fullScreen.size.width, fullScreen.size.height);
        _currentSlideState = SlidingMenuSlideStateClosed;
        self.slideAnimationDuration = SLIDING_MENU_DEFAULT_ANIMATION_SPEED;
        self.maxSlideDistance = SLIDING_MENU_DEFAULT_SLIDE_DISTANCE;
        _allowRotation = YES;
    }
    return self;
}

- (void)dealloc
{
    self.menuViewController = nil;
    self.slidingViewController = nil;
    [super dealloc];
}

- (void)setMenuViewController:(UIViewController *)menuViewController
{
    if (self.menuViewController != menuViewController) {
        [self.menuViewController.view removeFromSuperview];
        [self.menuViewController removeFromParentViewController];
        [self.menuViewController release];
        
        _menuViewController = [menuViewController retain];
        [self addChildViewController:self.menuViewController];
        [self.view addSubview:self.menuViewController.view];
    }
    
}

- (void)setSlidingViewController:(UIViewController *)slidingViewController
{
    if (self.slidingViewController != slidingViewController) {
        [self.slidingViewController.view removeFromSuperview];
        self.slidingViewController.view.layer.shadowOpacity = 0.0f;
        self.slidingViewController.view.layer.shadowRadius = 0.0f;
        self.slidingViewController.view.layer.shadowColor = [UIColor clearColor].CGColor;
        [self.slidingViewController removeFromParentViewController];
        [self.slidingViewController release];
        
        
        _slidingViewController = [slidingViewController retain];
        self.slidingViewController.view.layer.shadowOpacity = 0.75f;
        self.slidingViewController.view.layer.shadowRadius = 10.0f;
        self.slidingViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
        
        [self addChildViewController:self.slidingViewController];
        [self.view insertSubview:self.slidingViewController.view atIndex:0];
        [self.view bringSubviewToFront:self.slidingViewController.view];
    }
}

- (void)slide
{
    [self setSlideState:SlidingMenuSlideStateOpposite];
}

- (void)slideOpen
{
    [self setSlideState:SlidingMenuSlideStateOpen];
}

- (void)slideClosed
{
    [self setSlideState:SlidingMenuSlideStateClosed];
}

- (void)setSlideState:(SlidingMenuSlideState)slideState
{
    if (slideState == _currentSlideState) {
        return;
    }
    
    if (slideState == SlidingMenuSlideStateOpposite) {
        if (_currentSlideState == SlidingMenuSlideStateOpen) {
            slideState = SlidingMenuSlideStateClosed;
        } else if (_currentSlideState == SlidingMenuSlideStateClosed) {
            slideState = SlidingMenuSlideStateOpen;
        }
    }
    
    int xPos = self.slidingViewController.view.frame.origin.x;
    
    if (slideState == SlidingMenuSlideStateOpen) {
        // Slide the top view either open or closed
        xPos = self.maxSlideDistance;
    } else if (slideState == SlidingMenuSlideStateClosed) {
        xPos = 0;
    }
    
    [UIView animateWithDuration:self.slideAnimationDuration animations:^{
        CGRect currentSlidingViewFrame = self.slidingViewController.view.frame;
        self.slidingViewController.view.frame = CGRectMake(xPos, currentSlidingViewFrame.origin.y, currentSlidingViewFrame.size.width, currentSlidingViewFrame.size.height);
    } completion:^(BOOL finished) {
        _currentSlideState = slideState;
	}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return self.allowRotation || (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
