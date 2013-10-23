//
//  TweetVC.h
//  tweeter
//
//  Created by bgbb on 10/22/13.
//  Copyright (c) 2013 greensprout. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetVC : UIViewController

@property (weak, nonatomic) Tweet *tweet;

- (id)initWithTweet:(Tweet *)tweet;

@end
