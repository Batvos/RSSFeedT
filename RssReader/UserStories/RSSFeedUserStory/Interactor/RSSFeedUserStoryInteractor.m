//
//  RSSFeedUserStoryRSSFeedUserStoryInteractor.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryInteractor.h"
#import "RSSFeedService.h"
#import "RSSFeedUserStoryInteractorOutput.h"

@implementation RSSFeedUserStoryInteractor

#pragma mark - Методы RSSFeedUserStoryInteractorInput

- (NSArray *)obtainRSSFeed {
    NSArray *rssNewsList = [self.rssFeddService obtainRSSFeddFromCache];
    
    return [self sortRSSFeedByDate:[rssNewsList mutableCopy]];
}

- (void)updateRSSFeed {
   [self.rssFeddService updateRSSFeedUsingSuccessBlock:^(id data) {
       NSArray *rssNewsList = [self sortRSSFeedByDate:data];
       [self.output didUpdateRSSFeed:rssNewsList];
   } failure:^(NSError *error) {
       // do nothing or show error msg
       NSLog(@"Error in %s", __PRETTY_FUNCTION__);
   }];
}

#pragma mark -  Private methods

- (NSArray *)sortRSSFeedByDate:(NSMutableArray *)rssNewsList {
    return rssNewsList;
}

@end
