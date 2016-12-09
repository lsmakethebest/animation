

//
//  RootVCViewController.m
//  动画
//
//  Created by 刘松 on 16/12/9.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "RootVCViewController.h"
#import "LSLoadingCircle.h"

@interface RootVCViewController ()

@end

@implementation RootVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
