//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by 焦相如 on 4/3/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置 BNRHypnosisView 对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 阴影效果
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 20), 2);
    // 这里有阴影效果
    
    CGContextRestoreGState(currentContext);
    // 这里无阴影效果
    
    // 渐变效果
    CGFloat location[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0, //起始颜色为红色
                            1.0, 1.0, 0.0, 1.0}; //终止颜色为黄色
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, location, 2);
    CGPoint startPoint;
    startPoint.x = center.x - 100;
    startPoint.y = center.y - 100;
    CGPoint endPoint;
    endPoint.x = center.x + 100;
    endPoint.y = center.y + 100;
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    // CGGradientCreateWithColorComponents 函数的最后一个参数用来设置起始位置和终止位置之外的绘制区域的颜色填充方式。可用 kCGGradientDrawsBeforeStartLocation 或 kCGGradientDrawsAfterEndLocation, 或二者结合使用

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    
    
//    CGRect bounds = self.bounds;
    
    // 根据 bounds 计算中心点
//    CGPoint center;
//    center.x = bounds.origin.x + bounds.size.width / 2.0;
//    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 根据视图宽和高中的较小值计算圆形的半径
//    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // UIBezierPath 类用来绘制直线或曲线，从而绘制各种形状
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // 以中心为原点，radius 为半径，定义一个 0 到 M_PI * 2.0 弧度的路径（整圆）
//    [path addArcWithCenter:center
//                    radius:radius
//                startAngle:0.0
//                  endAngle:M_PI * 2.0
//                 clockwise:YES];
    
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)]; //抬起画笔
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // 设置线条宽度为 10 点
    path.lineWidth = 10;

    // 设置绘制颜色为浅灰色
    [[UIColor lightGrayColor] setStroke];
    [[UIColor orangeColor] setStroke];
    
    // 绘制路径
    [path stroke];
    
//    [path addClip];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo"];
    [logoImage drawInRect:rect];
    
//    NSString *str = @"Hello, world!";
//    [str drawAtPoint:center withAttributes:NULL];
}

//- (void)drawRect:(CGRect)rect {
//    CGRect bounds = self.bounds;
//    
//    CGPoint center;
//    center.x = bounds.origin.x + bounds.size.width / 2.0;
//    center.y = bounds.origin.y + bounds.size.height / 2.0;
//    
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor(currentContext, 1, 0, 0, 1);
//    
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, center.x, center.y);
//    CGPathAddLineToPoint(path, NULL, center.x + 100, center.y + 100);
//    CGContextAddPath(currentContext, path);
//    
//    CGContextStrokePath(currentContext);
//    CGPathRelease(path);
//    
////    CGContextSetStrokeColorWithColor(currentContext, [UIColor redColor]);
//}

@end
