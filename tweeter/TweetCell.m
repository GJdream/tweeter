//
//  TweetCell.m
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface TweetCell(){
    CGFloat *cellHeight;
}

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;

@end

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(float) sizeForCellWithText:(NSString *) text {
    CGRect rect = [self rectForCellWithText:text];

    return rect.size.height + 16;
}

-(CGRect) rectForCellWithText:(NSString *) text {
    NSAttributedString *tweetAttrText = [[NSAttributedString alloc] initWithString:text];
    
    CGRect rect = [tweetAttrText boundingRectWithSize:CGSizeMake(self.tweetText.frame.size.width,
                                                                 CGFLOAT_MAX)
                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                              context:nil];
    //    CGSize s = [text sizeWithFont: self.tweetText.font
    //                      constrainedToSize:CGSizeMake(self.tweetText.frame.size.width,     CGFLOAT_MAX)  // - 40 For cell padding
    //                          lineBreakMode:NSLineBreakByWordWrapping];
    return rect;
}

//-(NSAttributedString *) attrStringWithText:(NSString *) text {
//    return [[NSAttributedString alloc] initWithString:text];
//
//}

- (void)setTweet:(Tweet *)tweet{
    CGRect rect = [self rectForCellWithText:tweet.text];
    
    //NSLog(@"Rect dimentions  %f , %f , %f , %f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    self.tweetText.text = tweet.text;
    
    self.tweetText.frame = CGRectMake(self.tweetText.frame.origin.x, self.tweetText.frame.origin.y, self.tweetText.frame.size.width, rect.size.height + 200 + self.tweetText.contentInset.bottom + self.tweetText.contentInset.top  );
    
    //self.tweetText =tweetTextView;
    
 //   CGSize s = [tweet.text sizeWithFont:[UIFont systemFontOfSize:9]
 //                 constrainedToSize:CGSizeMake(self.bounds.size.width - 40,     CGFLOAT_MAX)  // - 40 For cell padding
 //                     lineBreakMode:NSLineBreakByWordWrapping];
    self.userNameLabel.text = [NSString stringWithFormat:@"@%@",tweet.screenName];

    // Here we use the new provided setImageWithURL: method to load the web image
    //[self.profilePic setImageWithURL:[NSURL URLWithString:tweet.userProfilePicUrl]
    //               placeholderImage:[UIImage imageNamed:@"twitter_placeholder.jpg"]];
    [self.profilePic setImageWithURL:[NSURL URLWithString:tweet.userProfilePicUrl]
                    placeholderImage:[UIImage imageNamed:@"twitter_placeholder.png"]];
}



@end
