//
//  DockIconContentView.m
//  DockIconDemo
//
//  Created by evan on 12-10-20.
//  Copyright (c) 2012年 acheng. All rights reserved.
//

#import "DockIconContentView.h"



#define toRadians(x) ((x)*M_PI / 180.0)
#define toDegrees(x) ((x)*180.0 / M_PI)
#define dockProportion (3/8.0)
#define dockIndentation 2



@implementation DockIconContentView
@synthesize progress;
@synthesize num;
@synthesize logoImage;



- (id)initWithImage:(NSImage*)theImage Progress:(CGFloat)theProgress Num:(NSInteger)theNum
{
	
	self = [super init];
	
	if (self) {
		
		self.logoImage = theImage;
		
		self.progress = theProgress;
		
		self.num = theNum;
		
	}
	
	
	
	return self;
	
}

- (void)drawRect:(NSRect)dirtyRect
{
	
	
	
		//绘制logo
	
	[self.logoImage drawInRect:dirtyRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0 respectFlipped:YES hints:nil];
	
	
	
	CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
	
	CGContextSetShouldAntialias(ctx, YES);
	
	
	
	if (self.num > 0) {
		
			//绘制圆饼背景
		
		[self drawRoundWithContext:ctx];
		
		
		
			//绘制进度圆饼
		
		[self drawOvalWithContext:ctx Progress:self.progress];
		
		
		
			//绘制进度圆饼2
		
			//[self drawOval2WithContext:ctx Progress:self.progress];
		
		
		
			//绘制数字
		
		[self drawNumWithContext:ctx Num:self.num];
		
		
		
			//绘制圆环
		
		[self drawRingWithContext:ctx];
		
	}
	
}

-(void)drawRoundWithContext:(CGContextRef)ctx
{
	
	CGPoint center = CGPointMake(self.frame.size.width-self.frame.size.width *dockProportion/2.0 -dockIndentation,  self.frame.size.height *dockProportion/2.0 +dockIndentation);
	
	CGFloat delta = toRadians(360);
	
	CGFloat innerRadius = 0;
	
	CGFloat outerRadius = self.frame.size.width *dockProportion/2.0;
	
	CGContextSetRGBFillColor(ctx, 0.9, 0.9, 0.9, 1);
	
	CGContextSetLineWidth(ctx, 1);
	
	CGContextSetLineCap(ctx, kCGLineCapRound);
	
	CGContextSetAllowsAntialiasing(ctx, YES);
	
	CGMutablePathRef path = CGPathCreateMutable();
	
	CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, (M_PI / 2), delta);
	
	CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, (M_PI / 2)-delta , delta);
	
	CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
	
	CGContextAddPath(ctx, path);
	
	CGContextFillPath(ctx);
	
	CFRelease(path);
	
}

-(void)drawOvalWithContext:(CGContextRef)ctx Progress:(CGFloat)theProgress
{
	
	CGPoint center = CGPointMake(self.frame.size.width-self.frame.size.width *dockProportion/2.0 -dockIndentation,  self.frame.size.height *dockProportion/2.0 +dockIndentation);
	
	CGFloat delta = toRadians(360 * theProgress);
	
	CGFloat innerRadius = 0;
	
	CGFloat outerRadius = self.frame.size.width *dockProportion/2.0;
	
	CGContextSetRGBFillColor(ctx, 0.59,0.85, 0.45, 1);
	
	CGContextSetLineWidth(ctx, 1);
	
	CGContextSetLineCap(ctx, kCGLineCapRound);
	
	CGContextSetAllowsAntialiasing(ctx, YES);
	
	CGMutablePathRef path = CGPathCreateMutable();
	
	CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, (M_PI / 2), delta);
	
	CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, (M_PI / 2)-delta , delta);
	
	CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
	
	CGContextAddPath(ctx, path);
	
	CGContextFillPath(ctx);
	
	CFRelease(path);
	
}

-(void)drawOval2WithContext:(CGContextRef)ctx Progress:(CGFloat)theProgress
{
	
	CGPoint center = CGPointMake(self.frame.size.width-self.frame.size.width *dockProportion/2.0 -dockIndentation,  self.frame.size.height *dockProportion/2.0 +dockIndentation);
	
	CGFloat delta = toRadians(360 * theProgress);
	
	CGFloat innerRadius = 0;
	
	CGFloat outerRadius = self.frame.size.width *dockProportion/4.0;
	
	CGContextSetRGBFillColor(ctx, 0, 0, 0, 0.4);
	
	CGContextSetLineWidth(ctx, 1);
	
	CGContextSetLineCap(ctx, kCGLineCapRound);
	
	CGContextSetAllowsAntialiasing(ctx, YES);
	
	CGMutablePathRef path = CGPathCreateMutable();
	
	CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, (M_PI / 2), delta);
	
	CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, (M_PI / 2)-delta , delta);
	
	CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
	
	CGContextAddPath(ctx, path);
	
	CGContextFillPath(ctx);
	
	CFRelease(path);
	
}

-(void)drawNumWithContext:(CGContextRef)ctx Num:(NSInteger)theNum
{
	
	
	
	CGRect textFieldRect = CGRectMake(self.frame.size.width-self.frame.size.width *dockProportion -dockIndentation,(self.frame.size.width *dockProportion-32)/2.0 +dockIndentation,self.frame.size.width *dockProportion,32);
	
	NSString *theString = [NSString stringWithFormat:@"%ld",((theNum > 0)?theNum:0)];
	
	
	
	NSMutableDictionary *theAttributes=[[NSMutableDictionary alloc] init];
	
	
	
	NSMutableParagraphStyle *style = (NSMutableParagraphStyle*)[[NSMutableParagraphStyle alloc]init];
	
	[style setAlignment:NSCenterTextAlignment];
	
	[theAttributes setObject:style forKey:NSParagraphStyleAttributeName];
	
	
	
	[theAttributes setObject:[NSFont fontWithName:@"Helvetica-Bold" size:24] forKey:NSFontAttributeName];
	
	[theAttributes setObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
	
	[theString drawInRect:textFieldRect withAttributes:theAttributes];
	
	
	
	[style release];
	
	[theAttributes release];
	
}

-(void)drawRingWithContext:(CGContextRef)ctx
{
	
	CGSize myShadowOffset = CGSizeMake (0,-1);
	
	CGContextSetShadow (ctx, myShadowOffset, 2);
	
	
	
	CGContextSetLineWidth(ctx, 2.0);
	
	CGContextSetStrokeColorWithColor(ctx,CGColorCreateGenericRGB(0.9, 0.9, 0.9, 1.0));
	
	CGRect rectangle = CGRectMake(self.frame.size.width-self.frame.size.width *dockProportion-1 -dockIndentation,1 +dockIndentation,self.frame.size.width *dockProportion,self.frame.size.width *dockProportion-1);
	
	CGContextAddEllipseInRect(ctx, rectangle);
	
	CGContextStrokePath(ctx);
	
}

@end


