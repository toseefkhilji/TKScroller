//
//  ViewController.m
//  TKScroller
//
//  Created by Toseefhusen on 21/02/14.
//  Copyright (c) 2014 Toseef Khilji. All rights reserved.
//


#import "ViewController.h"
#import "TKScroller.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    
//    TKScroller *scroller=[[TKScroller alloc]initWithFrame:self.view.bounds array:[NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"" ,nil] mode:kScrollModeStatic];
//    
//    scroller.translatesAutoresizingMaskIntoConstraints=NO;
//    scroller.backgroundColor=[UIColor clearColor];
//    [self.view addSubview:scroller];
    
//    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scroller);
//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[scroller]-1-|" options:0 metrics:nil views:viewsDictionary];
//    [self.view addConstraints:constraints];
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[scroller]-|"
//                                                          options: NSLayoutFormatAlignAllRight
//                                                          metrics:nil
//                                                            views:viewsDictionary];
//    [self.view addConstraints:constraints];
//    [self.view layoutIfNeeded];
  //  NSLog(@"%@",NSDictionaryOfVariableBindings(scroller));
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
