//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "C4QColorPickerViewController.h"

@interface C4QViewController () <ColorSettingDelegate>

@end

@implementation C4QViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showColorPicker"]){
    C4QColorPickerViewController *colorPickerVC = segue.destinationViewController;
    colorPickerVC.delegate = self;
    }
}


-(void)userDidSetBackgroundColor:(UIColor *)background {
    
    self.view.backgroundColor = background;
}




@end
