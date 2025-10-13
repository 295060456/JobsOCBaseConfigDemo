#import "DemoListViewController.h"
#import "MVP/MVPLoginViewController.h"
#import "MVVM/MVVMLoginViewController.h"
#import "VIPER/VIPERLoginRouter.h"

@implementation DemoListViewController {
    NSArray<NSString *> *_items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"架构对比 Demo";
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    _items = @[@"MVP Login", @"MVVM Login", @"VIPER Login"];
    self.tableView.tableFooterView = [UIView new];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return _items.count; }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _items[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0: vc = [MVPLoginViewController new]; break;
        case 1: vc = [MVVMLoginViewController new]; break;
        case 2: vc = [VIPERLoginRouterImpl buildModule]; break;
        default: break;
    }
    if (vc) { [self.navigationController pushViewController:vc animated:YES]; }
}
@end
