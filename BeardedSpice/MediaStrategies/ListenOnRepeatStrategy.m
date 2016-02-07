//
//  ListenOnRepeatStrategy.m
//  BeardedSpice
//
//  Created by Jianneng Li on 2/7/16.
//  Copyright © 2016 BeardedSpice. All rights reserved.
//

#import "ListenOnRepeatStrategy.h"

@implementation ListenOnRepeatStrategy

- (id)init {
    self = [super init];
    if (self) {
        predicate =
        [NSPredicate predicateWithFormat:@"SELF LIKE[c] '*listenonrepeat.com/*'"];
    }
    return self;
}

- (BOOL)accepts:(TabAdapter *)tab {
    return [predicate evaluateWithObject:[tab URL]];
}

- (BOOL)isPlaying:(TabAdapter *)tab {
    NSNumber *value =
        [tab executeJavascript:@"(function(){return "
        @"document.querySelector('i.mdi-av-play-arrow') == null;})()"];
    return [value boolValue];
}

- (NSString *)toggle {
    return @"(function(){document.querySelector('div.control-play-pause').click()})()";
}

- (NSString *)previous {
    return @"(function(){document.querySelector('i.mdi-av-skip-previous').click()})()";
}

- (NSString *)next {
    return @"(function(){document.querySelector('i.mdi-av-skip-next').click()})()";
}

- (NSString *)pause {
    return @"(function(){document.querySelector('i.mdi-av-pause').click()})()";
}

- (NSString *)displayName {
    return @"ListenOnRepeat";
}

- (NSString *)favorite {
    return @"(function(){document.querySelector('div.control-heart').click()})()";
}

- (Track *)trackInfo:(TabAdapter *)tab {
    NSString *title =
        [tab executeJavascript:@"(function(){return "
        @"document.querySelector('div.video-title').innerText})()"];

    Track *track = [Track new];
    track.track = title;

    return track;
}

@end
