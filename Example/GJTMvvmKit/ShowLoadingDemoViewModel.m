//
//  ShowLoadingDemoViewModel.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/4/18.
//

#import "ShowLoadingDemoViewModel.h"

@implementation ShowLoadingDemoViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"viewcontroller";

        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.loading = YES;
            NSLog(@"耗时任务开始，展示 Loading");
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.loading = NO;
                NSLog(@"耗时任务结束,隐藏 Loading");
            });
        });
    }
    return self;
}
@end
