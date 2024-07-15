//
//  PreviewVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 6/22/24.
//

#import "PreviewVC.h"

@interface PreviewVC ()



@end

@implementation PreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = self.previewText;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end
