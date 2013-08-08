//
//  LDCSettingsViewController.h
//  DrawPad
//
//  Created by 大畅 on 13-8-8.
//  Copyright (c) 2013年 大畅. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LDCSettingsViewControllerDelegate <NSObject>
- (void)closeSettings:(id)sender;
@end

@interface LDCSettingsViewController : UIViewController
- (IBAction)closeSettings:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *brushControl;
@property (strong, nonatomic) IBOutlet UISlider *opacityControl;

@property (strong, nonatomic) IBOutlet UISlider *redControl;
@property (strong, nonatomic) IBOutlet UISlider *greenControl;
@property (strong, nonatomic) IBOutlet UISlider *blueContorl;

- (IBAction)sliderChanged:(id)sender;



@property CGFloat brushValue;
@property CGFloat opacityValue;

@property CGFloat redValue;
@property CGFloat greenValue;
@property CGFloat blueValue;

@property (strong, nonatomic) IBOutlet UIImageView *brushPreview;
@property (strong, nonatomic) IBOutlet UIImageView *opacityPreview;

@property (strong, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *opacityValueLabel;

@property (strong, nonatomic) IBOutlet UILabel *redValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *greenValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *blueValueLabel;


@property (nonatomic, weak) id<LDCSettingsViewControllerDelegate> delegate;

@end
