//
//  WebViewController.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 15/7/25.
//

#import "WebViewController.h"

@interface WebViewController ()

@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *titleStr;
@property(nonatomic,strong)WKWebView *webView;

@end

@implementation WebViewController

- (instancetype)initWithURL:(NSString *)url title:(NSString *)title {
  self = [super init];
  if (self) {
    _url = url;
    _titleStr = title;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = self.titleStr;

  _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:_webView];
  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
  [_webView loadRequest:request];

  UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
  self.navigationItem.leftBarButtonItem = closeItem;
}

- (void)close {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
