//
//  WAVisitorSignDetailViewController.m
//  YonyouCRM
//
//  Created by donghelou on 15/12/1.
//  Copyright © 2015年 com.yonyou.yonyoucrm. All rights reserved.
//

#import "WAVisitorSignDetailViewController.h"
#import "MyCollectionCell.h"
#import "WAAnnotation.h"
#import "UILabel+VerticalAlign.h"
@interface WAVisitorSignDetailViewController ()
@property CGFloat windowWidth;
@property CGFloat windowHeight;
@end

@implementation WAVisitorSignDetailViewController
@synthesize windowHeight;
@synthesize windowWidth;

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = [ UIScreen mainScreen ].bounds;
     windowWidth = rect.size.width;
     windowHeight = rect.size.height;
    [_iVisitorSignDetailCollectioinView setBackgroundColor:[UIColor clearColor]];
    //注册Cell
    [_iVisitorSignDetailCollectioinView registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:@"MyCollectionCell"];
   // _iVisitorSignDetailCollectioinView.frame = CGRectMake(_iVisitorSignDetailCollectioinView.frame.origin.x_iVisitorSignDetailCollectioinView.frame.origin.y, windowWidth/3.0, windowHeight/3.0);
    [self setAnnotation];
    [self setLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MyCollectionCell";
    //MyCollectionCell * cell = (MyCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    UICollectionViewCell *cell
    = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSLog(@"indexpath：%ld",(long)indexPath.row);
    cell.backgroundColor = [UIColor clearColor];
    NSString *imageName = [NSString stringWithFormat:@"%d",indexPath.row+1];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    imageView.frame = CGRectMake(0, 0, (self.view.bounds.size.width-32)/3.0, (self.view.bounds.size.width-32)/3.0);
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 10;
    imageView.contentMode = UIViewContentModeScaleToFill;
    [cell addSubview:imageView];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.bounds.size.width-32)/3.0, (self.view.bounds.size.width-32)/3.0);
    //return CGSizeMake(96, 96);
}


#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark 添加大头针
-(void)setAnnotation{
    
    CLLocationDegrees latitude = 39.962552;
    CLLocationDegrees longitude = 116.356121;
    CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude, longitude);
    //调整地图位置和缩放比例,第一个参数是目标区域的中心点，第二个参数：目标区域南北的跨度，第三个参数：目标区域的东西跨度，单位都是米
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 1000,1000 );
    
    //重新设置地图视图的显示区域
    [_iVisitorSignDetailMapView setRegion:viewRegion animated:YES];
    WAAnnotation *annotation=[[WAAnnotation alloc]init];
    annotation.coordinate = location;
    annotation.image=[UIImage imageNamed:@"map_location"];
    [_iVisitorSignDetailMapView addAnnotation:annotation];
}

#pragma mark - 地图控件代理方法
#pragma mark 显示大头针时调用，注意方法中的annotation参数是即将显示的大头针对象
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[WAAnnotation class]]) {
        static NSString *pointReuseIndentifier=@"pointReuseIndentifier";
        MKAnnotationView *annotationView=[_iVisitorSignDetailMapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        //如果缓存池中不存在则新建
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
            annotationView.canShowCallout = true;//允许交互点击
            annotationView.calloutOffset= CGPointMake(0, 1);//定义详情视图偏移量
            annotationView.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"map_location"]];//定义详情左侧视图
        }
        
        //修改大头针视图
        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        annotationView.annotation=  annotation;
        annotationView.image=((WAAnnotation *)annotation).image;
        
        return annotationView;
    }else {
        return nil;
    }
}
-(void)setLabel
{
    _iVisitorSignDetailTextLabel.numberOfLines = 2;
    _iVisitorSignDetailTextLabel.backgroundColor = [UIColor whiteColor];
    _iVisitorSignDetailTextLabel.lineBreakMode =NSLineBreakByWordWrapping;
    [_iVisitorSignDetailTextLabel setFont:[UIFont systemFontOfSize:12.5695]];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"大王叫我来巡山，训了南山巡北山喽~"];
    
    //设置缩进、行距
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    //行距
    style.lineSpacing = 5;
    [text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    _iVisitorSignDetailTextLabel.attributedText = text;

    //文字上对齐
    [_iVisitorSignDetailTextLabel alignTop];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
