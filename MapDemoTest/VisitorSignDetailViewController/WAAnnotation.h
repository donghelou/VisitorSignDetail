//
//  WAAnnotation.h
//  MapDemoTest
//
//  Created by donghelou on 15/12/5.
//  Copyright © 2015年 donghelou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface WAAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

#pragma mark 自定义一个图片属性在创建大头针视图时使用
@property (nonatomic,strong) UIImage *image;

@end
