//
//  CustomTextView.m
//  TextViewDemo
//
//  Created by taotao on 6/6/16.
//  Copyright © 2016 taotao. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

#pragma mark - override methods
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        NSLog(@"initWithFrame ");
    }
    return self;
}

- (void)awakeFromNib
{
    NSLog(@"awake from nib  ");
    self.placeholder = @"hello ";
    self.holderColor = [UIColor redColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleChanged) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)drawRect:(CGRect)rect
{
    if ([self hasText]) {
        return;
    }else{
        if (self.placeholder != nil) {
            CGFloat width = rect.size.width;
            CGFloat height = rect.size.height;
            CGRect placerRect = CGRectMake(5, 8, width, height);
            UIColor *holderColor = self.holderColor == nil?[UIColor grayColor]:self.holderColor;
            NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:holderColor,NSForegroundColorAttributeName, nil];
            [self.placeholder drawInRect:placerRect withAttributes:attributes];
        }else{
            return;
        }
    }
}


#pragma mark -  setter and getter methods 
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    [self setNeedsDisplay];
}

- (void)setHolderColor:(UIColor *)holderColor
{
    _holderColor = holderColor;
    [self setNeedsDisplay];
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsDisplay];
}

#pragma mark - selector 
- (void)titleChanged
{
    [self setNeedsDisplay];
}





@end
