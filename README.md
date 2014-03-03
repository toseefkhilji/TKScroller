TKScroller
==========

TKScroller is a simple iOS app with UIScrollView + UIPagecontrol , 
TKScroller can display one or more images , Create Tutorail screen , Show Text Details + show different viewcontrollers views,Web & Local Photos mPhotos can be zoomed and panned. 
The browser can also be used to allow the user to share image to social networking sites from main detail image view.


![logo](http://i.imgur.com/MA9WWaD.png)

## Requirements ##

1) Xcode 5 and above versions.

2) ARC


## Usage ##

1) Import `TKScroller.h` 

2) Choose Mode which You want from 

    kScrollModeStatic,
    kScrollModeImageLocal,
    kScrollModeImageWeb,
    kScrollModeViews,
    kScrollModeTextDetail

3) Create Array of Images and alloc TKScroller 

      TKScroller *scroller=[[TKScroller alloc]initWithFrame:CGRectMake(5, 5, 100, 100) array:[NSMutableArray arrayWithObjects:@"01.jpg",@"02.jpg",@"03.jpg",@"04.jpg",@"05.jpg",@"06.jpg",nil] mode:kScrollModeImageLocal];
      
      
4) Add it to your view

      [self.view addSubview:scroller ];

License
-------

TKScroller is available under the MIT license. See the LICENSE file for more info.
