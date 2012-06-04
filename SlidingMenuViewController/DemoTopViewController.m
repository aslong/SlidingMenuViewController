//
//  DemoTopViewController.m
//  SlidingMenuViewController
//
//  Created by Andrew Long on 6/3/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import "DemoTopViewController.h"

@interface DemoTopViewController ()
{
    UIButton *showMenuButton;
}

@end

@implementation DemoTopViewController

@synthesize slidingMenu = _slidingMenu;

- (id)initWithSlidingMenu:(SlidingMenuViewController *)slidingMenu
{
    self = [super init];
    if (self) {
        self.slidingMenu = slidingMenu;
        // Custom initialization
        self.view.backgroundColor = [UIColor greenColor];
        showMenuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        showMenuButton.frame = CGRectMake(0, 0, 100, 40);
        [showMenuButton setTitle:@"show menu" forState:UIControlStateNormal];
        [showMenuButton addTarget:self
                           action:@selector(showMenu)
                 forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:showMenuButton];
    }
    return self;
}

- (void)dealloc
{
    showMenuButton = nil;
    [super dealloc];
}

- (void)showMenu
{
    NSLog(@"button tapped");
    [self.slidingMenu slide];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view layer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
