//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

//@property (nonatomic, strong) NSString *text;
//@property (nonatomic, strong) NSString *userName;
//@property (nonatomic, strong, readonly) NSString *userProfilePicUrl;
//@property (nonatomic, strong) NSString *screenName;
//@property (nonatomic, strong) NSString *createdAt;
//@property (nonatomic, strong) NSString *tweetId;

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}



- (NSString *) userName{
    NSString *name= [(NSDictionary *)[self.data valueOrNilForKeyPath:@"user"] objectForKey:@"name"];
    return name;
    
}

- (NSString *) screenName{
    NSString *name= [(NSDictionary *)[self.data valueOrNilForKeyPath:@"user"] objectForKey:@"screen_name"];
    return name;
    
}

- (NSString *) userProfilePicUrl{
    NSString *profileUrl = [(NSDictionary *)[self.data valueOrNilForKeyPath:@"user"] objectForKey:@"profile_image_url"];
    return profileUrl;
}

- (NSDate *) createdAt{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *createdAt = [dateFormatter dateFromString:(NSString *)[self.data valueOrNilForKeyPath:@"created_at"]];
    return createdAt;
}

- (NSNumber *) tweetId{
    NSNumber *tweetId = [self.data valueOrNilForKeyPath:@"id"];
    return tweetId;
}


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
