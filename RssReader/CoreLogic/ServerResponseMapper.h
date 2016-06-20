//
//  ServerResponseMapper.h
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * The ServerResponseMapper protocol contain methods that used for mapping response from server to model object.
 */
@protocol ServerResponseMapper <NSObject>

/**
 * Returns a model object that was mapped from recrver response data.
 * @param data Server response.
 * @param error Error during mapping.
 * @return Model object that was mapped from server data.
 */
- (id)mapServerResponse:(id)data error:(NSError **)error;

@end
