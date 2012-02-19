# IRCallbackKit

The Callback Kit piggybacks on the X-Callback-URL Standard Draft 1.0, and makes using the standard a bit more delightful. 


##	Crude Example

	IRXCallbackURLHandler * const handler = [IRXCallbackURLHandler sharedHander];
	
	[handler addMethod:@"define" block: ^ (NSDictionary *params, IRXCallbackURLSuccessBlock successBlock, IRXCallbackURLFailureBlock failureBlock) {
		
		NSString * const query = [params objectForKey:@"query"];
		
		if ([query isKindOfClass:[NSString class]]) {
			
			[[SMDataSource sharedDataSource] query:query withCompletion: ^ (NSString *results) {
			
				if (results) {
				
					successBlock([NSDictionary dictionaryWithObjectsAndKeys:
						results, kSMResultsKey,
					nil]);
			
				} else {
			
					failureBlock([NSError errorWithDomain:kSMErrorDomain code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
							@"Query returned no result", NSLocalizedDescriptionKey,
					nil]]);
			
				}
			
			}];
		
		} else {
		
			failureBlock([NSError errorWithDomain:kSMErrorDomain code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
					@"Invalid Query", NSLocalizedDescriptionKey,
			nil]]);
		
		}
		
	}];
	
	