//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Jonathan Arp on 7/25/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView(){
    //BNRLine *_currentLine;
    NSMutableDictionary *_linesInProgress;
    NSMutableArray *_finishedLines;
}

@property (nonatomic, weak) BNRLine *selectedLine;
-(BNRLine *) lineAtPoint:(CGPoint)p;

@end
@implementation BNRDrawView

-(id)initWithFrame:(CGRect) r {
    self = [super initWithFrame:r];
    
    if(self){
        _linesInProgress = [[NSMutableDictionary alloc] init];
        _finishedLines = [[NSMutableArray alloc] init];
        [self setBackgroundColor:[UIColor grayColor]];
        [self setMultipleTouchEnabled:YES];
        
        //double tap
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc ] initWithTarget:self action:@selector(doubleTap:)];
        [doubleTapRecognizer setNumberOfTapsRequired:2];
        [doubleTapRecognizer setDelaysTouchesBegan:YES];
        [self addGestureRecognizer:doubleTapRecognizer];
        
        //single tap
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [tapRecognizer setNumberOfTapsRequired:1];
        [tapRecognizer setDelaysTouchesBegan:YES];
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        [self addGestureRecognizer:tapRecognizer];
        
        
        //long press
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:longPressGesture];
    }
    
    return self;
}

-(void) tap:(UIGestureRecognizer *)gr{
    NSLog(@"Tap :-(");
    CGPoint point = [gr locationInView:self];
    [self setSelectedLine:[self lineAtPoint:point]];
    
    if([self selectedLine]){
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        [menu setMenuItems:@[deleteItem]];
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];

    }
    
    else{
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
        
    }
    
            [self setNeedsDisplay];
}


-(void) doubleTap:(UIGestureRecognizer *)gr{
    NSLog(@"Double Tap!!!!");
    [_linesInProgress removeAllObjects];
    [_finishedLines removeAllObjects];
    [self setNeedsDisplay];
}

-(void) longPress:(UIGestureRecognizer *)gr{
    NSLog(@"Loooooooooong preeeeess");
    
    if([gr state] == UIGestureRecognizerStateBegan ){
        CGPoint point = [gr locationInView:self];
        [self setSelectedLine: [self lineAtPoint:point  ]];
        
        if( [self selectedLine]){
            [_linesInProgress removeAllObjects];
        }
        
        else if([gr state] == UIGestureRecognizerStateEnded){
            [self setSelectedLine:nil];
        }
        [self setNeedsDisplay];
    }
}


-(BNRLine * )lineAtPoint:(CGPoint)p{
    for(BNRLine *l in _finishedLines ){
        CGPoint start = [l begin];
        CGPoint end = [l end];
        
        for (float t = 0.0; t <= 1.0; t +=.05){
            
            float x = start.x + t * (end.x - start.x);
            float y = start.y + + t * (end.y - start.y);
            
            if(hypot(x - p.x, y - p.y) < 20.0){
                NSLog(@"line found!");
                return l;
            }
        }
    }
               NSLog(@"line NOT found!");
    return nil;
}

-(void)drawRect:(CGRect)rect{
    void (^strokeLine)(BNRLine *) = ^(BNRLine *line){
        UIBezierPath *bp = [UIBezierPath bezierPath];
        [bp moveToPoint:[line begin]];
        [bp addLineToPoint:[line end]];
        [bp setLineWidth: 10];
        [bp setLineCapStyle:kCGLineCapRound];
        
        [bp stroke];
    };
    
    [[UIColor blackColor] set];
    for(BNRLine *line in _finishedLines){
        strokeLine(line);
    }
    
    
    for( NSValue *key in _linesInProgress){
        strokeLine([_linesInProgress objectForKey:key]);
    }
    
    if([self selectedLine]){
        [[UIColor greenColor] set];
        strokeLine([self selectedLine]);
    }
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for(UITouch *t in touches){
        CGPoint location = [t locationInView:self];
        BNRLine *line = [[BNRLine alloc] init] ;
        [line setBegin:location];
        [line setEnd:location];
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [_linesInProgress setObject:line forKey:key];
    }
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = [_linesInProgress objectForKey:key];
        [line setEnd:[t locationInView:self]];
    }
    
    /*
    UITouch *t = [touches anyObject];
    CGPoint location = [t locationInView:self];
    [_currentLine setEnd:location];
     */
    [self setNeedsDisplay];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = [_linesInProgress objectForKey:key];
        [_finishedLines addObject:line];
        [_linesInProgress removeObjectForKey:key];
    }
    
    
   
    [self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
     for(UITouch *t in touches){
         NSValue *key = [NSValue valueWithNonretainedObject:t];
         [_linesInProgress removeObjectForKey:key];
     }
    
    [self setNeedsDisplay];
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}


-(void) deleteLine:(id)sender{
    [_finishedLines removeObject:[self selectedLine]];
    [self setNeedsDisplay];
}
@end
