//
//  IRXCallbackURLHandler.h
//  IRCallbackKit
//
//  Created by Evadne Wu on 2/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^IRXCallbackURLHandlerSuccessBlock)(NSDictionary *results);
typedef void (^IRXCallbackURLHandlerFailureBlock)(NSError *error);
typedef void (^IRXCallbackURLHandlerBlock)(IRXCallbackURLHandlerSuccessBlock successBlock, IRXCallbackURLHandlerFailureBlock failureBlock);

extern NSString * const kIRXCallbackURLHandlerDidReceiveURLNotification;

@interface IRXCallbackURLHandler : NSObject

+ (id) sharedHandler;

- (id) addObserverForMethod:(NSString *)method usingBlock:(IRXCallbackURLHandlerBlock)block;
- (BOOL) removeObserver:(id)observer forCallbackMethod:(NSString *)method error:(NSError **)error;

@end
