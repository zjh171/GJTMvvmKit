//
//  GJTViewLoadingProtocol.h
//  Pods
//
//  Created by kyson on 2021/4/18.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef GJTViewLoadingProtocol_h
#define GJTViewLoadingProtocol_h


@protocol GJTViewLoadingProtocol <NSObject>


@optional

-(UIView *) customLoadingView;
 

@end



#endif /* GJTViewLoadingProtocol_h */
