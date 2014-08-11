//
//  ViewController.m
//  DownloadHuge
//
//  Created by Oleo, Pierre on 2014-08-08.
//  Copyright (c) 2014 La Presse. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)loadPage:(id)sender{
	[self.indicatorView startAnimating];
	__weak ViewController *wself = self;
	[NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://archive.org/download/dom-6567newnosferatu/dom-6567newnosferatu.pegssc.mpeg"]]
									   queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
										   [wself.indicatorView stopAnimating];
										   
										   BOOL connected = [Reachability reachabilityForInternetConnection].currentReachabilityStatus != NotReachable;
										   BOOL connectionRequired = [Reachability reachabilityForInternetConnection].connectionRequired;
										   NSString * message = [NSString stringWithFormat:@"Status : %@\n Connection required : %@\n Error : %@",
																 connected?@"Reachable":@"Not Reachable",
																 connectionRequired?@"Required":@"Not Required",
																 connectionError];
										   UIAlertView *alertView =  [[UIAlertView alloc] initWithTitle:@"Connection Did End" message:message delegate:nil cancelButtonTitle:connected?@"That's annoying indeed":@"Here it works fine" otherButtonTitles:nil];
										   [alertView show];
									   }];
	// In iOS 7 When the connections are interrupted The SCNetworkReachabilityFlags flags are already set for the application to know its device is offline
	// In iOS 8 When the connections are interrupted The SCNetworkReachabilityFlags flags are still set so that if the application checks the device connection status, it is marked as online
}


@end
