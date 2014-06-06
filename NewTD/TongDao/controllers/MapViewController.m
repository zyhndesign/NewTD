//
//  MapViewController.m
//  TongDao
//
//  Created by 工业设计中意（湖南） on 14-5-30.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "MapViewController.h"
#import "../protocols/PopLayerProtocol.h"

@interface MapViewController ()<PopLayerProtocol>
{
    CLLocationDegrees latitude;
    CLLocationDegrees longitude;
    NSMutableArray *annotations;
}

@end

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize backBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initAnnotations];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //通道的经纬度
    latitude = 26.16098484;
    longitude = 109.78500366;
    
    self.view.backgroundColor = [UIColor clearColor];
    
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view.
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btnBackNormal"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btnBackPressed"] forState:UIControlStateSelected];
    
    [backBtn addTarget:self action:@selector(BtnCloseClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 50, 1024, 718)];
    
    //self.mapView.frame = self.view.bounds;
    
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    
    //self.mapView.visibleMapRect = MAMapRectMake(220880104, 101476980, 272496, 466656);
    
    self.mapView.showsUserLocation = YES;
    
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    NSLog(@"maxZoomLevel : %f, minZoomLevel : %f",self.mapView.maxZoomLevel, self.mapView.minZoomLevel);
    
    self.mapView.zoomLevel = 12.0;
    
    [self.mapView addAnnotations:annotations];
}

-(void) initAnnotations
{
    annotations = [NSMutableArray array];
    
    MAPointAnnotation *ytbTown = [[MAPointAnnotation alloc] init];
    ytbTown.coordinate = CLLocationCoordinate2DMake(26.14341884, 109.63788986);
    ytbTown.title = @"文章标题";
    ytbTown.accessibilityValue=@"00000001";
    
    [annotations insertObject:ytbTown atIndex:0];
    
    MAPointAnnotation *ptTown = [[MAPointAnnotation alloc] init];
    ptTown.coordinate = CLLocationCoordinate2DMake(26.03164338, 109.71874237);
    ptTown.title = @"文章标题";
    ytbTown.accessibilityValue=@"00000002";
    [annotations insertObject:ptTown atIndex:1];
    
    MAPointAnnotation *gxTown = [[MAPointAnnotation alloc] init];
    gxTown.coordinate = CLLocationCoordinate2DMake(25.91312221, 109.74809647);
    gxTown.title = @"文章标题";
    ytbTown.accessibilityValue=@"00000003";
    [annotations insertObject:gxTown atIndex:2];
    
    MAPointAnnotation *wfHill = [[MAPointAnnotation alloc] init];
    wfHill.coordinate = CLLocationCoordinate2DMake(26.32849908, 109.89143372);
    wfHill.title = @"文章标题";
    ytbTown.accessibilityValue=@"00000004";
    [annotations insertObject:wfHill atIndex:3];
    
    MAPointAnnotation *hdVillage = [[MAPointAnnotation alloc] init];
    hdVillage.coordinate = CLLocationCoordinate2DMake(26.10612083, 109.74655151);
    hdVillage.title = @"文章标题";
    ytbTown.accessibilityValue=@"00000005";
    [annotations insertObject:hdVillage atIndex:4];
}

-(void) modeAction
{
    [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
}

- (void)BtnCloseClick
{
   if (self.delegate && [self.delegate respondsToSelector:@selector(closeButtonClicked)])
   {
      [self.delegate closeButtonClicked];
   }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
        }
        
        annotationView.canShowCallout               = YES;
        annotationView.animatesDrop                 = YES;
        annotationView.draggable                    = YES;
        annotationView.rightCalloutAccessoryView    = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.pinColor                     = [annotations indexOfObject:annotation];
        annotationView.annotation = annotation;
        [annotationView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(annotationClick:)]];
        return annotationView;
    }
    
    return nil;
}

-(void)annotationClick:(UITapGestureRecognizer *)sender
{
    MAPinAnnotationView *annotationView = (MAPinAnnotationView *)sender.view;
    
    NSLog(@"======2:%@", annotationView.annotation);
    
    MAPointAnnotation *maPoint = (MAPointAnnotation *)annotationView.annotation;
    NSLog(@"======3:%@", maPoint.accessibilityValue);
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
