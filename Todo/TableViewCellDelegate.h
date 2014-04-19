//
//  TableViewCellDelegate.h
//  Todo
//
//  Created by Prashanth Govindaraj on 4/19/14.
//  Copyright (c) 2014 Prashanth Govindaraj. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ToDoItem;

@protocol TableViewCellDelegate <NSObject>
- (void)toDoItemDeleted:(ToDoItem*)todoItem;
@end
