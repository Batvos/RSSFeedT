//
//  RSSFeedUserStoryRSSFeedUserStoryPresenter.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryViewOutput.h"
#import "RSSFeedUserStoryInteractorOutput.h"
#import "RSSFeedUserStoryModuleInput.h"

@protocol RSSFeedUserStoryViewInput;
@protocol RSSFeedUserStoryInteractorInput;
@protocol RSSFeedUserStoryRouterInput;

@interface RSSFeedUserStoryPresenter : NSObject <RSSFeedUserStoryModuleInput, RSSFeedUserStoryViewOutput, RSSFeedUserStoryInteractorOutput>

@property (nonatomic, weak) id<RSSFeedUserStoryViewInput> view;
@property (nonatomic, strong) id<RSSFeedUserStoryInteractorInput> interactor;
@property (nonatomic, strong) id<RSSFeedUserStoryRouterInput> router;

@end
