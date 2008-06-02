//
//  iTunesController.h
//  Funes
//
//  Created by Jelle Vandebeeck on 05/04/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "iTunes.h"

@interface iTunesController : NSObject {
	@private iTunesApplication *iTunes;		// This is the itunes app object.
}

- (int)status;						// Returns an integer that indicates the iTunes status.
- (BOOL)isPlaying;					// Return true when iTunes is playing.
- (NSString *)song;					// Get the current itunes status.
- (int)rating;						// Get the rating from the current song.
- (void)setRating:(int)rating;		// Set the rating.

@end
