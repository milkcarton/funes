//
//  CustomStatusItem.m
//  Funes
//
//  Created by Jelle Vandebeeck on 04/04/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "CustomStatusItem.h"

@implementation CustomStatusItem

- (id)initWithMenu:(id)menu
{
	self = [super init];
	NSBundle *bundle = [NSBundle mainBundle];
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:27.0] retain];
	
	// Allocates all the icons.
	onIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"on" ofType:@"png"]];
	onAltIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"onAlt" ofType:@"png"]];
	offIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"off" ofType:@"png"]];
	offAltIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"offAlt" ofType:@"png"]];
	ratingIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"rating" ofType:@"png"]];
	ratingAltIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ratingAlt" ofType:@"png"]];
	
	[statusItem setMenu:menu];
	[statusItem setHighlightMode:YES];
	return self;
}

- (void)toggleRated:(int)status
{
	switch (status) {
		case 0: [statusItem setImage:offIcon];
				[statusItem setAlternateImage:offAltIcon];
				break;
		case 1: [statusItem setImage:onIcon];
				[statusItem setAlternateImage:onAltIcon];
				break;
		case 2:	[statusItem setImage:ratingIcon];
				[statusItem setAlternateImage:ratingAltIcon];
				break;
		default: break;
	}
}

- (void)dealloc
{
	[[NSStatusBar systemStatusBar] removeStatusItem:statusItem];
	[statusItem release];
	[onIcon release];
	[onAltIcon release];
	[offIcon release];
	[offAltIcon release];
	[ratingIcon release];
	[ratingAltIcon release];
	[super dealloc];
}

@end
