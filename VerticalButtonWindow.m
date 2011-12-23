//
//  VerticalButtonWindow.m
//  VerticalButtonWindow
//
//  Created by Keefo on 11-02-27.
//  Copyright 2011 Beyondcow. All rights reserved.
//

#import "VerticalButtonWindow.h"


@implementation VerticalButtonWindow

- (void)resetWindowButton
{
	NSButton *button;
	
	button=[self standardWindowButton:NSWindowMiniaturizeButton];
	NSRect r=[button frame];
	r.origin.x=8;
	r.origin.y-=18;
	[button setFrame:r];
	
	button=[self standardWindowButton:NSWindowZoomButton];
	r=[button frame];
	r.origin.x=8;
	r.origin.y-=2*18;
	[button setFrame:r];
}

- (void)awakeFromNib
{
	[self resetWindowButton];
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(windowDidResize:) 
												 name:NSWindowDidResizeNotification 
											   object:self];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
    [super dealloc];
}

- (void)windowDidResize:(NSNotification *)aNotification
{
    [self resetWindowButton];
}


@end
