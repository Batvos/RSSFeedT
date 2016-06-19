//
//  RSSFeedUserStoryRSSFeedUserStoryInteractorOutput.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSFeedUserStoryInteractorOutput <NSObject>

- (void)didUpdateRSSFeed:(NSArray *)newsList;

@end
