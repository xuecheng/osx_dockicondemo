//
//  AppDelegate.m
//  DockIconDemo
//
//  Created by evan on 12-10-20.
//  Copyright (c) 2012年 acheng. All rights reserved.
//

#import "AppDelegate.h"
#import "DockIconContentView.h"



@implementation AppDelegate
@synthesize p;
@synthesize num;

- (void)dealloc
{	
	[super dealloc];	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	
	[NSApp setApplicationIconImage:[NSImage imageNamed:@"icon"]];
	
	p=0.0;
	num = 10;
	
	NSTimer *timer;
	
	timer = [NSTimer scheduledTimerWithTimeInterval: 0.2
		 
						 target: self
		 
					       selector: @selector(handleTimer:)
		 
					       userInfo: nil
		 
						repeats: YES];
	
}

- (void) handleTimer: (NSTimer *) timer
{
	
	p+=0.01;
	
	if (p>1) {
		
		p=0.0;
		num--;
		if (num<=0) {
			num = 12;
		}
		
	}
	
		//在这里进行处理
	
	DockIconContentView *dock = [[DockIconContentView alloc]initWithImage:[NSImage imageNamed:@"icon"] Progress:p Num:num];
	
	[[NSApp dockTile] setContentView:dock];
	
	[dock release];
	
	[[NSApp dockTile]display];
	
}

@end
