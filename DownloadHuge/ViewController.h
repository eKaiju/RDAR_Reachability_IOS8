//
//  ViewController.h
//  DownloadHuge
//
//  Created by Oleo, Pierre on 2014-08-08.
//  Copyright (c) 2014 La Presse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
- (IBAction)loadPage:(id)sender;

@end
