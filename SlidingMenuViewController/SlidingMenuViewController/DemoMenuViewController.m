//
//  DemoMenuViewController.m
//  SlidingMenuViewController
//
//  Created by Andrew Long on 6/3/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import "DemoMenuViewController.h"

@interface DemoMenuViewController ()
{
    UITableView *_demoList;
}

@property (nonatomic, retain) UITableView *demoList;

@end

@implementation DemoMenuViewController

@synthesize demoList = _demoList;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor blackColor];
        [self.view setFrame:CGRectMake(0, 0, 200, 200)];
        self.view.autoresizingMask = UIViewAutoresizingNone;
        self.demoList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        self.demoList.dataSource = self;
        [self.view addSubview:self.demoList];
    }
    return self;
}

- (void)dealloc
{
    self.demoList = nil;
    [super dealloc];
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
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if(!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
	}
    
    cell.textLabel.text = @"Demo menu";
    
    return cell;
}

@end
