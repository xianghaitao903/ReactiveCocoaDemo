//
//  LoginService.m
//  ReactiveCocoaDemo
//
//  Created by 向海涛 on 15/10/8.
//  Copyright © 2015年 向海涛. All rights reserved.
//

#import "LoginService.h"
#import "AFNetworking.h"

@implementation LoginService

+ (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(void (^)(BOOL success))complete{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",nil];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:@"https://www.baidu.com" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        complete(YES);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        complete(NO);
    }];
}

@end
