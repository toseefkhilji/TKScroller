//
//  TKScroller.h
//  TKScroller
//
//  Created by Toseefhusen on 21/02/14.
//  Copyright (c) 2014 Toseef Khilji. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
typedef enum {
    kScrollModeStatic,
    kScrollModeImageLocal,
    kScrollModeImageWeb,
    kScrollModeViews,
    kScrollModeTextDetail
    
}ScrollerMode;

@interface TKScroller : UIView<UIScrollViewDelegate>
{
    ScrollerMode scrollMode;
    NSMutableArray *arrayData;
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    BOOL pageControlBeingUsed;
    UIInterfaceOrientation lastOrntation;
    
}
@property (assign, nonatomic) ScrollerMode scrollMode;
@property(nonatomic,retain)    NSMutableArray *arrayData;
@property(nonatomic,retain)UIScrollView *scrollView;
@property(nonatomic,retain)UIPageControl *pageControl;

-(id)initWithFrame:(CGRect)frame array:(NSMutableArray *)array mode:(ScrollerMode)mode;
-(void) setData;
-(void) updateFrame;
@end
