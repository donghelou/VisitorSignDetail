//
//  ViewController.m
//  MapDemoTest
//
//  Created by donghelou on 15/12/3.
//  Copyright © 2015年 donghelou. All rights reserved.
//

#import "ViewController.h"
#import "WAVisitorSignDetailViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPress:(id)sender {
    WAVisitorSignDetailViewController *visitorSignDetail = [[WAVisitorSignDetailViewController alloc] initWithNibName:@"WAVisitorSignDetailViewController"bundle:[NSBundle mainBundle]];
    
    [visitorSignDetail setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
     [self presentViewController:visitorSignDetail animated:YES completion:nil];

    //[self dismissViewControllerAnimated:YES completion:nil];
    }
@end
