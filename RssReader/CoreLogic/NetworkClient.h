//
//  NetworkClient.h
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkCompletionBlock)(NSData *data, NSError *error);

/*
 * Protocol represent network request which is responsible for sending and receiving response from server.
*/
@protocol NetworkClient <NSObject>


/**
 * Method used to sending asynchronyous NSURLRequest request to server and recieving response as NSData.
 * @param request Patameter contain all needed information for request (URL, HTTP method, headers, etc.).
 * @param completionBlock Block called when request is performed. 
 */
- (void)sendRequest:(NSURLRequest *)request completionBlock:(NetworkCompletionBlock)completionBlock;

@end
