//
//  SlidingMenuViewController.h
//  SlidingMenuViewController
//
//  Created by Andrew Long on 6/3/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	SlidingMenuSlideStateOpen = 0,
	SlidingMenuSlideStateClosed = 1,
    SlidingMenuSlideStateOpposite = 2
} SlidingMenuSlideState;

@interface SlidingMenuViewController : UIViewController
{
    UIViewController *_menuViewController;
    UIViewController *_slidingViewController;
    NSTimeInterval _slideAnimationDuration;
    CGFloat _maxSlideDistance;
    BOOL _allowRotation;
}

@property(nonatomic, retain) UIViewController *menuViewController;
@property(nonatomic, retain) UIViewController *slidingViewController;
@property(nonatomic, assign) NSTimeInterval slideAnimationDuration;
@property(nonatomic, assign) CGFloat maxSlideDistance;
@property(nonatomic, assign) BOOL allowRotation;

- (void)slide;
- (void)slideOpen;
- (void)slideClosed;

@end
