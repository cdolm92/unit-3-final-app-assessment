//
//  CatFactsTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Christella on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CatFactsTableViewCell.h"

@implementation CatFactsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)saveTheCatFact:(id)sender {
    
    self.factsOnCats = [[NSMutableArray alloc]init];
    
    NSString *catFacts = self.catFact.text;
    
    [self.factsOnCats addObject:catFacts];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.factsOnCats forKey:@"Saved-Fact"];
    
    NSLog(@"%@", self.factsOnCats);
    
    NSLog(@"%lu", (unsigned long)self.factsOnCats.count);
    
}







@end
