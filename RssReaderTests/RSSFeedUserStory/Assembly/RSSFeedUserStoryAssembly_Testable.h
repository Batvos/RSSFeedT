//
//  RSSFeedUserStoryRSSFeedUserStoryAssembly_Testable.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryAssembly.h"

@class RSSFeedUserStoryViewController;
@class RSSFeedUserStoryInteractor;
@class RSSFeedUserStoryPresenter;
@class RSSFeedUserStoryRouter;

@interface RSSFeedUserStoryAssembly ()

- (RSSFeedUserStoryViewController *)viewRSSFeedUserStoryModule;
- (RSSFeedUserStoryPresenter *)presenterRSSFeedUserStoryModule;
- (RSSFeedUserStoryInteractor *)interactorRSSFeedUserStoryModule;
- (RSSFeedUserStoryRouter *)routerRSSFeedUserStoryModule;

@end
