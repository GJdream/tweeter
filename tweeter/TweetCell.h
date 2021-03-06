//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell

@property (weak, nonatomic) Tweet *tweet;

//+ (CGFloat *)cellContentHeight;

-(float) sizeForCellWithText:(NSString *) text;

@end
