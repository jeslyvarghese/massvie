//
//  SLViewController.h
//  CImageDemo1
//
//  Created by justin on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *imageViewOutlet;


- (IBAction)sliderValueChanged:(id)sender;
@property (retain, nonatomic) IBOutlet UISlider *sliderOutlet;
@end
