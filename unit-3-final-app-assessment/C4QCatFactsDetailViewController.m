//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsDetailViewController.h"
#import <AFNetworking/AFNetworking.h>

#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"

@interface C4QCatFactsDetailViewController () 

@property (nonatomic) NSMutableArray *catGIFs;

@end

@implementation C4QCatFactsDetailViewController

-(void)awakeFromNib {
   [self fetchGiphyData];
    self.catGIFs = [[NSMutableArray alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catFactLabel.text = self.catFact;
}

-(void)viewDidAppear:(BOOL)animated {
    NSUInteger intVal = self.catGIFs.count;
    int index = (int)intVal;
    NSInteger imageIndex = arc4random_uniform(index);
    
    NSString *urlString = self.catGIFs[imageIndex];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    self.imageView.image = image;
    self.imageView.clipsToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) fetchGiphyData {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/javascript"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    

    [manager GET:CAT_GIF_URL parameters: nil progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *GIFs = [[NSArray alloc] initWithArray:responseObject[@"data"]];
        
        for (NSDictionary *GIF in GIFs) {
            
            [self.catGIFs addObject:GIF[@"images"][@"original"][@"url"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
