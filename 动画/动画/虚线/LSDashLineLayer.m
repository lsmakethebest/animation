



//
//  LSDashLineLayer.m
//  ceshi1
//
//  Created by 刘松 on 16/12/13.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "LSDashLineLayer.h"

@implementation LSDashLineLayer

-(instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength
{
   self= [super init];
    LSDashLineLayer *line = self;
    line.frame = frame;
    [line setFillColor:[UIColor clearColor].CGColor];
    [line setStrokeColor:color.CGColor];
    CGSize size=frame.size;
    CGFloat lineWidth=size.height;
    if (size.width<size.height) {
        lineWidth=size.width;
    }
    [line setLineWidth:lineWidth];
//    [line setLineJoin:kCALineJoinMiter];
    NSArray *arr = [NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength],[NSNumber numberWithInt:spaceLength], nil];
    [line setLineDashPattern:arr];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(line.frame.size.width, line.frame.size.height)];
    line.path = path.CGPath;
    return line;
}



@end
