/* * AppController.j * NewApplication * * Created by You on February 22, 2011. * Copyright 2011, Your Company All rights reserved. */

@import <Foundation/CPObject.j>
@import "PhotoInspector.j"

@implementation AppController : CPObject { }

- (void)applicationDidFinishLaunching:(CPNotification)aNotification { 
	
	var theWindow = [[CPWindow alloc] 
					 initWithContentRect:CGRectMakeZero()
					 styleMask:CPBorderlessBridgeWindowMask],
	contentView = [theWindow contentView];
	
    [contentView setBackgroundColor:[CPColor blackColor]];
    
    [theWindow orderFront:self];
	
    var bounds = [contentView bounds],
	pageView = [[PageView alloc] initWithFrame:
				CGRectMake(CGRectGetWidth(bounds) / 2 
						   - 200, CGRectGetHeight(bounds) / 2 - 200, 
						   400, 400)];
	
    [pageView setAutoresizingMask:  CPViewMinXMargin | 
	 CPViewMaxXMargin | 
	 CPViewMinYMargin | 
	 CPViewMaxYMargin];
	
    [contentView addSubview:pageView];
    
    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    
    [label setTextColor:[CPColor whiteColor]];
    [label setStringValue:@"Double Click to Edit Photo"];
    
    [label sizeToFit];
    [label setFrameOrigin:CGPointMake(CGRectGetWidth(bounds) / 2 - 
									  CGRectGetWidth([label frame]) / 2, 
									  CGRectGetMinY([pageView frame]) -
									  CGRectGetHeight([label frame]))];
    [label setAutoresizingMask: CPViewMinXMargin | 
	 CPViewMaxXMargin | 
	 CPViewMinYMargin | 
	 CPViewMaxYMargin];
    
    [contentView addSubview:label];
}

@end
