//
//  LSDashLineLayer.h
//  ceshi1
//
//  Created by 刘松 on 16/12/13.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSDashLineLayer : CAShapeLayer



/**
 虚线高度会自动判断width和height哪个大 来决定水平还是垂直虚线
 @param frame frame
 @param color 线的颜色
 @param lineLength 每个实线的长度
 @param spaceLength 相邻实现空白间隔
 @return self
 */

-(instancetype)initWithFrame:(CGRect)frame color:(UIColor*)color lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength;

@end
