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
 
 Created by Jelle Vandebeeck on 2008.04.05.
 */

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
