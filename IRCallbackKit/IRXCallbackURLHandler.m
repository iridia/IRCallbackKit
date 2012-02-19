//
//  IRXCallbackURLHandler.m
//  IRCallbackKit
//
//  Created by Evadne Wu on 2/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IRXCallbackURLHandler.h"

NSString * const kIRXCallbackURLHandlerDidReceiveURLNotification = @"IRXCallbackURLHandlerDidReceiveURLNotification";


@interface IRXCallbackURLHandler ()

@property (nonatomic, readwrite, retain) NSDictionary *methodsToObservers;
- (NSMutableArray *) observersForMethod:(NSString *)method;

@end


@implementation IRXCallbackURLHandler
@synthesize methodsToObservers;

+ (id) sharedHandler {

	static dispatch_once_t onceToken;
	static id instance;
	dispatch_once(&onceToken, ^{
		instance = [[self alloc] init];
	});
	
	return instance;

}

- (id) init {

	self = [super init];
	if (!self)
		return nil;
	
	methodsToObservers = [[NSDictionary dictionary] retain];
	
	return self;

}

- (void) dealloc {

	[methodsToObservers release];
	
	[super dealloc];

}

- (id) addObserverForMethod:(NSString *)method usingBlock:(IRXCallbackURLHandlerBlock)block {

	id object = [[NSNotificationCenter defaultCenter] addObserverForName:kIRXCallbackURLHandlerDidReceiveURLNotification object:nil queue:nil usingBlock: ^ (NSNotification *note) {
	
		//		TBD: fire stuff
		
	}];
	
	[[self observersForMethod:method] addObject:object];
	
	return object;

}

- (BOOL) removeObserver:(id)observer forCallbackMethod:(NSString *)method error:(NSError **)error {

	if (!observer && !method) {
	
		//		TBD: Remove everything
	
	} else if (!observer) {
	
		//		TBD: Remove everything bound to the particular method		
	
	} else {
	
		//		TBD: Remove the particular object
	
	}
	
	return YES;

}

@end
