//
//  FactViewController.m
//  Hedgehog App
//
//  Created by ian kunneke on 12/8/15.
//  Copyright © 2015 test. All rights reserved.
//

#import "FactViewController.h"


@interface FactViewController ()

@property(weak, nonatomic) IBOutlet UILabel *continentLabel;
@property(weak, nonatomic) IBOutlet UILabel *factLabel;


@end

@implementation FactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.continentLabel.text = [NSString stringWithFormat:@"Found in %@", self.theHedgehog.continent];
    self.factLabel.text = self.theHedgehog.fact;
    self.title = self.theHedgehog.name;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
