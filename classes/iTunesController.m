//
//  iTunesController.m
//  Funes
//
//  Created by Jelle Vandebeeck on 05/04/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "iTunesController.h"

@implementation iTunesController

- (id)init
{
	self = [super init];
	iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
	return self;
}

- (int)status
{
	if ([iTunes isRunning]) {
		if ([iTunes playerState] == iTunesEPlSStopped) return 1;
		return 2;
	} else return 0;
}

- (BOOL)isPlaying
{
	if ([self status] == 2) return YES;
	return NO;
}

- (NSString *)song
{
	if ([self status] == 2) return [[iTunes currentTrack] name];
	return @"";
}

- (int)rating
{
	if ([self status] == 2) return [[iTunes currentTrack] rating];
	return 0;
}

- (void)setRating:(int)rating
{
	if ([self status] == 2) [[iTunes currentTrack] setRating:rating];
}

@end
