//
//  WAVisitorSignDetailViewController.h
//  YonyouCRM
//
//  Created by donghelou on 15/12/1.
//  Copyright © 2015年 com.yonyou.yonyoucrm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WAVisitorSignDetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UINavigationBarDelegate,MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationBar *iNavBar;
@property (weak, nonatomic) IBOutlet MKMapView *iVisitorSignDetailMapView;
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *iVisitorSignDetailTextLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *iVisitorSignDetailCollectioinView;

@end
