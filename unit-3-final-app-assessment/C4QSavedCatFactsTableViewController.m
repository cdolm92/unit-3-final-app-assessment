//
//  C4QSavedCatFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Christella on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QSavedCatFactsTableViewController.h"
#import "SavedCatFactsTableViewCell.h"


@interface C4QSavedCatFactsTableViewController ()


@property (nonatomic) NSMutableArray *facts;

@end

@implementation C4QSavedCatFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.facts = self.bunchOfCatFacts;
    NSLog(@"%@", self.facts);
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneTapped:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
     
    }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.facts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SavedCatFactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedFacts" forIndexPath:indexPath];
    
    NSString *savedFact = [self objectForIndexPath:indexPath];
    cell.savedCatFactLabel.text = savedFact;
    
    return cell;
}



- (NSString *)objectForIndexPath:(NSIndexPath *)indexPath {
    
    return self.facts[indexPath.row];
    
}



@end
