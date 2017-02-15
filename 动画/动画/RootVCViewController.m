

//
//  RootVCViewController.m
//  动画
//
//  Created by 刘松 on 16/12/9.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "RootVCViewController.h"

#import "LSLoadingCircle.h"
#import "LSDashLineLayer.h"
#import "LSGraintCircleLayer.h"
#import "LSMultipleColorButton.h"


@interface RootVCViewController ()

@end

@implementation RootVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    LSDashLineLayer *dashLine=[[LSDashLineLayer alloc]initWithFrame:CGRectMake(30, 300, 1, 111) color:[UIColor redColor]  lineLength:5 spaceLength:5];
    [self.view.layer addSublayer:dashLine];
    
    
    
    LSDashLineLayer *dashLine1=[[LSDashLineLayer alloc]initWithFrame:CGRectMake(60, 400, 100, 1) color:[UIColor redColor]  lineLength:5 spaceLength:5];
    [self.view.layer addSublayer:dashLine1];
    
    [self.view.layer addSublayer:  [[LSGraintCircleLayer alloc]initGraintCircleWithFrame:CGRectMake(130, 230, 100, 100)  FromColor:[UIColor redColor] ToColor:[UIColor blueColor] LineWidth:3]];


    LSMultipleColorButton *view=[[LSMultipleColorButton alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    view.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:view];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(id)sender {
    
    [LSLoadingCircle show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LSLoadingCircle hide];
    });
    
    
    
}






@end
