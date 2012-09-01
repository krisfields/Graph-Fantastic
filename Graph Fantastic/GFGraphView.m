//
//  GFGraphView.m
//  Graph Fantastic
//
//  Created by Kris Fields on 8/31/12.
//  Copyright (c) 2012 Kris Fields. All rights reserved.
//

#import "GFGraphView.h"

@implementation GFGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, self.bounds.origin.x, 0);
    CGContextAddLineToPoint(context, self.bounds.origin.x + self.bounds.size.width, 0);
    CGContextSetLineWidth(context, 10);
    [[UIColor grayColor] set];
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 0, self.bounds.origin.y);
    CGContextAddLineToPoint(context, 0, self.bounds.origin.y + self.bounds.size.height);
    CGContextStrokePath(context);
//    CGContextMoveToPoint(context, )
//    for (int i = self.bounds.origin.x; i self.bounds.origin.x + self.bounds.size.width; i += 5 ) {
//
//    }
    [self drawPoints];
}

-(void)drawPoints {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    [[UIColor orangeColor] set];
    CGContextMoveToPoint(context, self.bounds.origin.x, self.graphBlock(-self.bounds.origin.x));
    for (int i = self.bounds.origin.x; i <= self.bounds.origin.x + self.bounds.size.width; i += 5 ) {
        double graphX = i * self.scale;
        double graphY = self.graphBlock(graphX);
        
        double pointsY = (-1 * graphY) / self.scale;
        
        NSLog(@"self.graphBlock is = %f", self.graphBlock(i));
//        NSLog(@"y is equal to = %f", y);
        CGContextAddLineToPoint(context, i, pointsY);
    }
    CGContextStrokePath(context);
//    CGContextSetLineWidth(context, 1);
//    [[UIColor grayColor] set];
//    for (int i = self.bounds.origin.x; i <= self.bounds.origin.x + self.bounds.size.width; i += 20 ) {
//      CGContextMoveToPoint(context, i, self.bounds.origin.y);
//        CGContextAddLineToPoint(context, i, self.bounds.origin.y + self.bounds.size.height);
//            CGContextStrokePath(context);
//    }
//    for (int i = self.bounds.origin.y; i <= self.bounds.origin.y + self.bounds.size.height; i += 20 ) {
//        CGContextMoveToPoint(context, self.bounds.origin.x, i);
//        CGContextAddLineToPoint(context, self.bounds.origin.x + self.bounds.size.width, i);
//        CGContextStrokePath(context);
//    }
}


@end
