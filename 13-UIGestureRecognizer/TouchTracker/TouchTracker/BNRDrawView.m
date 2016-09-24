//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by 焦相如 on 5/9/16.
//  Copyright © 2016 jaxer. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView ()

//@property (nonatomic, strong) BNRLine *currentLine; /**< 正在画的线 */
@property (nonatomic, strong) NSMutableDictionary *linesInprogress;
@property (nonatomic, strong) NSMutableArray *finishedLines; /**< 画完的线 */

@end

@implementation BNRDrawView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.linesInprogress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES; //多点触摸
    }
    
    return self;
}

- (void)strokeLine:(BNRLine *)line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin]; //起点
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void)drawRect:(CGRect)rect {
    // 用黑色绘制已经完成的线条
    [[UIColor blackColor] set];
    for (BNRLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
//    if (self.currentLine) {
//        // 用红色绘制正在画的线条
//        [[UIColor redColor] set];
//        [self strokeLine:self.currentLine];
//    }
    
    // 向控制台输出日志，查看触摸事件发生顺序(即用到该方法时打印该方法名)
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInprogress) {
        [self strokeLine:self.linesInprogress[key]];
    }
}

/** 触摸开始事件 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *t = [touches anyObject];
//    // 根据触摸位置创建 BNRLine 对象
//    CGPoint location = [t locationInView:self]; //触摸在 view 上的位置
//
//    self.currentLine = [[BNRLine alloc] init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
//    
//    [self setNeedsDisplay];
    
    
    // 向控制台输出日志，查看触摸事件发生顺序
    NSLog(@"%@", NSStringFromSelector(_cmd));
   
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        
        //将 UITouch 对象的内存地址封装为 NSValue 对象，作为 BNRLine 对象的键
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInprogress[key] = line;
    }
    
    [self setNeedsDisplay];
}

/** 触摸移动事件 */
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//
//    self.currentLine.end = location;
//    
//    [self setNeedsDisplay];
    
    // 向控制台输出日志，查看触摸事件发生顺序
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInprogress[key];
        
        line.end = [t locationInView:self];
    }
  
    [self setNeedsDisplay];
}

/** 触摸结束事件 */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.finishedLines addObject:self.currentLine];
//    self.currentLine = nil;
//    [self setNeedsDisplay];
    
    // 向控制台输出日志，查看触摸事件发生顺序
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInprogress[key];
        
        [self.finishedLines addObject:line];
        [self.linesInprogress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

/** 触摸取消事件 */
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 向控制台输出日志，查看触摸事件发生顺序
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInprogress removeObjectForKey:key];
    }
}

@end
