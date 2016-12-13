//
//  LSGraintCircleView.m
//  ceshi1
//
//  Created by 刘松 on 16/12/13.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "LSGraintCircleView.h"

@implementation LSGraintCircleView



-(instancetype)initGraintCircleWithFrame:(CGRect)frame colors:(NSArray *)colors lineWidth:(CGFloat)linewidth
{
    self=[super initWithFrame:frame];
        
    // 创建曲线,绘制圆形path
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2) radius:(self.bounds.size.width-linewidth*2)/2 startAngle:M_PI endAngle:-M_PI clockwise:NO];
    // 创建shapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;// 设置图层大小
    shapeLayer.path = circlePath.CGPath;// 设置shapeLayer的cgPath
    shapeLayer.opacity = 1.0f;  //设置透明度0~1之间
    shapeLayer.lineCap = kCALineCapRound;//制定线的边缘是圆形
    shapeLayer.lineWidth = linewidth; // 设置线宽
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;// 设置线条颜色
    shapeLayer.fillColor = [UIColor clearColor].CGColor;// 设置线条颜色
    
    CAGradientLayer *layer=(CAGradientLayer*)self.layer;
    layer.colors = colors;//颜色数组
    layer.mask = shapeLayer;//设置mask图层
    
        //开始和结束点可以用来做隐式动画
    layer.startPoint = CGPointMake(0, 0);//开始点
    layer.endPoint = CGPointMake(1, 0);//结束点

    return self;
}



+(Class)layerClass
{
    return [CAGradientLayer class];
}
@end
