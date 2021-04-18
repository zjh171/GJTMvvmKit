//
//  ShowLoadingDemoScrollViewController.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/4/18.
//

#import "ShowLoadingDemoScrollViewController.h"
#import <GJTAdditionKit/GJTAdditionKit.h>
#import <MJRefresh/MJRefresh.h>

@interface ShowLoadingDemoScrollViewController ()

@property (nonatomic,strong) UIScrollView *mScrollView;

@end

@implementation ShowLoadingDemoScrollViewController

@dynamic scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 280, UIScreen.width, 60);
    label.text = @"下拉 刷新";
    [self.view addSubview:label];
    
    self.scrollView = self.mScrollView;
    
    self.needLoadingHeader = YES;

    self.mScrollView.frame = UIScreen.mainScreen.bounds;
    self.mScrollView.contentSize = CGSizeMake(UIScreen.width, UIScreen.height + 200);
    self.mScrollView.alwaysBounceVertical = YES;
    [self.view addSubview:self.mScrollView];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UIScrollView *)mScrollView {
    if (!_mScrollView) {
        _mScrollView = [[UIScrollView alloc] init];
    }
    return _mScrollView;
}

@end
