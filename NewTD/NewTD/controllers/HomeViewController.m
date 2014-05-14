//
//  HomeViewController.m
//  NewTD
//
//  Created by 工业设计中意（湖南） on 14-5-13.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HomeViewController.h"
#import "../classes/DBUtils.h"
#import "PopupDetailViewController.h"
#import "../classes/FileUtils.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize columnBigBg,firstViewPanel,firstArticleTitle,firstArticleTime;
@synthesize secondViewPanel,secondArticleTimeLabel,secondArticleThumb,secondArticleTitleLabel,secondArticleSummaryLabel;
@synthesize threeViewPanel,threeArticleTimeLabel,threeArticleThumb,threeArticleTitleLabel,threeArticleSummaryLabel;
@synthesize fourViewPanel,fourArticleTimeLabel,fourArticleThumb,fourArticleTitleLabel,fourArticleSummaryLabel;

extern DBUtils *db;
FileUtils *fileUtils;
PopupDetailViewController* detailViewController;

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
    
    fileUtils = [FileUtils new];
    [fileUtils createAppFilesDir];
    
    firstViewPanel.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
