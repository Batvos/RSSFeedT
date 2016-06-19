//
//  RSSFeedUserStoryRSSFeedUserStoryInteractorInput.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSFeedUserStoryInteractorInput <NSObject>

/**
 * Method to obtain RSS feed.
 * @return Array of RSSNewsEntity objects.
 */
- (NSArray *)obtainRSSFeed;

/**
 * Method to update RSS feed. 
 */
- (void)updateRSSFeed;

@end
