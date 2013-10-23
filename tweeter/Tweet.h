//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong, readonly) NSString *userProfilePicUrl;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSNumber *tweetId;


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
