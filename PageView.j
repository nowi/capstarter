//
//  PageView.j
//  
//
//  Created by Philipp Nowakowski on 3/16/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

@import <Foundation/CPObject.j>

@import <AppKit/CPView.j>

@import "PaneLayer.j"

@implementation PageView : CPView
{
	CALayer _rootLayer;
	CALayer     _borderLayer;
	PaneLayer   _paneLayer;
}


-(id)initWithFrame:(CGFrame)aFrame {
	self = [super initWithFrame:aFrame];
	
	if(self) {
		_rootLayer = [CALayer layer];
		
		[self setWantsLayer:YES];
		[self setLayer:_rootLayer];
		
		[_rootLayer setBackgroundColor:[CPColor whiteColor]];
		
		
        _paneLayer = [[PaneLayer alloc] 
					  initWithPageView:self];
		
		[_paneLayer setBounds:CGRectMake(0, 0, 
										 400 - 2 * 40, 400. - 2 * 40)];
        [_paneLayer setAnchorPoint:CGPointMakeZero()];
        [_paneLayer setPosition:CGPointMake(40, 40)];
		
		
		[_paneLayer setImage:[[CPImage alloc]
							  initWithContentsOfFile:  
							  @"Resources/test.png" 
							  size:CGSizeMake(500, 430)]];
        
        [_rootLayer addSublayer:_paneLayer];
		
		
		_borderLayer = [CALayer layer];
		
		[_borderLayer setAnchorPoint:CGPointMakeZero()];
		[_borderLayer setBounds:[self bounds]];
		[_borderLayer setDelegate:self];
		
		[_rootLayer addSublayer:_borderLayer];
		
		[_paneLayer setNeedsDisplay];
		
		
		
		
		[_rootLayer setNeedsDisplay];
		
	}
	
	
	return self;
	
	
}


- (void)drawLayer:(CALayer)aLayer inContext:(CGContext)aContext
{
    CGContextSetFillColor(aContext, [CPColor whiteColor]);

    var bounds = [aLayer bounds],
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);

    CGContextFillRect(aContext, CGRectMake(0, 0, width, 40));
    CGContextFillRect(aContext, CGRectMake(0, 40, 
        40, height - 2 * 40));
    CGContextFillRect(aContext, CGRectMake(width - 40, 40, 
        40, height - 2 * 40));
    CGContextFillRect(aContext, CGRectMake(0, height - 40, 
        width, 40));
}


- (void)setEditing:(BOOL)isEditing
{
    [_borderLayer setOpacity:isEditing ? 0.5 : 1.0];
}


- (void)mouseDown:(CPEvent)anEvent
{
    if ([anEvent clickCount] == 2)
        [PhotoInspector inspectPaneLayer:_paneLayer];
}


@end

