//
//  NHNetworkTools.m
//  Demo0327
//
//  Created by Jerry Huang on 2018/3/27.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "NHNetworkTools.h"

static NHNetworkTools *_nhNetworkTools;

@implementation NHNetworkTools

+(instancetype)shareNetworkTools{
    return [[self alloc] init];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _nhNetworkTools = [super allocWithZone:zone];
    });
    return _nhNetworkTools;
}

-(void)sendGetRequest:(NSURLRequest *)request withParameter:(NSMutableDictionary *)parameter forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail{
    
    for (NSString *key in parameter) {
        NSLog(@"%@",key);
    }
    
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            fail(error);
            return;
        }else{
            NSLog(@"URL地址有误");
        };
        success([NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }] resume];
}


-(void)sendGetRequest:(NSURLRequest *)request forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail{
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            fail(error);
            return;
        }else{
            NSLog(@"URL地址有误");
        };
        success([NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    [task resume];
}

+(NSURLRequest *)networkToolsWithRequestString:(NSString *)str{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
}


@end
