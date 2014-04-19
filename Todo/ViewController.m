//
//  ViewController.m
//  Todo
//
//  Created by Prashanth Govindaraj on 4/19/14.
//  Copyright (c) 2014 Prashanth Govindaraj. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *toDoItems;
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _toDoItems = [[NSMutableArray alloc] init];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Feed the dog"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Buy milk"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Pack bags for WWDC"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Rule the web"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Buy a new iPhone"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Do your laundry"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Write a new tutorial"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Master Objective-C"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Drink less beer"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Learn to draw"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Take the car to the garage"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Learn to juggle"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //automatically creates a new cell for you if one isn’t available via the reuse pool, we need to register for the cell identifier beforehand.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark - Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _toDoItems.count;
}

#pragma mark -
#pragma mark - Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *myIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier forIndexPath:indexPath];

    int index = [indexPath row];
    ToDoItem *item = _toDoItems[index];
    
    cell.textLabel.text = item.text;
    return cell;
}



@end
