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

- (void)setTweet:(Tweet *)tweet{
    //self.tweetText.text = tweet.text;
    NSAttributedString *tweetAttrText = [[NSAttributedString alloc] initWithString:tweet.text];
    CGRect rect = [tweetAttrText boundingRectWithSize:CGSizeMake(self.bounds.size.width-40,CGFLOAT_MAX)
                                           options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                           context:nil];
    UITextView *tweetTextView = [[UITextView alloc] initWithFrame:rect];
    [self.contentView addSubview:tweetTextView];
    self.tweetText =tweetTextView;
 //   CGSize s = [tweet.text sizeWithFont:[UIFont systemFontOfSize:9]
 //                 constrainedToSize:CGSizeMake(self.bounds.size.width - 40,     CGFLOAT_MAX)  // - 40 For cell padding
 //                     lineBreakMode:NSLineBreakByWordWrapping];
    self.userNameLabel.text = tweet.userName;
    // Here we use the new provided setImageWithURL: method to load the web image
    //[self.profilePic setImageWithURL:[NSURL URLWithString:tweet.userProfilePicUrl]
    //               placeholderImage:[UIImage imageNamed:@"twitter_placeholder.jpg"]];
    [self.profilePic setImageWithURL:[NSURL URLWithString:tweet.userProfilePicUrl]
                    placeholderImage:[UIImage imageNamed:@"twitter_placeholder.png"]];
}
/**
+ (CGFloat *)cellContentHeight{
    CGRect textFrame = self.tweetText.frame;
    CGRect nameFrame = self.userNameLabel.frame;
    
    return (self.tweetText.frame.size.height + self.userNameLabel.frame.size.height + 10);
}**/



@end
