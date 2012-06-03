//
//  DemoTopViewController.h
//  SlidingMenuViewController
//
//  Created by Andrew Long on 6/3/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlidingMenuViewController.h"

@interface DemoTopViewController : UIViewController
{
    SlidingMenuViewController *_slidingMenu;
}

@property (nonatomic, retain) SlidingMenuViewController *slidingMenu;

- (id)initWithSlidingMenu:(SlidingMenuViewController *)slidingMenu;

@end
