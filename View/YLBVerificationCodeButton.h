//
//  YLBValidcodeButton.h
//  RRHua
//
//  Created by liyang on 16/9/28.
//  Copyright © 2016年 yangxiangwei. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@interface YLBVerificationCodeButton : UIButton

/**
 开始倒计时

 @param second 开始倒计时的秒数 比如:200
 */
- (void)efStartTimingWithSecond:(int)second;

/**
 设置默认标题 默认为 获取验证码

 @param buttonTitle 标题
 */
-(void)efSetOriginButtonTitle:(NSString *)buttonTitle;

@end
