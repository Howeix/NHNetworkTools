//
//  NHNetworkTools.h
//  Demo0327
//
//  Created by Jerry Huang on 2018/3/27.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHNetworkTools : NSObject

+(instancetype)shareNetworkTools;

///传入一个字符串,返回一个NSURLRequest对象
+(NSURLRequest *)networkToolsWithRequestString:(NSString *)str;

//-(void)sendGetRequest:(NSURLRequest *)request forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail;

//-(void)Get:(NSString *)url withParameter:(NSMutableDictionary *)parameter forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail;

/**
 发送网络请求

 @param url url地址
 @param parameter 请求参数(字典)
 @param success 请求发送成功后回调
 @param fail 请求失败后回调
 */
-(void)Get:(NSString *)url withParameter:(NSMutableDictionary *)parameter forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail;

@end
