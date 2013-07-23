//
//  ItemsVewController.m
//  Homepwner
//
//  Created by Jonathan Arp on 7/23/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"


@implementation ItemsViewController


-(NSInteger)tableView:(UITableView *) tv numberOfRowsInSection:(NSInteger)section{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *) tv numberOfSections:(NSInteger)section{
    NSLog(@"no of sections got called");
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"UITableViewCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = [items objectAtIndex:[indexPath row]];
    [[cell textLabel] setText: [item itemName]];
    return cell;
}

-(id) init {
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if(self){
        for ( int i = 0; i<5; i++){
            [[BNRItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

-(id) initWithStyle:(UITableViewStyle)style{
    return [self init];
}
@end
