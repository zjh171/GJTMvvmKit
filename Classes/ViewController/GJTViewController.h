//
//  GJTViewController.h
//  GJTMvvmKit
//
//  Created by kyson on 2021/4/14.
//

#import <UIKit/UIKit.h>
#import "GJTViewControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface UIViewController (GJTViewController)

@end

@interface GJTViewController : UIViewController<GJTViewControllerProtocol>


-(void) showLoading;

-(void) hideLoading;

@end

NS_ASSUME_NONNULL_END
