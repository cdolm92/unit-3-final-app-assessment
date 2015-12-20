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

@property (weak, nonatomic) IBOutlet UIImageView *giphyImage;
@property (nonatomic) NSMutableArray *imageUrls;

@end

@implementation C4QCatFactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    NSSet *contentTypes = [NSSet setWithObjects: @"text/html", @"text/plain", @"audio/wav", @"application/javascript", @"application/json", nil];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = contentTypes;
    
    [manager GET:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"
      parameters:nil
       progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
             NSArray *data = [responseObject objectForKey:@"data"];
            
            self.imageUrls = [[NSMutableArray alloc]init];
             
            for(NSDictionary * images in data) {
                
                NSDictionary *image = [images objectForKey:@"images"];
                
                NSDictionary *catImage = [image objectForKey:@"fixed_height_still"];
                
                NSString *catURLImage = [catImage objectForKey:@"url"];
                
                [self.imageUrls addObject: catURLImage];

                
               
                
               
                
            }

         
            
            
             int random = arc4random_uniform((int)self.imageUrls.count);
              NSString *ImageURL = [self.imageUrls objectAtIndex:random];
              NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
              self.giphyImage.image = [UIImage imageWithData:imageData];
            
                NSLog(@"%@", ImageURL);
             }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
             
             NSLog(@"%@", error.userInfo);
         }];
    

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
