//
//  LabelsViewController.m
//  TKScroller
//
//  Created by Toseefhusen on 27/02/14.
//  Copyright (c) 2014 Toseef Khilji. All rights reserved.
//


#import "LabelsViewController.h"

@interface LabelsViewController (){
    NSMutableArray *textFields;
    UIView *topSpacer;
    UIScrollView *scrollView;
}
@property(nonatomic,strong)IBOutlet  UIScrollView *scrollView;
@end


@implementation LabelsViewController
@synthesize scrollView;
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
  //  self.view.translatesAutoresizingMaskIntoConstraints = NO;
   // [self addTextFields];
  //  [self addSpacers];
    
    UIView *sc=[UIView new];
    sc.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:sc];
    sc.backgroundColor=[UIColor purpleColor];
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(sc);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[sc]-|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[sc]-|"
                                                          options: NSLayoutFormatAlignAllRight
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    
    
    
    
    UIView *customImageView = [UIView new];
    customImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [sc addSubview:customImageView];
    [customImageView setBackgroundColor:[UIColor redColor]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customImageView
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:sc
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:25.0]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customImageView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:100.0]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customImageView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:sc
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:3.0]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customImageView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:sc
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:-3.0]];
    
    
    UIView *customLabel = [UIView new];
    customLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [sc addSubview:customLabel];
    [customLabel setBackgroundColor:[UIColor darkGrayColor]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:customImageView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:10.0]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:sc
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:-10.0]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:sc
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:3.0]];
    
    [sc addConstraint:[NSLayoutConstraint constraintWithItem:customLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:sc
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:-3.0]];

//
    
    
}
-(UIColor *)getRandomColor{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    return [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
}


- (void)addTextFields {
    textFields = [NSMutableArray array];
    for (int i = 0; i < 12; ++i) {
        [self addTextField];
    }
}

- (void)addTextField {
    UITextField *field = [[UITextField alloc] init];
    field.backgroundColor = [UIColor colorWithHue:0.8 saturation:0.1 brightness:0.9 alpha:1];
    field.translatesAutoresizingMaskIntoConstraints = NO;
    field.text = [field description];
    [self.view addSubview:field];
    [field setContentCompressionResistancePriority:UILayoutPriorityRequired
                                           forAxis:UILayoutConstraintAxisVertical];
    [field setContentHuggingPriority:UILayoutPriorityRequired
                             forAxis:UILayoutConstraintAxisVertical];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[field]-|" options:0 metrics:nil
                               views:NSDictionaryOfVariableBindings(field)]];
    [textFields addObject:field];
}

- (void)addSpacers {
    [self addTopSpacer];
    for (int i = 1, count = textFields.count; i < count; ++i) {
        [self addSpacerFromBottomOfView:textFields[i - 1]
                            toTopOfView:textFields[i]];
    }
    [self addBottomSpacer];
}

- (void)addTopSpacer {
    UIView *spacer = [self newSpacer];
    UITextField *field = textFields[0];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|[spacer][field]" options:0 metrics:nil
                               views:NSDictionaryOfVariableBindings(spacer, field)]];
    topSpacer = spacer;
}

- (UIView *)newSpacer {
    UIView *spacer = [[UIView alloc] init];
    spacer.hidden = YES; // Views participate in layout even when hidden.
    spacer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:spacer];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|[spacer]|" options:0 metrics:nil
                               views:NSDictionaryOfVariableBindings(spacer)]];
    return spacer;
}

- (void)addSpacerFromBottomOfView:(UIView *)overView toTopOfView:(UIView *)underView {
    UIView *spacer = [self newSpacer];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[overView][spacer(==topSpacer)][underView]" options:0 metrics:nil
                               views:NSDictionaryOfVariableBindings(spacer, overView, underView, topSpacer)]];
}

- (void)addBottomSpacer {
    UIView *spacer = [self newSpacer];
    UITextField *field = textFields.lastObject;
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[field][spacer(==topSpacer)]|" options:0 metrics:nil
                               views:NSDictionaryOfVariableBindings(spacer, field, topSpacer)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
