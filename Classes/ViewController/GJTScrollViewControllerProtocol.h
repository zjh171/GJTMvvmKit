//
//  GJTScrollViewControllerProtocol.h
//  Pods
//
//  Created by kyson on 2021/4/16.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import "GJTViewControllerProtocol.h"


@protocol GJTScrollViewControllerProtocol <GJTViewControllerProtocol>

@required
@property (nonatomic,nullable,weak) __kindof UIScrollView *scrollView;

@property (nonatomic, assign) BOOL needLoadingHeader;

@optional

- (MJRefreshHeader *_Nullable)customLoadingHeader:(MJRefreshComponentAction _Nullable ) refreshBlock;

@end
