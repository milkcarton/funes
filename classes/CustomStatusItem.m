/*
 Copyright (c) 2008 Jelle Vandebeeck
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 Created by Jelle Vandebeeck on 2008.04.04.
 */

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
