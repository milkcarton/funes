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