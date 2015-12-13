//
//  OptionsViewController.m
//  Hedgehog App
//
//  Created by ian kunneke on 12/9/15.
//  Copyright © 2015 test. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@property(weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property(weak, nonatomic) IBOutlet UIImageView *myImage;

@end

@implementation OptionsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.mySwitch.on = NO;
    
    if (self.mySwitch.on == NO)
    {
        UIImage *sun = [UIImage imageNamed: @"sun"];
        
        self.view.backgroundColor = [UIColor whiteColor];
        [_myImage setImage:sun];
    }
    else
    {
        UIImage *moon = [UIImage imageNamed: @"moon"];
        
        self.view.backgroundColor = [UIColor grayColor];
        [_myImage setImage:moon];
    }
}

-(IBAction)switchValueChanged:(UISwitch *)sender
{
    UIImage *moon = [UIImage imageNamed: @"moon"];
    UIImage *sun = [UIImage imageNamed: @"sun"];
    
    
    if (sender.on == YES)
    {
        self.view.backgroundColor = [UIColor grayColor];
        [_myImage setImage:moon];
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];
        [_myImage setImage:sun];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
