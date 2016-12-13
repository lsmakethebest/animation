//
//  ViewController.m
//  动画
//
//  Created by 刘松 on 16/12/8.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "ViewController.h"
#import "LSWaveView.h"



@interface ViewController ()

@property (nonatomic,weak) LSWaveView *wave;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    LSWaveView *wave=[[LSWaveView alloc]initWithFrame:CGRectMake(10, 100, 355, 100)];
    wave.backgroundColor=[UIColor redColor];
    self.wave=wave;
    wave.waveSpeed=2;
    [self.view insertSubview:wave belowSubview:self.imageView];
    __weak typeof(self) weakSelf=self;
    wave.block=^(CGFloat y){
        CGRect frame=weakSelf.imageView.frame;
        frame.origin.y=weakSelf.wave.frame.origin.y+y-50;
        weakSelf.imageView.frame=frame;
        
    };
    [wave startWaveAnimation];

  
    
}



@end
