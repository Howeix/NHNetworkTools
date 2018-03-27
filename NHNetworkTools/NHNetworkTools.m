//
//  NHNetworkTools.m
//  Demo0327
//
//  Created by Jerry Huang on 2018/3/27.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "NHNetworkTools.h"

static NHNetworkTools *_nhNetworkTools;

@interface NHNetworkTools()
//** allValue */
@property (strong, nonatomic) NSMutableString *allValue;

@end

@implementation NHNetworkTools

-(NSMutableString *)allValue{
    if (!_allValue) {
        _allValue = [NSMutableString string];
    }
    return _allValue;
}

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

-(void)Get:(NSString *)url withParameter:(NSMutableDictionary *)parameter forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail{
        NSInteger i = 1;
        for (NSString *key in parameter) {
            NSString *value = [NSString stringWithFormat:@"%@=%@&",key,parameter[key]];
            //设置如果是最后一次遍历 那就移除最后的&符号
            if (i == parameter.count) {
                value = [value substringToIndex:[value length] - 1];
            }
            [self.allValue appendString:value];
            i++;
        }
    [[[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",url,_allValue]]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            fail(error);
            return;
        }else{
            NSLog(@"URL地址有误");
        };
        success([NSJSONSerialization JSONObjectWithData:data options:0 error:nil]);
    }] resume];
}


//-(void)sendGetRequest:(NSURLRequest *)request forSuccess:(void(^)(NSDictionary *dict))success forFailure:(void(^)(NSError *error))fail{
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error) {
//            fail(error);
//            return;
//        }else{
//            NSLog(@"URL地址有误");
//        };
//        success([NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
//    }];
//    [task resume];
//}

+(NSURLRequest *)networkToolsWithRequestString:(NSString *)str{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
}


@end
