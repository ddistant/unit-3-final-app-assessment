//
//  CatFactsTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Daniel Distant on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CatFactsTableViewCell.h"

@implementation CatFactsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self addSubview:self.buttonPlus];
}

- (IBAction)buttonTapped:(UIButton *)sender {
    [self didSaveCatFact:self.catFactsLabel.text];
    
    self.saved = YES;
}

-(void)didSaveCatFact:(NSString *)fact {
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"factsArray"] != nil) {
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        NSMutableArray *userDefaultsArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"factsArray"];
        
        [array addObjectsFromArray:userDefaultsArray];
        
        [array addObject:fact];
        
        [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"factsArray"];
        
    } else {
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:fact, nil];
        
        [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"factsArray"];
    }
    
    [self.delegate didSaveCatFact:fact];
}
@end
