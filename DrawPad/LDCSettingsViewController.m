//
//  LDCSettingsViewController.m
//  DrawPad
//
//  Created by 大畅 on 13-8-8.
//  Copyright (c) 2013年 大畅. All rights reserved.
//

#import "LDCSettingsViewController.h"

@interface LDCSettingsViewController ()

@end

@implementation LDCSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - target action

- (IBAction)closeSettings:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sliderChanged:(id)sender
{
    UISlider *changedSlider = (UISlider*)sender;
    
    if(changedSlider == self.brushControl)
    {
        brushValue = self.brushControl.value;
        self.brushValueLabel.text = [NSString stringWithFormat:@"%.1f", brushValue];
        
        UIGraphicsBeginImageContext(self.brushPreview.frame.size);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brushValue);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(),45, 45);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(),45, 45);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.brushPreview.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    else if (changedSlider == self.opacityControl)
    {
        opacityValue = self.opacityControl.value;
        self.opacityValueLabel.text = [NSString stringWithFormat:@"%.1f",opacityValue];
        
        UIGraphicsBeginImageContext(self.opacityPreview.frame.size);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 40.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, opacityValue);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 45, 45);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 45, 45);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.opacityPreview.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
}

@end
