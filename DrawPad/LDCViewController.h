//
//  LDCViewController.h
//  DrawPad
//
//  Created by 大畅 on 13-8-8.
//  Copyright (c) 2013年 大畅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDCSettingsViewController.h"

@interface LDCViewController : UIViewController<LDCSettingsViewControllerDelegate,UIActionSheetDelegate>
{
    CGPoint lastPoint;   //saving the latest point made on the canvas, this will continously draw brushes on the screen
    CGFloat red;      // R
    CGFloat green;    // G
    CGFloat blue;     // B
    CGFloat brush;    // brush width
    CGFloat opacity;  // opacity
    BOOL mouseSwiped;  // whether the brush is continous or not
}

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (strong, nonatomic) IBOutlet UIImageView *mainImage;

- (IBAction)pencilPressed:(id)sender;
- (IBAction)eraserPressed:(id)sender;

- (IBAction)reset:(id)sender;
- (IBAction)setting:(id)sender;
- (IBAction)save:(id)sender;

@end
