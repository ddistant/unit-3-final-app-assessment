//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"

@interface C4QViewController () <ColorPickerDelegate>

@end

@implementation C4QViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"colorSegue"]) {
        C4QColorPickerViewController *vc = [segue destinationViewController];
        vc.delegate = self;
    }
}

-(void)userSelectedColor:(UIColor *)color {
    self.view.backgroundColor = color;
}

@end
