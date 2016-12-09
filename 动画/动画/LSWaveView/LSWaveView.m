



//
//  LSWaveView.m
//  动画
//
//  Created by 刘松 on 16/12/9.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "LSWaveView.h"



@interface LSProxy :NSObject
@property (nonatomic,weak) id target;

@end

@implementation LSProxy

-(void)callback
{
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    [_target performSelector:@selector(updateWave)];
    
#pragma clang diagnostic pop
    
    
}

@end

@interface LSWaveView ()


@property (nonatomic,strong) CAShapeLayer *realLayer;
@property (nonatomic,strong) CAShapeLayer *maskLayer;

//便宜才能使波浪动起来
@property (nonatomic,assign) CGFloat offset;
@property(nonatomic,strong) CADisplayLink *timer;

@end


@implementation LSWaveView


-(instancetype)init
{
    if (self=[super init]) {
        [self initLayers];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    [self initLayers];
    }
    return self;
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    [self initLayers];
    
}

-(void)initLayers
{
    
    self.waveSpeed=5;
    self.waveHeight=14;
    self.waveCurvature=1.5;
    self.maskWaveColor=[[UIColor whiteColor]colorWithAlphaComponent:0.4];
    self.realWaveColor=[UIColor whiteColor];
    [self.layer addSublayer:self.maskLayer];
    [self.layer addSublayer:self.realLayer];

}
-(void)setMaskWaveColor:(UIColor *)maskWaveColor
{
    _maskWaveColor=maskWaveColor;
    self.maskLayer.fillColor=maskWaveColor.CGColor;
}
-(void)setRealWaveColor:(UIColor *)realWaveColor
{
    _realWaveColor=realWaveColor;
    self.realLayer.fillColor=realWaveColor.CGColor;
}

-(CAShapeLayer *)realLayer
{
    if (_realLayer==nil) {
        _realLayer=[[CAShapeLayer alloc]init];
        CGRect frame=[self bounds];
        frame.origin.y=frame.size.height-self.waveHeight;
        frame.size.height=self.waveHeight;
        _realLayer.fillColor=self.realWaveColor.CGColor;
        _realLayer.frame=frame;
        
    }
    return _realLayer;
}


-(CAShapeLayer *)maskLayer
{
    if (_maskLayer==nil) {
        _maskLayer=[[CAShapeLayer alloc]init];
        CGRect frame=[self bounds];
        frame.origin.y=frame.size.height-self.waveHeight;
        frame.size.height=self.waveHeight;
        _maskLayer.fillColor=self.maskWaveColor.CGColor;
        _maskLayer.frame=frame;
    }
    return _maskLayer;
}



-(void)startWaveAnimation
{
    [self.timer invalidate];
    LSProxy *proxy=[[LSProxy alloc]init];
    proxy.target=self;
    self.timer = [CADisplayLink displayLinkWithTarget:proxy
                                                   selector:@selector(callback)];
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop]
                       forMode:NSRunLoopCommonModes];
    
    
}
-(void)stopWaveAnimation
{
    [self.timer invalidate];
    self.timer=nil;
}

- (void)updateWave
{
    self.offset += self.waveSpeed;//逐渐累加初相
    CGFloat height = self.waveHeight;
    
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    [wavePath moveToPoint:CGPointMake(0, height)];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    [maskPath moveToPoint:CGPointMake(0, height)];
    
    CGFloat width = CGRectGetWidth(self.frame);
    
    for (CGFloat x = 0; x <=width ; x ++) {
        CGFloat  y = height * sinf(0.01 * self.waveCurvature * x+self.offset*0.04);
        [wavePath addLineToPoint:CGPointMake(x,y)];
        [maskPath addLineToPoint:CGPointMake(x, -y)];
    }
    //变化的中间Y值
    CGFloat centerX = self.bounds.size.width/2;
    CGFloat CenterY = height * sinf(0.01 * self.waveCurvature * centerX+self.offset*0.04);
    if (self.block) {
        self.block(self.bounds.size.height-self.waveHeight+CenterY);
    }

    
    [wavePath addLineToPoint:CGPointMake(width, self.waveHeight)];
    [wavePath addLineToPoint:CGPointMake(0, self.waveHeight)];

    
    [maskPath addLineToPoint:CGPointMake(width, self.waveHeight)];
    [maskPath addLineToPoint:CGPointMake(0, self.waveHeight)];
    
    self.realLayer.path=wavePath.CGPath;
    self.maskLayer.path=maskPath.CGPath;
    
}

-(void)dealloc
{
    
}
@end
