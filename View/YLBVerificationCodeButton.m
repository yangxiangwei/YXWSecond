//
//  YLBValidcodeButton.m
//  RRHua
//
//  Created by liyang on 16/9/28.
//  Copyright © 2016年 yangxiangwei. All rights reserved.
//

#import "YLBVerificationCodeButton.h"
#import "UIColor+XJ.h"
@interface YLBVerificationCodeButton ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int timeOut;

@property(nonatomic,copy)NSString *originTitle;

- (void)stopTimer;

@end

@implementation YLBVerificationCodeButton

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.originTitle = @"获取验证码";
        
        [self setup];
    }
    return self;
}

-(void)efSetOriginButtonTitle:(NSString *)buttonTitle{
    if (buttonTitle.length >0) {
        self.originTitle = buttonTitle;
        [self setTitle:buttonTitle forState:UIControlStateNormal];
    }
}

- (void)setup
{
    self.backgroundColor = [UIColor whiteColor];
 
    self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self setTitle:self.originTitle forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithR:17 green:145 blue:252] forState:UIControlStateNormal];
}

-(void)efStartTimingWithSecond:(int)second
{
    self.timeOut = second;
    self.enabled = NO;
    
    NSString *strTime = [NSString stringWithFormat:@"%i秒后重发",
                         self.timeOut];
    [self setTitle:strTime forState:UIControlStateDisabled];
    
    self.timeOut--;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(timing)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)timing
{
    if (self.timeOut>0)
    {
        self.enabled = NO;
        
        NSString *strTime = strTime = [NSString stringWithFormat:@"%i秒后重发",
                                       self.timeOut];
        [self setTitle:strTime forState:UIControlStateDisabled];
        
        self.timeOut -- ;
        
    }
    else
    {
        [self stopTimer];
        
        self.enabled = YES;
        [self setTitle:self.originTitle forState:UIControlStateNormal];
    }
}

-(void)stopTimer
{
    [self.timer invalidate];
}

@end
