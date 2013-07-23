//
//  HypnoView.m
//  hypno
//
//  Created by Jonathan Arp on 7/22/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "HypnoView.h"

@implementation HypnoView

-(void) drawRect:(CGRect)dirtyRect{
    CGRect bounds = [self bounds];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float  maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path addArcWithCenter:center radius:maxRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    
    [[UIColor grayColor] set];
    [path stroke];
}

@end
