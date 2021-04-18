//
//  GJTScrollViewController.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/4/16.
//

#import "GJTScrollViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <MJRefresh/MJRefresh.h>

@interface GJTScrollViewController ()


@property (nullable,nonatomic,weak) MJRefreshHeader *loadingHeader;
@property (nullable,nonatomic,weak) MJRefreshHeader *loadingFooter;

@end

@implementation GJTScrollViewController

@synthesize needLoadingHeader = _needLoadingHeader;
@synthesize scrollView = _scrollView;

- (instancetype)initWithViewModel:(__kindof id<GJTViewModelProtocol>)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        [self subscribeNeedLoadingSignal];
        [self subscribeLoadingSignal];
    }
    return self;
}

-(void) subscribeLoadingSignal {
    @weakify(self);
    [[[RACObserve(self.viewModel, loading) skip:1] filter:^BOOL(id  _Nullable value) {
        @strongify(self);
            return nil != self.scrollView;
       
    }] subscribeNext:^(id x) {
        @strongify(self);

        if (self.needLoadingHeader) {
            if ([x boolValue]) {
                if (!self.loadingHeader.isRefreshing) {
                    [self performSelector:@selector(showLoading)];
                }
            } else {
                if (self.loadingHeader.isRefreshing) {
                    [self.loadingHeader endRefreshing];
                } else {
                    [self performSelector:@selector(hideLoading)];
                }
            }
        } else {
            if ([x boolValue]) {
                [self performSelector:@selector(showLoading)];
            } else {
                [self performSelector:@selector(hideLoading)];
            }
        }
    }];
}


-(void) subscribeNeedLoadingSignal {

    @weakify(self);
    [[RACObserve(self, needLoadingHeader) filter:^BOOL(id  _Nullable value) {
            @strongify(self);
            return self.scrollView != nil;
        }] subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            if ([x boolValue]) {
                if (nil == self.loadingHeader) {
                    MJRefreshComponentAction refreshingBlock = ^{
                        @strongify(self);
                        self.viewModel.loading = YES;
                    };
                    if ([self respondsToSelector:@selector(customLoadingHeader:)]) {
                        self.loadingHeader = [self customLoadingHeader:refreshingBlock];
                    } else {
                        self.loadingHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
                    }
                    
                    self.scrollView.mj_header = self.loadingHeader;
                }
                
                
            } else {
                self.scrollView.mj_header = nil;
                self.loadingHeader = nil;
            }
        
    
        }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
