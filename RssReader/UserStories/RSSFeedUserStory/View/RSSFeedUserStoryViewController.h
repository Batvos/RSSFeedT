//
//  RSSFeedUserStoryRSSFeedUserStoryViewController.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSSFeedUserStoryViewInput.h"

@protocol RSSFeedUserStoryViewOutput;

@interface RSSFeedUserStoryViewController : UIViewController <RSSFeedUserStoryViewInput>

@property (nonatomic, strong) id<RSSFeedUserStoryViewOutput> output;

@end
