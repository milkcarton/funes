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

#import "MainController.h"

@implementation MainController

- (void)awakeFromNib
{
	statusItem = [[CustomStatusItem alloc] initWithMenu:[menu autorelease]];
	iTunes = [[iTunesController alloc] init];
	strokedImage = [[NSImage alloc] initWithContentsOfFile:[[[NSBundle mainBundle]	autorelease] pathForResource:@"star" ofType:@"png"]];
	filledImage = [[NSImage alloc] initWithContentsOfFile:[[[NSBundle mainBundle] autorelease] pathForResource:@"starFill" ofType:@"png"]];
	starItem = [[NSMenuItem alloc] init];
	[starItem setView: customView];
	
	[[NSApplication sharedApplication] setDelegate: self];
	
	// Set highlight button off.
	[[star1 cell] setHighlightsBy:NSNoCellMask];
	[[star2 cell] setHighlightsBy:NSNoCellMask];
	[[star3 cell] setHighlightsBy:NSNoCellMask];
	[[star4 cell] setHighlightsBy:NSNoCellMask];
	[[star5 cell] setHighlightsBy:NSNoCellMask];
	
	[self setTitleAndRatingWithCheck:YES];
	
	// Add observer to iTunes.
	[[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(notified:) name:@"com.apple.iTunes.playerInfo" object:nil];
}

- (void)setTitleAndRatingWithCheck:(BOOL)check
{
	if (check && [iTunes isPlaying]) {
		[songLabel setTitle:[iTunes song]];
		[self rating:[iTunes rating]];
		if ([iTunes rating] <= 0) [statusItem toggleRated:1];
		else [statusItem toggleRated:2];
		if ([menu numberOfItems] <= 5) {
			[menu insertItem:starItem atIndex:2];
			[menu insertItem:[NSMenuItem separatorItem] atIndex:3];
		}	
	} else {
		[songLabel setTitle:NSLocalizedString(@"NOT_PLAYING", nil)];
		[statusItem toggleRated:0];
		if ([menu numberOfItems] > 5) {
			[menu removeItem:starItem];
			[menu removeItemAtIndex:2];
		}
	}
}

- (void)notified:(NSNotification *)notification
{
	NSDictionary *userInfo = [notification userInfo];
	if ([(NSString *)[userInfo objectForKey:@"Player State"] compare:@"Stopped"] == NSOrderedSame) {
		[self setTitleAndRatingWithCheck:NO];
	} else [self setTitleAndRatingWithCheck:YES];
		
}

- (void)rating:(int)rating
{
	// set the different stars depending on their rating.
	switch (rating) {
		case 100:
			[star5 setImage:filledImage];
			[star4 setImage:filledImage];
			[star3 setImage:filledImage];
			[star2 setImage:filledImage];
			[star1 setImage:filledImage];
			break;
		case 80:
			[star5 setImage:strokedImage];
			[star4 setImage:filledImage];
			[star3 setImage:filledImage];
			[star2 setImage:filledImage];
			[star1 setImage:filledImage];
			break;
		case 60:
			[star5 setImage:strokedImage];
			[star4 setImage:strokedImage];
			[star3 setImage:filledImage];
			[star2 setImage:filledImage];
			[star1 setImage:filledImage];
			break;
		case 40:
			[star5 setImage:strokedImage];
			[star4 setImage:strokedImage];
			[star3 setImage:strokedImage];
			[star2 setImage:filledImage];
			[star1 setImage:filledImage];
			break;
		case 20:
			[star5 setImage:strokedImage];
			[star4 setImage:strokedImage];
			[star3 setImage:strokedImage];
			[star2 setImage:strokedImage];
			[star1 setImage:filledImage];
			break;
		default:
			[star5 setImage:strokedImage];
			[star4 setImage:strokedImage];
			[star3 setImage:strokedImage];
			[star2 setImage:strokedImage];
			[star1 setImage:strokedImage];
			break;
	}
}

- (IBAction)toggleStar:(id)sender
{	
	int rating = 0;
	if (sender == star1) {
		if ([sender image] == strokedImage || [star2 image] == filledImage) rating = 20;
		else rating = 0;
	} else if (sender == star2) rating = 40;
	else if (sender == star3) rating = 60;
	else if (sender == star4) rating = 80;
	else if (sender == star5) rating = 100;
	[iTunes setRating:rating];
	[self rating:rating];
	
	// Close the menu.
	[menu cancelTracking];
}

- (void)dealloc
{
	[iTunes release];
	[statusItem release];
	[strokedImage release];
	[filledImage release];
	[starItem release];
	[super dealloc];
}

#pragma mark Delegates of NSApplication

- (NSApplicationTerminateReply) applicationShouldTerminate:(NSApplication *)sender {
    [statusItem release];
    return NSTerminateNow;
}

@end
