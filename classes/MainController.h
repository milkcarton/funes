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

#import <Cocoa/Cocoa.h>
#import "CustomStatusItem.h"
#import "iTunesController.h"

@interface MainController : NSObject {
	IBOutlet id menu;				// This is the status menu.
	IBOutlet id songLabel;			// This is the item in the menu that displays the song.
	IBOutlet id customView;			// This is the view that contains the rating stars.
	IBOutlet id star1;				// This is the star with rating 20.
	IBOutlet id star2;				// This is the star with rating 40.
	IBOutlet id star3;				// This is the star with rating 60.
	IBOutlet id star4;				// This is the star with rating 80.
	IBOutlet id star5;				// This is the star with rating 100.
	NSMenuItem *starItem;			// This is the menu item that should contain the stars.
	NSImage *strokedImage;			// This is the strokes image.
	NSImage *filledImage;			// This is the filled image.
	CustomStatusItem *statusItem;	// This is the status item.
	iTunesController *iTunes;		// This is the interaction controller with iTunes.
}

- (void)rating:(int)rating;							// Fills the starts depending on the rating.
- (IBAction)toggleStar:(id)sender;					// Set the rating when star1 is selected.
- (void)setTitleAndRatingWithCheck:(BOOL)check;		// Sets the title and rating, or when no song is playing then the rating bar is removed.
- (void)notified:(NSNotification *)notification;	// Called when the observer notifies a change.

@end
