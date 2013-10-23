//
//  TimelineVC.m
//  twitter
//
//  Created by Timothy Lee on 8/4/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TimelineVC.h"
#import "TweetCell.h"
#import "ComposeVC.h"
#import "TweetVC.h"

//#define kLabelFrameMaxSize CGSizeMake(265.0, 200.0)

@interface TimelineVC ()

@property (nonatomic, strong) NSMutableArray *tweets;

- (void)onSignOutButton;
- (void)reload;

@end

@implementation TimelineVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Tweeter";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onSignOutButton)];
    
    UINib *tweetNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tableView registerNib:tweetNib forCellReuseIdentifier:@"TweetCell"];

     //Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"187-pencil.png"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onComposeButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    Tweet *tweet = self.tweets[indexPath.row];
    //cell.tweet = tweet;
    [cell setTweet:tweet];
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Tweet *tweet = self.tweets[indexPath.row];
    TweetVC *tvc = [[TweetVC alloc] initWithTweet:tweet];
    [self.navigationController pushViewController:tvc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // static NSString *CellIdentifier = @"TweetCell";
   // TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//  Tweet *tweet = self.tweets[indexPath.row];
//    NSAttributedString *tweetAttrText = [[NSAttributedString alloc] initWithString:tweet.text];
//    NSLog(@"tweet text:%@",tweet.text);
//    CGRect rect = [tweetAttrText boundingRectWithSize:CGSizeMake(self.view.bounds.size.width-40,CGFLOAT_MAX)
//                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
//                                              context:nil];
//    CGSize textSize = [tweet.text sizeWithFont:[UIFont fontWithName: @"System" size: 14.0f]
//                              constrainedToSize:kLabelFrameMaxSize];
    Tweet *tweet = self.tweets[indexPath.row];
    TweetCell *cell = [[TweetCell alloc] init];
    float height = [cell sizeForCellWithText:tweet.text];
    cell = nil;
    return height + 90;
}


#pragma mark - Private methods

- (void)onSignOutButton {
    [User setCurrentUser:nil];
}
// going to tweet composer
- (void)onComposeButton {
    ComposeVC *compvc = [[ComposeVC alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:compvc];
    //[compvc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)reload {
    [[TwitterClient instance] homeTimelineWithCount:20 sinceId:0 maxId:0 success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.tweets = [Tweet tweetsWithArray:response];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

@end
