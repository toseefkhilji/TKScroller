//
//  ViewsController.m
//  TKScroller
//
//  Created by Toseefhusen on 28/02/14.
//  Copyright (c) 2014 Toseef Khilji. All rights reserved.
//


#import "ViewsController.h"
#import "TKScroller.h"

@interface ViewsController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation ViewsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIView *v1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    v1.backgroundColor=[UIColor redColor];
    UIView *v2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    v2.backgroundColor=[UIColor greenColor];
   TKScroller *scroller=[[TKScroller alloc]initWithFrame:CGRectMake(5, 5, 100, 100) array:[NSMutableArray arrayWithObjects:self.view1,self.view2,v1,v2,nil] mode:kScrollModeViews];
    
    // scroller.translatesAutoresizingMaskIntoConstraints=NO;
    
    scroller.translatesAutoresizingMaskIntoConstraints=NO;
    scroller.backgroundColor=[UIColor clearColor];
    [self.view addSubview:scroller];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scroller);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[scroller]-1-|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[scroller]-|"
                                                          options: NSLayoutFormatAlignAllRight
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    [self.view layoutIfNeeded];
    

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
