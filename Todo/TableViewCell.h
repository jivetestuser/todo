//
//  TableViewCell.h
//  Todo
//
//  Created by Prashanth Govindaraj on 4/19/14.
//  Copyright (c) 2014 Prashanth Govindaraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellDelegate.h"
@class ToDoItem;

@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) ToDoItem *todoItem;
@property (nonatomic, assign) id<TableViewCellDelegate> delegate;
@end
