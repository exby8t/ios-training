//
//  BNRListViewController.m
//  NerdFeed
//
//  Created by Jonathan Arp on 7/25/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "BNRListViewController.h"
#import "BNRRSSFeed.h"
#import "BNRRSSItem.h"
@interface BNRListViewController() <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *jsonData;
@property (nonatomic, strong) BNRRSSFeed *feed;

-(void) fetchFeed;

@end

@implementation BNRListViewController

-(id)initWithStyle:(UITableViewStyle)style{
    
    self = [super initWithStyle:style];
    
    if(self){
        [self fetchFeed];
    }
    
    return self;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [[self jsonData] appendData: data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)con{
    //NSString *jsonCheck = [[NSString alloc] initWithData:[self jsonData] encoding:NSUTF8StringEncoding];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[self jsonData] options:0 error:nil];
    NSLog(@"loaded");
    BNRRSSFeed *c = [[BNRRSSFeed alloc] init];
    [c readFromJSONObject:jsonObject];
    NSLog(@"loaded:: %@ ", );
    [self setFeed:c];
    [[self tableView] reloadData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [self setConnection:nil];
    [self setJsonData:nil];
    NSString *errString = [error localizedDescription];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Rhut-Roh" message:errString delegate:nil cancelButtonTitle:@"fine" otherButtonTitles:nil, nil];
    
    [av show];
}

-(void)fetchFeed{
    [self setJsonData:[[NSMutableData alloc]init] ];
    NSString *requestString = @"http://itunes.apple.com/us/rss/topsongs/limit=10/json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLConnection *c = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
    
    [self setConnection: c];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[self feed] items] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *c = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!c){
        c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    BNRRSSItem *i = [[[self feed] items] objectAtIndex:[indexPath row]];
    [[c textLabel] setText:[i title]];
 
 return c;
}
@end
