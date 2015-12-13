//
//  ViewController.m
//  weatherman
//
//  Created by ian kunneke on 12/13/15.
//  Copyright © 2015 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UIButton *showWeather;
@property(nonatomic, strong) NSURLSession *session;
@property(nonatomic, copy) NSArray *weather;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)showTheWeather:(UIButton *)sender
{
    NSString *requestString = @"http://api.openweathermap.org/data/2.5/weather?q=orlando&appid=2de143494c0b295cca9337e1e96b00e0";
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:requestString]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error)
    {
                // handle response
                
            }] resume];
//    
//    NSURL *url = [NSURL URLWithString:requestString];
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
//    
//    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
//                                      {
//                                          //        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                          //        NSLog(@"%@", json);
//                                          
//                                          NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//                                          //        NSLog(@"%@", jsonObject);
//                                          self.weather = jsonObject[@"main"];
//                                          
//                                          NSLog(@"%@", self.weather);
//                                          
//                                      }];
//    [dataTask resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showWeather:(id)sender {
}
@end
