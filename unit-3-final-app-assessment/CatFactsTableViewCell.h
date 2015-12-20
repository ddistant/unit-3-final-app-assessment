//
//  CatFactsTableViewCell.h
//  unit-3-final-app-assessment
//
//  Created by Daniel Distant on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CatFactsTableViewCellDelegate <NSObject>

-(void)didSaveCatFact:(NSString *)fact;

@end


@interface CatFactsTableViewCell : UITableViewCell <CatFactsTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *catFactsLabel;

@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;

@property (weak, nonatomic) id<CatFactsTableViewCellDelegate>delegate;

@end
