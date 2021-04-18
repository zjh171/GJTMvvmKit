//
//  GJTViewModelProtocol.h
//  Pods
//
//  Created by kyson on 2021/4/16.
//

#import <Foundation/Foundation.h>
#import "GJTViewModelBecomeActiveProtocol.h"
#import "GJTViewModelLoadingProtocol.h"

#ifndef GJTViewModelProtocol_h
#define GJTViewModelProtocol_h



@protocol GJTViewModelLoadingProtocol;
@protocol GJTViewModelBecomeActiveProtocol;



@protocol GJTViewModelProtocol <GJTViewModelLoadingProtocol,GJTViewModelBecomeActiveProtocol>

@required

@property (nonatomic, copy,nullable) NSString *title;


@end



#endif /* GJTViewModelProtocol_h */
