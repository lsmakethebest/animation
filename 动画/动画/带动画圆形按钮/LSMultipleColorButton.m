




//
//  LSMultipleColorButton.m
//  动画
//
//  Created by 刘松 on 16/12/13.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "LSMultipleColorButton.h"

@implementation LSMultipleColorButton




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}
-(void)setup{
    
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"%s",__func__);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}


@end
