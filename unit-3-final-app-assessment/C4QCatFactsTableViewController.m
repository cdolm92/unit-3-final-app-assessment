//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import <AFNetworking/AFNetworking.h>

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic) NSMutableArray *catFacts;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSSet *contentTypes = [NSSet setWithObjects: @"text/html", @"text/plain", @"audio/wav", @"application/javascript", nil];
     
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = contentTypes;
    
     [manager GET:@"http://catfacts-api.appspot.com/api/facts?number=100"
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         
      self.catFacts = [[NSMutableArray alloc] init];

     
     self.catFacts = [responseObject objectForKey:@"facts"];
    
     NSLog(@"%@", self.catFacts[0]);
     
     
     }
     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     
     NSLog(@"%@", error.userInfo);
     }];
     
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatFactIdentifier" forIndexPath:indexPath];
    
    return cell;
}
*/


@end
