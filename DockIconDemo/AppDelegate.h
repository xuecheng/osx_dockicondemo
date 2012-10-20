//
//  AppDelegate.h
//  DockIconDemo
//
//  Created by evan on 12-10-20.
//  Copyright (c) 2012年 acheng. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class DockIconContentView;

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (assign) IBOutlet NSWindow *window;
@property (assign) float p;
@property (assign) int num;

@end
