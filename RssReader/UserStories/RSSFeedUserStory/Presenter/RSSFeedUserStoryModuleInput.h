//
//  RSSFeedUserStoryRSSFeedUserStoryModuleInput.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol RSSFeedUserStoryModuleInput <RamblerViperModuleInput>

/**
 @author batvos

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
