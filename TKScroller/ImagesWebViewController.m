//
//  ImagesWebViewController.m
//  TKScroller
//
//  Created by Toseefhusen on 27/02/14.
//  Copyright (c) 2014 Toseef Khilji. All rights reserved.
//


#import "ImagesWebViewController.h"

@interface ImagesWebViewController ()

@end

@implementation ImagesWebViewController

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
    
    
    
    NSURL *url1=[NSURL URLWithString:@"http://i.imgur.com/H49ZkLX.jpg"];
    NSURL *url2=[NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/c/c0/Gol.jpg"];
    NSURL *url3=[NSURL URLWithString:@"http://i.imgur.com/czjCVpk.jpg"];
    NSURL *url4=[NSURL URLWithString:@"http://i.imgur.com/89f9Kbb.png"];
    NSURL *url5=[NSURL URLWithString:@"http://i.imgur.com/r7fuuSy.jpg"];
    TKScroller *scroller=[[TKScroller alloc]initWithFrame:CGRectMake(5, 5, 100, 100) array:[NSMutableArray arrayWithObjects:url1,url2,url3,url4,url5,nil] mode:kScrollModeImageWeb];
    
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
