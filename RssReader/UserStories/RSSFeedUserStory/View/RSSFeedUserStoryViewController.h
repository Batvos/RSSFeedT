//
//  RSSFeedUserStoryRSSFeedUserStoryViewController.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSSFeedUserStoryViewInput.h"

@class RSSFeedTableViewManger;

@protocol RSSFeedUserStoryViewOutput;

@interface RSSFeedUserStoryViewController : UITableViewController <RSSFeedUserStoryViewInput>

@property (nonatomic, strong) id<RSSFeedUserStoryViewOutput> output;
@property (nonatomic, strong) RSSFeedTableViewManger<UITableViewDataSource, UITableViewDelegate> *delegateAndSource;

@end
