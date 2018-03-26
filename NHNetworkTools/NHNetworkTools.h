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

+(NSURLRequest *)networkToolsWithRequestString:(NSString *)str;

-(void)sendGetRequest:(NSURLRequest *)request forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail;

-(void)sendGetRequest:(NSURLRequest *)request withParameter:(NSString *)parameter forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail;

@end
