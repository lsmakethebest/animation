//
//  LSGraintCircleLayer.h
//  LSProgressHUDExample
//
//  Created by 刘松 on 16/9/13.
//  Copyright © 2016年 liusong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface LSGraintCircleLayer : CALayer
-(instancetype)initGraintCircleWithFrame:(CGRect)frame
                                FromColor:(UIColor *)fromColor
                                  ToColor:(UIColor *)toColor
                                LineWidth:(CGFloat) linewidth;


+(instancetype)layerWithFrame:(CGRect)frame
                         FromColor:(UIColor *)fromColor
                           ToColor:(UIColor *)toColor
                         LineWidth:(CGFloat) linewidth;
@end
