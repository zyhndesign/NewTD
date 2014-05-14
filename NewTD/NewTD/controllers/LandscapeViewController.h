//
//  LandscapeViewController.h
//  NewTD
//
//  Created by 工业设计中意（湖南） on 14-5-13.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ColumnViewController.h"

@interface LandscapeViewController : ColumnViewController
{
    IBOutlet UILabel *landscapeTitleLabel;
    
    IBOutlet UIScrollView *landscapeScrollView;
    
    IBOutlet UIPageControl *landscapePageControll;
}

@property (strong, nonatomic) IBOutlet UILabel *landscapeTitleLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *landscapeScrollView;
@property (strong, nonatomic) IBOutlet IBOutlet UIPageControl *landscapePageControll;

- (IBAction)changePage:(id)sender;

@end
