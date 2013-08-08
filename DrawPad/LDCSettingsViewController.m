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
@synthesize delegate;
@synthesize redValue,blueValue,greenValue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Here we ensure that Settings Modal View will hold the values everytime we reload it.
- (void)viewWillAppear:(BOOL)animated
{
    int redIntValue = self.redValue * 255.0;
    self.redControl.value = redIntValue;
    [self sliderChanged:self.redControl];
    
    int greenIntValue = self.redValue * 255.0;
    self.greenControl.value = greenIntValue;
    [self sliderChanged:self.greenControl];
    
    int blueIntValue = self.blueValue * 255.0;
    self.blueContorl.value = blueIntValue;
    [self sliderChanged:self.blueContorl];
    
    self.brushControl.value = self.brushValue;
    [self sliderChanged:self.brushControl];
    
    self.opacityControl.value = self.opacityValue;
    [self sliderChanged:self.opacityControl];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self initSliderDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - target action

- (IBAction)closeSettings:(id)sender
{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate closeSettings:self];
}

- (IBAction)sliderChanged:(id)sender
{
    UISlider *changedSlider = (UISlider*)sender;
    
    if(changedSlider == self.brushControl)
    {
        self.brushValue = self.brushControl.value;
        self.brushValueLabel.text = [NSString stringWithFormat:@"%.1f", self.brushValue];
    }
    else if (changedSlider == self.opacityControl)
    {
        self.opacityValue = self.opacityControl.value;
        self.opacityValueLabel.text = [NSString stringWithFormat:@"%.1f",self.opacityValue];
    }
    else if (changedSlider == self.redControl)
    {
        self.redValue = self.redControl.value/255.0;
        self.redValueLabel.text = [NSString stringWithFormat:@"Red: %d",(int)self.redValue];
    }
    else if (changedSlider == self.greenControl)
    {
        self.greenValue = self.greenControl.value/255.0;
        self.greenValueLabel.text = [NSString stringWithFormat:@"Green: %d",(int)self.greenValue];
    }
    else if (changedSlider == self.blueContorl)
    {
        self.blueValue = self.blueContorl.value/255.0;
        self.blueValueLabel = [NSString stringWithFormat:@"Blue: %d", (int)self.blueValue];
    }
    
    UIGraphicsBeginImageContext(self.brushPreview.frame.size);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.brushValue);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.redValue, self.greenValue, self.blueValue, 1.0);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(),45, 45);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(),45, 45);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.brushPreview.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIGraphicsBeginImageContext(self.opacityPreview.frame.size);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 40.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.redValue, self.greenValue, self.blueValue, self.opacityValue);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.opacityPreview.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}

@end
