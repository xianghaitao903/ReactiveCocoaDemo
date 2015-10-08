//
//  LoginService.h
//  ReactiveCocoaDemo
//
//  Created by 向海涛 on 15/10/8.
//  Copyright © 2015年 向海涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginService : NSObject

+ (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(void (^)(BOOL sucess))complete;

@end
