//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}


- (NSString *) userName{
    NSString *name= [(NSDictionary *)[self.data valueOrNilForKeyPath:@"user"] objectForKey:@"name"];
    return name;
    
}

- (NSString *) userProfilePicUrl{
    NSString *profileUrl = [(NSDictionary *)[self.data valueOrNilForKeyPath:@"user"] objectForKey:@"profile_image_url"];
    return profileUrl;
    
}


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
