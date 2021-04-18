//
//  GJTViewControllerProtocol.h
//  Pods
//
//  Created by kyson on 2021/4/16.
//


#import <Foundation/Foundation.h>
#import "GJTViewModelProtocol.h"
#import "GJTViewLoadingProtocol.h"


#ifndef GJTViewControllerProtocol_h
#define GJTViewControllerProtocol_h




@protocol GJTViewControllerProtocol <GJTViewLoadingProtocol>

@required

- (instancetype _Nullable ) initWithViewModel:(__kindof id<GJTViewModelProtocol>_Nullable) viewModel;

@property (nullable,nonatomic,readonly,strong) __kindof id<GJTViewModelProtocol> viewModel;

@end


#endif /* GJTViewControllerProtocol_h */
