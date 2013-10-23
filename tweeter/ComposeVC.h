//
//  ComposeVC.h
//  tweeter
//
//  Created by bgbb on 10/22/13.
//  Copyright (c) 2013 greensprout. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeVC : UIViewController <UITextViewDelegate, UIAlertViewDelegate>

- (id)initWithText:(NSString *)text;

@end
