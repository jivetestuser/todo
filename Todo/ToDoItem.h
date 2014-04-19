//
//  ToDoItem.h
//  Todo
//
//  Created by Prashanth Govindaraj on 4/19/14.
//  Copyright (c) 2014 Prashanth Govindaraj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL completed;

+ (id)toDoItemWithText:(NSString*)text;
- (id)initWithText:(NSString*)text;

@end
