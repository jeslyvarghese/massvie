//
//  SLViewController.m
//  CImageDemo1
//
//  Created by justin on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SLViewController.h"

@interface SLViewController()
-(UIImage*) applySepiaEffectOnImageWithIntensityValue:(CGFloat)pIntensityValue;
@end

@implementation SLViewController
{
    CIContext *context;
    CIImage   *inputImage;
    CIFilter  *sepiaFilter; 
}
@synthesize sliderOutlet;
@synthesize imageViewOutlet;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    context          = [[CIContext contextWithOptions:nil]retain];
    inputImage       = [[CIImage imageWithCGImage:imageViewOutlet.image.CGImage]retain];
    sepiaFilter      = [[CIFilter filterWithName:@"CISepiaTone"]retain];
    
    [sepiaFilter setValue:inputImage forKey:kCIInputImageKey];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [context release];
    [inputImage release];
    [sepiaFilter release];
    
    context = nil;
    inputImage = nil;
    sepiaFilter = nil;
    
    [self setImageViewOutlet:nil];
    [self setSliderOutlet:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(UIImage*) applySepiaEffectOnImageWithIntensityValue:(CGFloat)pIntensityValue
{

    

    
    NSNumber *intensityValue    = [NSNumber numberWithFloat:pIntensityValue];
    [sepiaFilter  setValue:intensityValue forKey:@"inputIntensity"];
    
    CIImage *outputImage        = [sepiaFilter valueForKey:kCIOutputImageKey];
    
   
    
    CGImageRef outputImageRendered = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:outputImageRendered];
    CGImageRelease(outputImageRendered);
    return returnImage;
}
- (void)dealloc {
    [imageViewOutlet release];
    [sliderOutlet release];

    [super dealloc];
}
- (IBAction)sliderValueChanged:(id)sender {
    imageViewOutlet.image = [self applySepiaEffectOnImageWithIntensityValue:sliderOutlet.value];
}
@end
