//
//  ViewController.m
//  test
//
//  Created by Vivek M George on 8/15/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)fetchGreeting;
{
    NSURL *url = [NSURL URLWithString:@"http://www.citibikenyc.com/stations/json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
//             NSLog(@"%@", greeting);
//             NSLog(@"%@", [greeting objectForKey:@"stationBeanList"]);
             NSArray* stations = [greeting objectForKey:@"stationBeanList"];
             for(id st in stations) {
                 NSDictionary *station = (NSDictionary *)st;
                 NSLog(@"%@", [station objectForKey:@"latitude"]);
                 NSLog(@"%@", [station objectForKey:@"longitude"]);
                 NSLog(@"%@", [station objectForKey:@"stationName"]);
                 NSLog(@"Numer of bikes: %@", [station objectForKey:@"availableBikes"]);
             }
             
             
//             NSArray *stationArray = [NSArray arrayWithObject:@"greeting"];
//             NSArray *stationArray = [NSArray arrayWithObject: @"greeting"];
//                                      for(id tempStation in stationArray) {
//                                          NSLog(@"%@", tempStation);
//                                      }
//             self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
//             self.greetingContent.text = [greeting objectForKey:@"stationBeanList"];
//             NSLog(@"%@", self.greetingContent.text );
//             NSArray * myArray4 = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:@"http://icodeblog.com/wp-content/uploads/2009/08/foo.plist"]];
//             NSLog(@"%@", myArray4);
         }
     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchGreeting];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
