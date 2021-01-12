//
//  ViewController.m
//  AdoptedTVCell
//
//  Created by Водолазкий В.В. on 12.01.2021.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray <Model *> *data;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    ModelData *mData = [[ModelData alloc] init];
    data = mData.data;




}







@end
