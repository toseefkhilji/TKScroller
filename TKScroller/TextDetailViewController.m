//
//  TextDetailViewController.m
//  TKScroller
//
//  Created by Toseefhusen on 28/02/14.
//  Copyright (c) 2014 Toseef Khilji. All rights reserved.
//


#import "TextDetailViewController.h"
#import "TKScroller.h"

@interface TextDetailViewController ()

@end

@implementation TextDetailViewController

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
    
     NSDictionary *dict1=@{@"Tile": @"This is the Title",@"Detail":@"This is Blah blah blah detail of aasd asdf asde  bus yahi bat he. asdf adsf asd"};
      NSDictionary *dict2=@{@"Tile": @"This is the Title4",@"Detail":@"Thiasd fs is Blah blasdf asdf asdh blah detail of aasd asdf asde  bus yahi bat he. asdf adsf asd"};
     NSDictionary *dict3=@{@"Tile": @"This is the Title3",@"Detail":@"This is  asdf  asdf asdf asdfalah blah blah detail of aasd asdf asde  bus yahi bat he. asdf adsf asd"};
    TKScroller *scroller=[[TKScroller alloc]initWithFrame:CGRectMake(5, 5, 100, 100) array:[NSMutableArray arrayWithObjects:dict1,dict2,dict3,nil] mode:kScrollModeTextDetail];
    
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
