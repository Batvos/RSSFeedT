//
//  RSSFeedUserStoryRSSFeedUserStoryAssembly.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryAssembly.h"

#import "RSSFeedUserStoryViewController.h"
#import "RSSFeedUserStoryInteractor.h"
#import "RSSFeedUserStoryPresenter.h"
#import "RSSFeedUserStoryRouter.h"
#import "RSSFeedTableViewManger.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RSSFeedUserStoryAssembly

- (RSSFeedUserStoryViewController *)viewRSSFeedUserStoryModule {
    return [TyphoonDefinition withClass:[RSSFeedUserStoryViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRSSFeedUserStoryModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterRSSFeedUserStoryModule]];
                              [definition injectProperty:@selector(delegateAndSource)
                                                    with:[self tableViewMangerRSSFeedUserStroryModule]];
                          }];
}

- (RSSFeedUserStoryInteractor *)interactorRSSFeedUserStoryModule {
    return [TyphoonDefinition withClass:[RSSFeedUserStoryInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRSSFeedUserStoryModule]];
                          }];
}

- (RSSFeedUserStoryPresenter *)presenterRSSFeedUserStoryModule {
    return [TyphoonDefinition withClass:[RSSFeedUserStoryPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewRSSFeedUserStoryModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorRSSFeedUserStoryModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerRSSFeedUserStoryModule]];
                          }];
}

- (RSSFeedUserStoryRouter *)routerRSSFeedUserStoryModule {
    return [TyphoonDefinition withClass:[RSSFeedUserStoryRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewRSSFeedUserStoryModule]];
                          }];
}

- (RSSFeedTableViewManger *)tableViewMangerRSSFeedUserStroryModule {
    return [TyphoonDefinition withClass:[RSSFeedTableViewManger class]];
}

@end
