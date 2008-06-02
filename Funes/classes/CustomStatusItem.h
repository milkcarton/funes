//
//  CustomStatusItem.h
//  Funes
//
//  Created by Jelle Vandebeeck on 04/04/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomStatusItem : NSObject {
	@private NSStatusItem *statusItem;	// The status item.
	@private NSImage *onIcon;			// The status icon when itunes is on and no rating is set.
	@private NSImage *onAltIcon;			// The alternative status icon when itunes is on and no rating is set.
	@private NSImage *offIcon;			// The status icon when itunes is off.
	@private NSImage *offAltIcon;		// The alternative status icon when itunes is off.
	@private NSImage *ratingIcon;		// The status icon when itunes is on and a rating is selected.
	@private NSImage *ratingAltIcon;		// The alternative status icon when itunes is on and a rating is selected.
}

- (id)initWithMenu:(id)menu;		// Initializes the statusmenu.
- (void)toggleRated:(int)status;	// Set the icon with rating on or off.

@end