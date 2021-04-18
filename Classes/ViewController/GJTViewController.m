//
//  GJTViewController.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/4/14.
//

#import "GJTViewController.h"
#import "GJTViewModel.h"
#import <GJTAdditionKit/GJTAdditionKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface UIViewController ()

@property (nullable,nonatomic,readwrite,strong) __kindof id<GJTViewModelProtocol> viewModel;

@end

@implementation UIViewController(GJTViewController)

-(__kindof id<GJTViewModelProtocol>)viewModel {
    return [self object:@selector(setViewModel:)];
}

-(void)setViewModel:(__kindof id<GJTViewModelProtocol>)viewModel {
    [self setRetainNonatomicObject:viewModel withKey:@selector(setViewModel:)];
}


@end

@interface GJTViewController ()

@property (nonatomic, strong) UIView *loadingOverylay;
@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicator;


@end

@implementation GJTViewController


- (instancetype)initWithViewModel:(__kindof id<GJTViewModelProtocol>)viewModel {
    self = [self init];
    
    if (self) {
        self.viewModel = viewModel;
        
        [self subscribeLoadingSignal];
        
        RACChannelTo(self,title) = RACChannelTo(self.viewModel,title);
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.viewModel.active = YES;
}



-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.viewModel.active = NO;
}


-(void) subscribeLoadingSignal {
    [[RACObserve(self.viewModel, loading) skip:1]subscribeNext:^(NSNumber * x) {
        if ([x boolValue]) {
            [self showLoading];
        } else {
            [self  hideLoading];
        }
    }];
}


-(void) showLoading {
    if (!_loadingOverylay) {
        _loadingOverylay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.width, UIScreen.height)];
        _loadingOverylay.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2f];
        
        UIView *contentView = nil;
        if ([self respondsToSelector:@selector(customLoadingView)]) {
            contentView = [self customLoadingView];
        } else {
            contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
            contentView.layer.cornerRadius = 10.f;
        
            UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
            loadingView.tintColor = UIColor.whiteColor;
            [contentView addSubview:loadingView];
            loadingView.center = CGPointMake(50, 50);
            
            RACSignal *didMoveToWindowSignal = [_loadingOverylay rac_signalForSelector:@selector(didMoveToWindow)];
            RACSignal *didMoveToSuperviewSignal = [_loadingOverylay rac_signalForSelector:@selector(didMoveToSuperview)];
            RACSignal *willDeallocSignal = [_loadingOverylay rac_willDeallocSignal];
            @weakify(loadingView);
            [[[RACSignal merge:@[didMoveToWindowSignal, didMoveToSuperviewSignal]] takeUntil:willDeallocSignal] subscribeNext:^(id  _Nullable x) {
                @strongify(loadingView);
                [loadingView startAnimating];
            }];
        }
        
        [_loadingOverylay addSubview:contentView];
        contentView.center = _loadingOverylay.center;
        [self.view addSubview:_loadingOverylay];
        
    }
    _loadingOverylay.hidden = NO;
}


-(void) hideLoading {
    if (!_loadingOverylay || !_loadingOverylay.superview) {
        return;;
    }
    _loadingOverylay.hidden = YES;
}

@end
