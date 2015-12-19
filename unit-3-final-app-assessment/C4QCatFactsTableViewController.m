//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import "CatFactsTableViewCell.h"
#import "CatFactData.h"
#import <AFNetworking/AFNetworking.h>

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic) NSMutableArray *catFacts;

@end

@implementation C4QCatFactsTableViewController




-(void)fetchCatData {
    
  
    



}

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
             
             NSArray *results = responseObject[@"facts"];
             
             // reset my array
             self.catFacts = [[NSMutableArray alloc] init];
             
             
             for (NSString *result in results) {
                 
                [self.catFacts addObject: result];
             }
             
             [self.tableView reloadData];
             
             
         }
     
     
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
             
             NSLog(@"%@", error.userInfo);
         }];
    
    

    
    
 
    
    
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catFacts.count;
}












- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CatFactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatFactIdentifier" forIndexPath:indexPath];
    
    cell.catFact.text = [self.catFacts objectAtIndex:indexPath.row];
    cell.catFact.numberOfLines = 0;
    cell.catFact.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
    
    
  
    
    return cell;
}





@end
