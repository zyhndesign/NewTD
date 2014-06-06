//
//  MapViewController.h
//  TongDao
//
//  Created by 工业设计中意（湖南） on 14-5-30.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>

@protocol PopLayerProtocol;

@interface MapViewController : UIViewController<MAMapViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *backBtn;

@property (weak, nonatomic) id<PopLayerProtocol> delegate;

@property (nonatomic, strong) MAMapView *mapView;
@end
