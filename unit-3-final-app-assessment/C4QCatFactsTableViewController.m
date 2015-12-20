//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import "C4QCatFactsDetailViewController.h"
#import "C4QSavedCatFactsTableViewController.h"
#import "CatFactsTableViewCell.h"
#import "CatFactData.h"
#import <AFNetworking/AFNetworking.h>

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic) NSMutableArray *catFacts;
@property (nonatomic) NSMutableArray *passFact;

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
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200.0;
    
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
    
    
    
    
    
    
    [cell.catFact setLineBreakMode:NSLineBreakByWordWrapping];
    [cell.catFact minimumScaleFactor];
    [cell.catFact setNumberOfLines:0];
    [cell.catFact setFont:[UIFont systemFontOfSize:14]];
    [cell.catFact setTag:1];
    
    [[cell contentView] addSubview:cell.catFact];
    
    
    
    
    
    return cell;
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showCatFactDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *theCatFact = [self objectForIndexPath:indexPath];
        
        C4QCatFactsDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.factOnCat= theCatFact;
        
    }
    if([[segue identifier] isEqualToString:@"showSavedFacts"]) {
        
        
        
        
        
       C4QSavedCatFactsTableViewController *SavedTVC = segue.destinationViewController;
        SavedTVC.bunchOfCatFacts = self.selectedFact;
        
        NSLog(@"Fact: %@", self.selectedFact);
        

        
        
        
    }
    
    
    
}





- (NSString *)objectForIndexPath:(NSIndexPath *)indexPath {
    
    return self.catFacts[indexPath.row];
    
}




//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    self.selectedFact = [[NSMutableArray alloc]init];
//    CatFactsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSString *cellText = cell.catFact.text;
//    [self.selectedFact addObject:cellText];
//    NSLog(@"%@",self.selectedFact);
//
//
//}















@end
