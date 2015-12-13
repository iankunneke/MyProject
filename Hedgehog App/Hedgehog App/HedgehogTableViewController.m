//
//  HedgehogTableViewController.m
//  Hedgehog App
//
//  Created by ian kunneke on 12/8/15.
//  Copyright © 2015 test. All rights reserved.
//

#import "HedgehogTableViewController.h"
#import "Hedgehogs.h"
#import "FactViewController.h"

@interface HedgehogTableViewController ()

{
    NSMutableArray *theHedgehogs;
}

@property(weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property(nonatomic, strong) NSURLSession *session;
@property(nonatomic, copy) NSArray *weather;


- (void)loadHedgehogs;

@end

@implementation HedgehogTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self)
    {
    
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
        
        [self fetchFeed];
    }
    return self;
}

- (void)fetchFeed
{
    NSString *requestString = @"http://api.openweathermap.org/data/2.5/weather?q=orlando&appid=2de143494c0b295cca9337e1e96b00e0";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
//        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", json);
        
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@", jsonObject);
        self.weather = jsonObject[@"main"];
        
        NSLog(@"%@", self.weather);
        
    }];
    [dataTask resume];
}




- (void)viewDidLoad
{
    self.title = @"Hedgehog banner";
    
    
    
//    self.weatherLabel.text = ;

    
    [super viewDidLoad];
    
    
    theHedgehogs = [[NSMutableArray alloc]init];
    [self loadHedgehogs];
}
/*
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.tableFooterView  =[[UIView alloc]  initWithFrame:CGRectZero];
}
*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [theHedgehogs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HedgehogCell" forIndexPath:indexPath];
    
    Hedgehogs *aHedgehog = [theHedgehogs objectAtIndex:indexPath.row];
    cell.textLabel.text = aHedgehog.name;
    cell.detailTextLabel.text = @"";
    
    if (indexPath.row == 0)
    {
            cell.imageView.image = [UIImage imageNamed:@"european"];
    }
    if (indexPath.row == 1)
    {
            cell.imageView.image = [UIImage imageNamed:@"long eared"];
    }
    if (indexPath.row == 2)
    {
        cell.imageView.image = [UIImage imageNamed:@"four toed"];
    }
    
    

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"FactsDetailSegue"])
    {
        FactViewController *factVC = segue.destinationViewController;
        
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
        Hedgehogs *selectedHedgehog = theHedgehogs [indexPath.row];
        
        factVC.theHedgehog = selectedHedgehog;
    }
}

- (void)loadHedgehogs
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Hedgehog" ofType:@"json"];
    
    NSArray *hedgehogJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *aDict in hedgehogJSON)
    {
        Hedgehogs *aHedgehog = [Hedgehogs hedgehogsWithDictionary:aDict];
        [theHedgehogs addObject:aHedgehog];
    }
}






@end
