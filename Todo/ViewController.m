//
//  ViewController.m
//  Todo
//
//  Created by Prashanth Govindaraj on 4/19/14.
//  Copyright (c) 2014 Prashanth Govindaraj. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ToDoItem.h"
#import "TableViewCellDelegate.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,TableViewCellDelegate>
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
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor blackColor];
    
    //automatically creates a new cell for you if one isn’t available via the reuse pool, we need to register for the cell identifier beforehand.
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - Cell Color

- (UIColor*)colorForIndex:(NSInteger) index
{
    NSUInteger itemCount = _toDoItems.count - 1;
    float val = ((float)index / (float)itemCount) * .7;
    return [UIColor colorWithRed:1.0 green:val blue:0.0 alpha:1.0];
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
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier forIndexPath:indexPath];
    cell.delegate = self;

    int index = [indexPath row];
    ToDoItem *item = _toDoItems[index];
    
    //cell.textLabel.text = item.text;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.todoItem = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54.0f;
}


#pragma mark -
#pragma mark - Cell Delegate

- (void)toDoItemDeleted:(id)todoItem {
    // use the UITableView to animate the removal of this row
    NSUInteger index = [_toDoItems indexOfObject:todoItem];
    [self.tableView beginUpdates];
    [_toDoItems removeObject:todoItem];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]
                          withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

@end
