//
//  DockIconContentView.h
//  DockIconDemo
//
//  Created by evan on 12-10-20.
//  Copyright (c) 2012年 acheng. All rights reserved.
//

@interface DockIconContentView : NSView

@property (assign) float progress;

@property (assign) NSInteger num;

@property (retain) NSImage *logoImage;

- (id)initWithImage:(NSImage*)theImage Progress:(CGFloat)theProgress Num:(NSInteger)theNum;

@end
