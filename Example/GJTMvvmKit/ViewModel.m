//
//  ViewModel.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/4/16.
//

#import "ViewModel.h"

@implementation ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"导航栏标题";
        
        [self.didBecomeActiveSignal subscribeNext:^(id  _Nullable x) {
            NSLog(@"view model did become active!");
        }];
        
        
    }
    return self;
}


@end
