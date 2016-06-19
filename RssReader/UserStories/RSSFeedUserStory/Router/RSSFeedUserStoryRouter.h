//
//  RSSFeedUserStoryRSSFeedUserStoryRouter.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RSSFeedUserStoryRouter : NSObject <RSSFeedUserStoryRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
