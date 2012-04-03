//
//  JpMsmcTidcroundswitchSwitch.m
//  tidcroundswitch
//
//  Created by KATAOKA Atsushi on 12/04/03.
//  Copyright (c) MARSHMALLOW MACHINE. All rights reserved.
//

#import "JpMsmcTidcroundswitchSwitch.h"

@implementation JpMsmcTidcroundswitchSwitch

- (DCRoundSwitch *)dcRoundSwitch
{
    if(dcRoundSwitch == nil){
        dcRoundSwitch = [[DCRoundSwitch alloc] initWithFrame:self.frame];
        
        [dcRoundSwitch addTarget:self 
                          action:@selector(valueChanged:) 
                forControlEvents:UIControlEventValueChanged];
        [self addSubview:dcRoundSwitch];
    }
    return dcRoundSwitch;
}

- (void)setOnText_:(id)newValue
{
    ENSURE_SINGLE_ARG(newValue, NSString);
    [[self dcRoundSwitch] setOnText:newValue];
}

- (void)setOffText_:(id)newValue
{
    ENSURE_SINGLE_ARG(newValue, NSString);
    [[self dcRoundSwitch] setOffText:newValue];
}

- (id)value_
{
    return NUMBOOL([[self dcRoundSwitch] isOn]);
}

- (void)setValue_:(id)newValue
{
    ENSURE_SINGLE_ARG(newValue, NSNumber);
    [[self dcRoundSwitch] setOn:[(NSNumber *)newValue boolValue]];
}

- (void)setOnTintColor_:(id)newValue
{
    TiColor *color = [TiUtils colorValue:newValue];
    if(color == nil){
        NSLog(@"[WARN] onTintColor value is invalid.");
        return;
    }
    [[self dcRoundSwitch] setOnTintColor:[color _color]];
}

- (void)valueChanged:(id)sender
{
    if(self.proxy != nil){
        NSDictionary *args = [NSDictionary dictionaryWithObjectsAndKeys:[self value_], @"value", nil];
        [self.proxy fireEvent:@"changed" withObject:args];
    }
}

- (void)dealloc
{
    RELEASE_TO_NIL(dcRoundSwitch);
    [super dealloc];
}


#pragma mark -
#pragma mark View lifecycles

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    [TiUtils setView:[self dcRoundSwitch] positionRect:bounds];
    [[self dcRoundSwitch] setFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
}

@end
