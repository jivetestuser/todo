//
//  ToDoItem.m
//  Todo
//
//  Created by Prashanth Govindaraj on 4/19/14.
//  Copyright (c) 2014 Prashanth Govindaraj. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

- (id)initWithText:(NSString*)text {
    if (self = [super init]) {
        self.text = text;
    }
    return self;
}

+ (id)toDoItemWithText:(NSString *)text {
    return [[ToDoItem alloc] initWithText:text];
}

@end
