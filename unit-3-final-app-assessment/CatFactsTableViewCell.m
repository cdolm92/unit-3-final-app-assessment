//
//  CatFactsTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Christella on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CatFactsTableViewCell.h"
#import "C4QSavedCatFactsTableViewController.h"
#import "C4QCatFactsTableViewController.h"

@implementation CatFactsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)saveTheCatFact:(id)sender {
    
    // get the array from NSUserDefaults
    
  //  NSMutableArray *factsOnCats = [[[NSUserDefaults standardUserDefaults]arrayForKey:@"Saved-Fact"]mutableCopy];
    
    self.factsOnCats = [[[NSUserDefaults standardUserDefaults]arrayForKey:@"Saved-Fact"]mutableCopy];

    
    // if the array is nil, create a new array
    if (self.factsOnCats == nil) {
        
        self.factsOnCats = [[NSMutableArray alloc]init];
    }
        
        
    [self.factsOnCats addObject:self.catFact.text];
    
    [[NSUserDefaults standardUserDefaults ]setObject:self.factsOnCats forKey:@"Saved-Fact"];
    
    
    [[NSUserDefaults standardUserDefaults] synchronize];

    // add cat fact into the array
    // save the array back into NSUserDefaults
    
    NSLog(@"%@", self.factsOnCats);
    
    NSLog(@"%lu", (unsigned long)self.factsOnCats);

    
  
}

//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//        
//        
//        
//        C4QCatFactsTableViewController *passArray = segue.destinationViewController;
//        passArray.selectedFact= self.factsOnCats;
//    NSLog(@"FACTS2 %@", passArray.selectedFact);
//    
//        
//    }
//
//








@end
