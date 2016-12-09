//
//  LSWaveView.h
//  动画
//
//  Created by 刘松 on 16/12/9.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^LSWaveViewBlock)(CGFloat y);



@interface LSWaveView : UIView

//浪高
@property (nonatomic,assign) CGFloat waveHeight;

//浪速 值越大速度越快
@property (nonatomic,assign) CGFloat waveSpeed;

//浪弯度 值越大弯度越小
@property (nonatomic,assign) CGFloat waveCurvature;

//真实波浪颜色
@property(nonatomic,strong) UIColor * realWaveColor;

//遮罩波浪颜色
@property(nonatomic,strong) UIColor * maskWaveColor;

//开始动画
- (void)stopWaveAnimation;

//结束动画
- (void)startWaveAnimation;

//回传的y值为中间点距离view最上面的y值

@property (nonatomic,copy) LSWaveViewBlock block;


@end
