# GJTMvvmKit

[![CI Status](https://img.shields.io/travis/zjh171/GJTMvvmKit.svg?style=flat)](https://travis-ci.org/zjh171/GJTMvvmKit)
[![Version](https://img.shields.io/cocoapods/v/GJTMvvmKit.svg?style=flat)](https://cocoapods.org/pods/GJTMvvmKit)
[![License](https://img.shields.io/cocoapods/l/GJTMvvmKit.svg?style=flat)](https://cocoapods.org/pods/GJTMvvmKit)
[![Platform](https://img.shields.io/cocoapods/p/GJTMvvmKit.svg?style=flat)](https://cocoapods.org/pods/GJTMvvmKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

GJTMvvmKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GJTMvvmKit'
```

## Architecture

### ViewController

GJTMvvmKitGJTViewControllerProtocol
GJTMvvmKitGJTScrollViewController
GJTMvvmKitGJTViewController
GJTMvvmKitGJTScrollViewControllerProtocol

### ViewModel

GJTViewModel
GJTViewModelProtocol
GJTViewModelLoadingProtocol
GJTViewModelProtocol

## Usage

### ViewController Loading

```
@weakify(self);
[self.didLoadingSignal subscribeNext:^(id  _Nullable x) {
    @strongify(self);
    NSLog(@"耗时任务开始， Loading了");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loading = NO;
        NSLog(@"耗时任务结束,隐藏 Loading");
    });
}];
```

### ViewController Active

```
[self.didBecomeActiveSignal subscribeNext:^(id  _Nullable x) {
    NSLog(@"view model did become active!");
}];
```


## Author

zjh171, zjh171@qq.com

## License

GJTMvvmKit is available under the MIT license. See the LICENSE file for more info.
