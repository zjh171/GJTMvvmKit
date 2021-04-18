//
//  ViewController.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/2/21.
//

#import "ViewController.h"
#import "ViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <GJTMvvmKit/GJTMvvmKit.h>
#import "ShowLoadingDemoViewController.h"
#import "ShowLoadingDemoViewModel.h"

#import "ShowLoadingDemoScrollViewController.h"
#import "ShowLoadingDemoScrollViewModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView.frame = UIScreen.mainScreen.bounds;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellTag = @"cellTag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellTag];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellTag];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"show Loading viewcontroller";
    } else if(indexPath.row == 1) {
        cell.textLabel.text = @"show Loading scrollviewcontroller";

    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ShowLoadingDemoViewModel *viewModel = [[ShowLoadingDemoViewModel alloc] init];
        ShowLoadingDemoViewController *vc = [[ShowLoadingDemoViewController alloc] initWithViewModel:viewModel];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self showViewController:vc sender:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        ShowLoadingDemoScrollViewModel *viewModel = [[ShowLoadingDemoScrollViewModel alloc] init];
        ShowLoadingDemoScrollViewController *vc = [[ShowLoadingDemoScrollViewController alloc] initWithViewModel:viewModel];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self showViewController:vc sender:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

@end
