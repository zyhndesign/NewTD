//
//  PopupDetailViewController.h
//  NewTD
//
//  Created by 工业设计中意（湖南） on 14-5-12.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../libs/googleAnalytics/GAI.h"

@protocol MJPopupDelegate;

@interface PopupDetailViewController : GAITrackedViewController
{
    NSString *serverID;
    UIButton *backBtn;
    UIWebView *webView;
    UIImageView *aniLayer1;
    UIImageView *aniLayer2;
    NSString *showUrl;
    NSString *videoUrl;
    NSMutableDictionary *urlDict;
    NSMutableArray *videoArray;
}
@property (strong, nonatomic) UIWebView *webView;
@property (weak, nonatomic) id<MJPopupDelegate> delegate;
@property (strong, nonatomic) UIButton *backBtn;
@property (strong,nonatomic) NSString *serverID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andParams:(NSString *)serverID;

@end

@protocol MJPopupDelegate <NSObject>

@optional
- (void)closeButtonClicked;

@end