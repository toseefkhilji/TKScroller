//
//  TKScroller.m
//  TKScroller
//
//  Created by Toseefhusen on 21/02/14.
//  Copyright (c) 2014 Toseef Khilji. All rights reserved.
//


#import "TKScroller.h"

#define isPortrait  UIDeviceOrientationIsPortrait(dDeviceOrientation)
#define isLandscape UIDeviceOrientationIsLandscape(dDeviceOrientation)

@interface TKScroller ()
{
    UIView *viewMain;
}

@end


@implementation TKScroller

@synthesize scrollMode,arrayData,scrollView,pageControl;

-(id)initWithFrame:(CGRect)frame array:(NSMutableArray *)array mode:(ScrollerMode)mode{
    self=[super initWithFrame:frame];
    if (self) {
        // Initialization code
        arrayData=array;
        scrollMode=mode;
        
        pageControlBeingUsed=NO;
        scrollView=[UIScrollView new];
        pageControl=[UIPageControl new];
        viewMain=[UIView new];
        scrollView.delegate=self;
        
        scrollView.pagingEnabled=YES;
       scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.showsVerticalScrollIndicator=NO;
        
        scrollView.translatesAutoresizingMaskIntoConstraints=NO;
        pageControl.translatesAutoresizingMaskIntoConstraints=NO;
      //  viewMain.translatesAutoresizingMaskIntoConstraints=NO;

        
        scrollView.backgroundColor=[UIColor clearColor];
        pageControl.backgroundColor=[UIColor darkGrayColor];
        [pageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];

        [self addSubview:scrollView];
        [self addSubview:pageControl];
        self.pageControl.currentPage = 0;
        //[self setNeedsUpdateConstraints];
        //[self updateConstraintsIfNeeded];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
        [self setData];
        
    }
    return self;
}
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

- (void)updateConstraints
{
    [super updateConstraints];
    

    [self removeConstraints:self.constraints];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scrollView,pageControl);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[scrollView]-5-|" options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[pageControl]-5-|" options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[scrollView][pageControl(20)]-5-|"
                                                          options: NSLayoutFormatAlignAllRight
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self addConstraints:constraints];
    @try {
        [self updateFrame];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
        
    }
    //[self setData];
}

