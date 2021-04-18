//
//  GJTViewModelLoadingProtocol.h
//  Pods
//
//  Created by kyson on 2021/4/16.
//


#import <Foundation/Foundation.h>


@protocol GJTViewModelLoadingProtocol <NSObject>

@property (nonatomic,assign,getter=isLoading) BOOL loading;


@end
