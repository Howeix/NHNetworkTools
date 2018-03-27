//
//  ViewController.m
//  NHNetworkTools
//
//  Created by Jerry Huang on 2018/3/27.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "ViewController.h"
#import "NHNetworkTools.h"

#define api @"http://api.budejie.com/api/api_open.php"

@interface ViewController ()
//** name */
@property (strong, nonatomic) NSMutableString *allValue;
@end
//static NSMutableString *_allValue;


@implementation ViewController

//-(NSMutableString *)allValue{
//    if (!_allValue) {
//        _allValue = [NSMutableString string];
//    }
//    return _allValue;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NHNetworkTools *tools = [NHNetworkTools shareNetworkTools];
    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"a"] = @"list";
    para[@"c"] = @"data";
    [tools Get:api withParameter:para forSuccess:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    } forFailure:^(NSError *error) {
        
    }];
}



@end
