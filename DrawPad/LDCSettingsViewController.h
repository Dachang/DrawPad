//
//  LDCSettingsViewController.h
//  DrawPad
//
//  Created by 大畅 on 13-8-8.
//  Copyright (c) 2013年 大畅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDCSettingsViewController : UIViewController
{
    CGFloat brushValue;
    CGFloat opacityValue;
}
- (IBAction)closeSettings:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *brushControl;
@property (strong, nonatomic) IBOutlet UISlider *opacityControl;
- (IBAction)sliderChanged:(id)sender;


@property (strong, nonatomic) IBOutlet UIImageView *brushPreview;
@property (strong, nonatomic) IBOutlet UIImageView *opacityPreview;

@property (strong, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *opacityValueLabel;

@end
