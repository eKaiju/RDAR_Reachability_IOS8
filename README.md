RDAR_Reachability_IOS8
======================

Sample code for rdar problem with reachability in iOS 8.

In iOS 7 when an NSURLConnection is downloading and the device connection gets lost, (like when switching to airplane mode), the NSURLConnection handler is triggered with a connection error like NSURLErrorNotConnectedToInternet. If the application checks SCNetworkReachabilityFlags (through Reachability or directly), the response will be that the application is currently not connected so we can be sure that throughout the application all completions will be handled just fine as any check will return the correct value.


In the same case on iOS 8 when the device connection gets lost, the NSURLConnection handler is stll triggered with a connection error like NSURLErrorNotConnectedToInternet. However, if the application checks SCNetworkReachabilityFlags the response will be that the application is currently still connected which can be difficult to handle as the connection obviously knows the device is not connected but the only way we have to check for the status returns a false positive.

