//
//  BNRListViewController.m
//  Nerdfeed
//
//  Created by Joe Conway on 2/25/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRListViewController.h"
#import "BNRRSSFeed.h"
#import "BNRRSSItem.h"
#import "BNRWebViewController.h"
#import "BNRFeedStore.h"

@interface BNRListViewController ()

@property (nonatomic, strong) BNRRSSFeed *feed;

- (void)fetchFeed;

@end

@implementation BNRListViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self) {
        [self fetchFeed];
    }
    return self;
}

- (void)fetchFeed
{

    [[BNRFeedStore sharedStore] fetchRSSFeedWithCompletion:^(BNRRSSFeed *obj, NSError *err) {
         if(!err){
             [self setFeed:obj];
         }
         
         else{
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error" message:[err localizedDescription] delegate:nil cancelButtonTitle:@"Whatevs" otherButtonTitles:nil, nil];
             
                [av show];
             
            }
     }];

 
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if( ![self splitViewController]){
        [[self navigationController] pushViewController:[self webViewController] animated:YES];
    }
    
    
    BNRRSSItem *i = [[[self feed] items] objectAtIndex:[indexPath row]];
    [[self webViewController] setLink:[i link]];

}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[self feed] items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!c) {
        c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    BNRRSSItem *i = [[[self feed] items] objectAtIndex:[indexPath row]];
    [[c textLabel] setText:[i title]];
    
    return c;
}

/*
 
 - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
 {
 [[self jsonData] appendData:data];
 }
 
 - (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
 {
 [self setConnection:nil];
 [self setJsonData:nil];
 
 NSString *errString = [error localizedDescription];
 UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
 message:errString delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil];
 [av show];
 }
 
 - (void)connectionDidFinishLoading:(NSURLConnection *)connection
 {
 NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[self jsonData]
 options:0
 error:nil];
 
 BNRRSSFeed *c = [[BNRRSSFeed alloc] init];
 [c readFromJSONObject:jsonObject];
 [self setFeed:c];
 
 NSLog(@"%@", [[self feed] title]);
 
 [[self tableView] reloadData];
 }
 */

@end
