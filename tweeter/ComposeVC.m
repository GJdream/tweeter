//
//  ComposeVC.m
//  tweeter
//
//  Created by bgbb on 10/22/13.
//  Copyright (c) 2013 greensprout. All rights reserved.
//

#import "ComposeVC.h"

@interface ComposeVC ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) NSString *preFillText;

@end

@implementation ComposeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithText:(NSString *)text{
    if (self){
        
    }else{
        self=[super initWithNibName:@"ComposeVC"
                             bundle:nil];
    }
    self.preFillText = text;
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tweetTextView.delegate = self;

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onTweetButton:)];
    self.tweetTextView.text = [NSString stringWithFormat:@"%@ ",self.preFillText];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [self.tweetTextView becomeFirstResponder];
    //    NSLog(@"is textview 1st responder %d",
    //           [self.tweetTextView isFirstResponder]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTweetButton:(id)sender {
    NSLog(@"Tweet!");
    [self.tweetTextView resignFirstResponder];
    // do alert for getting confirmation
    [[[UIAlertView alloc] initWithTitle:@"Tweet"
                               message:@"Wanna tweet?"
                              delegate:self
                     cancelButtonTitle:@"Yes"
                     otherButtonTitles:@"No", nil] show];
}

#pragma mark AlertView Delegate

- (void)alertView:(UIAlertView *)alertV clickedButtonAtIndex:(NSInteger)buttonIndex{
      // 0 is 'Yes'
    if ((int) buttonIndex == 0){
        NSLog(@"Update:%@", self.tweetTextView.text);
        [[TwitterClient instance] postTweetWithText:self.tweetTextView.text
                                            success:^(AFHTTPRequestOperation *operation, id response) {
                                                NSLog(@"%@", response);
                                            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                // Do nothing
                                            }];
    }else {
        //do nothing
    }
    //going back to timeline view
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
}


@end
