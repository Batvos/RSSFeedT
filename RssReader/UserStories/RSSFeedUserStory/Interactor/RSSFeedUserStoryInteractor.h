//
//  RSSFeedUserStoryRSSFeedUserStoryInteractor.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryInteractorInput.h"

@protocol RSSFeedUserStoryInteractorOutput;

@interface RSSFeedUserStoryInteractor : NSObject <RSSFeedUserStoryInteractorInput>

@property (nonatomic, weak) id<RSSFeedUserStoryInteractorOutput> output;

@end
