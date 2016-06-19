//
//  RSSFeedUserStoryRSSFeedUserStoryViewOutput.h
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSNewsEntity;

@protocol RSSFeedUserStoryViewOutput <NSObject>

/**
 @author batvos

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;


/**
 * Method inform presenter about tap on the cell.
 * @param news News in selected cell. Model entity with type RSSNewsEntity.
 */
- (void)didTriggerTapCellWithNews:(RSSNewsEntity *)news;

@end
