//
//  ToDoItem.h
//  ToDoList
//
//  Created by Apprentice on 8/14/14.
//  Copyright (c) 2014 Farheen Malik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
