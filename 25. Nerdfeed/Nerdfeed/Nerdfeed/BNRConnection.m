//
//  BNRBNRConnection.m
//  Nerdfeed
//
//  Created by Jonathan Arp on 7/26/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRConnection.h"
static NSMutableArray *sharedConnectionList = nil;

@interface BNRConnection()
@property (nonatomic, strong) NSMutableData *container;
@property (nonatomic, strong) NSURLConnection *internalConnection;


@end

@implementation BNRConnection

-(id)initWithRequest:(NSURLRequest *)req{
    self = [super init];
    if(self){
        [self setRequest:req];
    }
    
    return self;
}

-(void)start{
    [self setContainer:[[NSMutableData alloc] init]];
    [self setInternalConnection:[[NSURLConnection alloc] initWithRequest:[self request] delegate:self startImmediately:YES]];
    
    if(!sharedConnectionList)
        sharedConnectionList = [[NSMutableArray alloc] init];
    
    [sharedConnectionList addObject:self];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [[self container] appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if([self jsonRootObject]){
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[self container] options:0 error:nil];
        [[self jsonRootObject] readFromJSONObject:jsonObject];
    }
    
    if([self completionBlock]){
        [self completionBlock]([self jsonRootObject], nil);
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if([self completionBlock])
        [self completionBlock](nil, error);
    
    [sharedConnectionList removeObject:self];
}

@end
