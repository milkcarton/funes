//
//  MainController.h
//  Funes
//
//  Created by Jelle Vandebeeck on 04/04/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

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
