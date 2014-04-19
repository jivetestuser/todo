//
//  StrikethroughLabel.m
//  Todo
//
//  Created by Prashanth Govindaraj on 4/19/14.
//  Copyright (c) 2014 Prashanth Govindaraj. All rights reserved.
//

#import "StrikethroughLabel.h"
#import <QuartzCore/QuartzCore.h>

const float STRIKEOUT_THICKNESS = 2.0f;

@interface StrikethroughLabel ()
@property (nonatomic, strong) CALayer *strikethroughLayer;
@end

@implementation StrikethroughLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _strikethroughLayer = [CALayer layer];
        _strikethroughLayer.backgroundColor = [[UIColor whiteColor] CGColor];
        _strikethroughLayer.hidden = YES;
        [self.layer addSublayer:_strikethroughLayer];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self resizeStrikeThrough];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self resizeStrikeThrough];
}

- (void)resizeStrikeThrough
{
    NSDictionary *attributes = [[NSDictionary alloc]initWithObjectsAndKeys:self.font, @"font", nil];
    CGSize textSize = [self.text sizeWithAttributes:attributes];
    _strikethroughLayer.frame = CGRectMake(0, self.bounds.size.height/2,
                                           textSize.width, STRIKEOUT_THICKNESS);
}

#pragma mark -
#pragma mark - property setter

- (void)setStrikethrough:(BOOL)strikethrough
{
    _strikethrough = strikethrough;
    _strikethroughLayer.hidden = !strikethrough;
}

@end
