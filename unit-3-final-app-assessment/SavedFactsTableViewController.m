//
//  SavedFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Daniel Distant on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SavedFactsTableViewController.h"

@interface SavedFactsTableViewController ()

@property (nonatomic) NSMutableArray *savedFacts;

@end

@implementation SavedFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.savedFacts = [[NSMutableArray alloc] init];
    
    [self loadSavedFacts];

}

-(void) loadSavedFacts {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"factsArray"] != nil) {
        
        NSMutableArray *userDefaultsArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"factsArray"] mutableCopy];
        
        self.savedFacts = userDefaultsArray;
        
        [self.tableView reloadData];
     
    } else {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Error" message:@"No facts saved!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           
                                                           [self dismissViewControllerAnimated:YES completion:nil];
                                                       }];
        
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.savedFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.savedFacts[indexPath.row];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSMutableArray *factsArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"factsArray"] mutableCopy];
        
        [factsArray removeObjectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setObject:factsArray forKey:@"factsArray"];
        
        self.savedFacts = factsArray;
        
        [self loadSavedFacts];
    }   
}


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

@end
