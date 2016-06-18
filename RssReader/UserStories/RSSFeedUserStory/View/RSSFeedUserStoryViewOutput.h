//
//  RSSFeedUserStoryRSSFeedUserStoryViewOutput.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSFeedUserStoryViewOutput <NSObject>

/**
 @author batvos

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

@end
