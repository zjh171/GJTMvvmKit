//
//  GJTBaseView.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/2/27.
//

#import "GJTBaseView.h"

@implementation GJTBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Do any additional setup after loading the view.
        if (@available(iOS 12.0, *)) {
            BOOL isDark = (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
            if (isDark) {
                self.backgroundColor = [UIColor blackColor];
            } else {
                self.backgroundColor = [UIColor whiteColor];
            }
        } else {
            // Fallback on earlier versions
            self.backgroundColor = [UIColor whiteColor];
        }
    }
    return self;
}


@end
