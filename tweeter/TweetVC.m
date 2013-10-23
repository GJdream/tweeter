//
//  TweetVC.m
//  tweeter
//
//  Created by bgbb on 10/22/13.
//  Copyright (c) 2013 greensprout. All rights reserved.
//

#import "TweetVC.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeVC.h"

@interface TweetVC ()
@property (weak, nonatomic) IBOutlet UIImageView *userProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userScreenNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;

- (IBAction)onReplyButton:(id)sender;
- (IBAction)onRetweetButton:(id)sender;
- (IBAction)onFavoriteButton:(id)sender;

@end

@implementation TweetVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithTweet:(Tweet *)tweet{
    if (self){

    }else{
        self=[super initWithNibName:@"TweetVC"
                       bundle:nil];
    }
    self.tweet = tweet;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.userProfilePic setImageWithURL:[NSURL URLWithString:self.tweet.userProfilePicUrl]
                    placeholderImage:[UIImage imageNamed:@"twitter_placeholder.png"]];

    NSAttributedString *tweetAttrText = [[NSAttributedString alloc] initWithString:self.tweet.text];
    CGRect rect = [tweetAttrText boundingRectWithSize:CGSizeMake(self.tweetTextView.frame.size.width,CGFLOAT_MAX)
                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                              context:nil];
    
    self.tweetTextView.text = self.tweet.text;
    
    self.userNameLabel.text = self.tweet.userName;
    self.userScreenNameLabel.text = [NSString stringWithFormat:@"@%@",self.tweet.screenName];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"HH:MM DD MM YY"];
    
    self.timestampLabel.text = [dateFormatter stringFromDate:self.tweet.createdAt];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onReplyButton:(id)sender {
    
    ComposeVC *compvc = [[ComposeVC alloc] initWithText:[NSString stringWithFormat:@"@%@",self.tweet.screenName]];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:compvc];
    //[compvc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:nvc animated:YES completion:nil];
    
}

- (IBAction)onRetweetButton:(id)sender {
    NSLog(@"Id:%@",self.tweet.tweetId);
    
    [[TwitterClient instance] retweetWithId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
    
}

- (IBAction)onFavoriteButton:(id)sender {
    
    [[TwitterClient instance] favoriteWithId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}
@end
