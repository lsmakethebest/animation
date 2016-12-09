


//
//  LSLoadingCircle.m
//  动画
//
//  Created by 刘松 on 16/12/9.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "LSLoadingCircle.h"

@interface LSLoadingCircleProxy :NSObject
@property (nonatomic,weak) id target;



@end

@implementation LSLoadingCircleProxy

-(void)callback
{
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    [_target performSelector:@selector(updateCircle)];
    
#pragma clang diagnostic pop
    
    
}

-(void)dealloc
{
    
    
}
@end


@interface LSLoadingCircle ()


@property (nonatomic,weak) CAShapeLayer *loadingLayer;

@property(nonatomic,strong) CADisplayLink *timer;
@property (nonatomic,assign) CGFloat lineWidth;

@end
@implementation LSLoadingCircle


- (void)drawHalfCircle {
    self.lineWidth=2;
    self.loadingLayer = [self drawCircle];
    
    // 这个是用于指定画笔的开始与结束点
    self.loadingLayer.strokeStart = 0;
    self.loadingLayer.strokeEnd = 0;
    
}

- (void)updateCircle {
    
    CGFloat margin=0.1f;
    CGFloat start=self.loadingLayer.strokeStart;
    CGFloat end=self.loadingLayer.strokeEnd;
    
    if (end >=1.000000&&start!=1.000000000000 ) {
        end=1;
        start += margin;
    } else if (start == 0) {
        end += margin;
    }else if (start==1.00000000){
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.loadingLayer.strokeStart=0;
        self.loadingLayer.strokeEnd=0;
        [CATransaction commit];
        start=0;
        end=margin;
    }
    if (start>=1.000000) {
        start= 0;
        end = 0;
    }
    
    if (start==0&&end==0) {
        
        self.loadingLayer.strokeStart=1;
        self.loadingLayer.strokeEnd=1;
    }else{
        self.loadingLayer.strokeStart=start;
        self.loadingLayer.strokeEnd=end;
    }
}



- (CAShapeLayer *)drawCircle {
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    // 指定frame，只是为了设置宽度和高度
    circleLayer.frame =self.bounds;
    // 设置居中显示
    circleLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    // 设置填充颜色
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    // 设置线宽
    circleLayer.lineWidth = self.lineWidth;
    // 设置线的颜色
    circleLayer.strokeColor = [UIColor redColor].CGColor;
    
    // 使用UIBezierPath创建路径
    CGSize size=self.bounds.size;
    CGRect frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    //    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:(size.width-2*self.lineWidth-5)/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    
    
    // 设置CAShapeLayer与UIBezierPath关联
    circleLayer.path = circlePath.CGPath;
    
    // 将CAShaperLayer放到某个层上显示
    [self.layer addSublayer:circleLayer];
    return circleLayer;
}
+(void)hide
{
    for (UIView *view in [[UIApplication sharedApplication].keyWindow subviews]) {
        if ([view isKindOfClass:self]) {
            [view removeFromSuperview];
        }
    }
}

+(void)show
{
    CGSize size= [UIScreen mainScreen].bounds.size;
    LSLoadingCircle *circle=[[LSLoadingCircle alloc]init];
    circle.layer.cornerRadius=5;
    circle.clipsToBounds=YES;
    circle.backgroundColor=[UIColor colorWithWhite:0.8 alpha:1];
    
    
    CGFloat width=100;
    CGFloat height=100;
    circle.frame=CGRectMake((size.width-width)/2, (size.height-height)/2,width,height);
    
    
    [circle drawHalfCircle];
    [[UIApplication sharedApplication].keyWindow addSubview:circle];
    [circle startAnimation];
}

-(void)startAnimation
{
    [self.timer invalidate];
    self.timer=nil;
    LSLoadingCircleProxy *proxy=[[LSLoadingCircleProxy alloc]init];
    proxy.target=self;
    CADisplayLink *timer=[CADisplayLink displayLinkWithTarget:proxy selector:@selector(callback)];
    timer.frameInterval=6;
    [timer addToRunLoop:[NSRunLoop currentRunLoop]
                forMode:NSRunLoopCommonModes];
    self.timer=timer;
}
-(void)dealloc
{
    
    
    
    
}
@end