-(void)orientationChanged{
    
//    if (!lastOrntation) {
//        lastOrntation=interfaceOrientation;
//    }
//    
//    
//    if (UIInterfaceOrientationIsLandscape(lastOrntation))
//    {
//        NSLog(@"Lands");
//    }
//    else
//    {
//                NSLog(@"potr");
//    }

    @try {
        [self updateFrame];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
}



-(void)updateFrame{
    
    [self layoutIfNeeded];
    CGRect mainFrame=scrollView.frame;
    CGRect frame;
    CGRect imageframe;

    NSArray *array=scrollView.subviews;
    int k=0;
    for (UIView *view  in array){
        frame.origin.x = mainFrame.size.width * k;
		frame.origin.y = 0;
		frame.size = mainFrame.size;
        view.frame=frame;
        if (scrollMode==kScrollModeImageLocal){
            view.backgroundColor=[UIColor darkGrayColor];
            [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIScrollView *scv=[[UIScrollView alloc]initWithFrame:frame];
            scv.backgroundColor=[UIColor lightGrayColor];
            scv.delegate=self;
            scv.tag=11;
            scv.minimumZoomScale=1;
            scv.maximumZoomScale=3;
            scv.showsHorizontalScrollIndicator=NO;
            scv.showsVerticalScrollIndicator=NO;
            imageframe=frame;
            frame.origin=CGPointMake(0, 0);
            scv.frame=frame;
            imageframe.origin=CGPointMake(0, 0);
            imageframe.size.height-=2;
            imageframe.size.width-=2;
            UIImageView *imgvw=[[UIImageView alloc]initWithFrame:imageframe];
            imgvw.contentMode=UIViewContentModeScaleAspectFit;
            UIImage *img=[UIImage imageNamed:[NSString stringWithFormat:@"%@",[arrayData objectAtIndex:k]]];
            imgvw.image=img;
            imgvw.backgroundColor=[UIColor lightGrayColor];
            [imgvw setCenter:CGPointMake(CGRectGetMidX([imgvw bounds]), CGRectGetMidY([imgvw bounds]))];
            //NSLog(@"scv: %@",NSDictionaryOfVariableBindings(scv));
            [scv addSubview:imgvw];
            [view addSubview:scv];
        
        }
        else if ( scrollMode==kScrollModeImageWeb){
            view.backgroundColor=[UIColor darkGrayColor];
            [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIScrollView *scv=[[UIScrollView alloc]initWithFrame:frame];
            scv.backgroundColor=[UIColor lightGrayColor];
            scv.delegate=self;
            scv.tag=12;
            scv.minimumZoomScale=1;
            scv.maximumZoomScale=3;
            scv.showsHorizontalScrollIndicator=NO;
            scv.showsVerticalScrollIndicator=NO;
            imageframe=frame;
            frame.origin=CGPointMake(0, 0);
            scv.frame=frame;
            imageframe.origin=CGPointMake(0, 0);
            imageframe.size.height-=2;
            imageframe.size.width-=2;
            AsyncImageView *imgvw=[[AsyncImageView alloc]initWithFrame:imageframe];
            //imgvw.contentMode=UIViewContentModeScaleAspectFit;
           // UIImage *img=[UIImage imageNamed:[NSString stringWithFormat:@"%@",[arrayData objectAtIndex:k]]];
            [imgvw loadImageFromURL:[arrayData objectAtIndex:k]];
//            imgvw.image=img;
            imgvw.backgroundColor=[UIColor lightGrayColor];
            [imgvw setCenter:CGPointMake(CGRectGetMidX([imgvw bounds]), CGRectGetMidY([imgvw bounds]))];
            //NSLog(@"scv: %@",NSDictionaryOfVariableBindings(scv));
            [scv addSubview:imgvw];
            [view addSubview:scv];
        }
        else if (scrollMode==kScrollModeTextDetail){
            
            view.backgroundColor=[UIColor darkGrayColor];
            [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIScrollView *scv=[[UIScrollView alloc]initWithFrame:frame];
            scv.backgroundColor=[UIColor lightGrayColor];
            scv.delegate=self;
            scv.tag=11;
            scv.minimumZoomScale=1;
            scv.maximumZoomScale=3;
            //scv.showsHorizontalScrollIndicator=NO;
            //scv.showsVerticalScrollIndicator=NO;
            
            frame.origin=CGPointMake(0, 0);
            scv.frame=frame;
            NSArray *ar=[self arrayFromDict:[arrayData objectAtIndex:k]];
            int y=10;
            if (ar){
                for (int i=0; i<ar.count; i++){
                    NSDictionary *dict=[ar objectAtIndex:i];
                    UILabel *lblTitle=[[UILabel alloc]initWithFrame:CGRectMake(5, y, scv.frame.size.width, 40)];
                    [lblTitle setBackgroundColor:[UIColor clearColor]];
                    lblTitle.textColor=[UIColor colorWithRed:221.0/255.0 green:43/255.0 blue:104.0/255.0 alpha:1];
                    lblTitle.text=[[dict objectForKey:@"Key"]uppercaseString];
                    lblTitle.numberOfLines=0;
                    [lblTitle sizeToFit];
                    
                    UILabel *lblValue=[[UILabel alloc]initWithFrame:CGRectMake(5,y+ lblTitle.frame.size.height+2, scv.frame.size.width, 40)];
                    [lblValue setBackgroundColor:[UIColor clearColor]];
                    lblValue.text=[dict objectForKey:@"Value"];
                    [lblValue setTextColor:[UIColor whiteColor]];
                    lblValue.numberOfLines=0;
                    [lblValue sizeToFit];
                    y+=lblTitle.frame.size.height+lblValue.frame.size.height+20;
                    [scv addSubview:lblTitle];
                    [scv addSubview:lblValue];
                }
                [scv setContentSize:CGSizeMake(scv.frame.size.width, y)];
            }
            scv.backgroundColor = [UIColor clearColor];
            [view addSubview:scv];
        }
        k++;
    }
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * arrayData.count, mainFrame.size.height/2);
    [self changePage];
}

-(NSMutableArray *)arrayFromDict:(NSDictionary*)dict{
    
    NSMutableArray *array=[NSMutableArray new];
    NSArray *arKey=[dict allKeys];
    for (NSString *key in arKey)
    {
        NSMutableDictionary *dicts=[NSMutableDictionary new];
        [dicts setObject:key forKey:@"Key"];
        [dicts setObject:[dict objectForKey:key] forKey:@"Value"];
        [array addObject:dicts];
    }
    return array;
}
-(void)setData{
    [scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i=0; i<arrayData.count ; i++){
        UIView *subview=[UIView new];
        if (scrollMode==kScrollModeViews)
        {
            subview=[arrayData objectAtIndex:i];
        }
        else{
            subview.backgroundColor = [self getRandomColor];
        }
        subview.tag=i;
        [scrollView addSubview:subview];
	}
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * arrayData.count, scrollView.frame.size.height/2);
	self.pageControl.numberOfPages = arrayData.count;
    pageControlBeingUsed = NO;
}

-(UIColor *)getRandomColor{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    return [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    if(sender.tag!=11){
        if (!pageControlBeingUsed) {
            // Switch the indicator when more than 50% of the previous/next page is visible
            CGFloat pageWidth = scrollView.frame.size.width;
            int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
            pageControl.currentPage = page;
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollViewa {
    if(scrollViewa.tag!=11){
        pageControlBeingUsed = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollViewa {
    if(scrollViewa.tag!=11){
        pageControlBeingUsed = NO;
    }
}
- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
	CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
    }
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
	
	return frameToCenter;
}
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollViews{
    
    if (scrollViews.tag==11||scrollViews.tag==12) {
        for (UIImageView *b in scrollViews.subviews) {
            return b;
        }
        return nil;
    }
    else{
        return scrollViews;
    }
}


- (IBAction)changePage {
	// Update the scroll view to the appropriate page
    CGRect frame;
	frame.origin.x = scrollView.frame.size.width * pageControl.currentPage;
	frame.origin.y = 0;
	frame.size = scrollView.frame.size;
	[scrollView scrollRectToVisible:frame animated:YES];
	pageControlBeingUsed = YES;
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
