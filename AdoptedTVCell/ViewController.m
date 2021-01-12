//
//  ViewController.m
//  AdoptedTVCell
//
//  Created by Водолазкий В.В. on 12.01.2021.
//

#import "ViewController.h"
#import "Model.h"
#import "AdoptedDataCellTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, AdoptedDataCellDelegate>
{
    NSArray <Model *> *data;        // model data
    NSMutableArray <NSNumber *> *cH;        // height of the cell
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
    cH = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSInteger i = 0; i < data.count; i++) {
        cH[i] = @0;
    }

    [self.tableView registerClass:[AdoptedDataCellTableViewCell class] forCellReuseIdentifier:AdoptedDataCellTableViewCellID];

    [self.tableView reloadData];
}

#pragma mark TableView datasource/delegate

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdoptedDataCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AdoptedDataCellTableViewCellID];
    Model *d = data[indexPath.row];
    if (!cell) {
        cell = [[AdoptedDataCellTableViewCell alloc] initWithtitle:d.title note:d.text andSwitchState:d.switchState];
    } else {
        cell.titleText = d.title;
        cell.noteText = d.text;
        cell.switchState = d.switchState;

    }
    cH[indexPath.row] = @(cell.cellHeight);
    cell.switchTag = indexPath.row;     // to be used in delegate

    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h =  [cH[indexPath.row] floatValue];
    NSLog(@"i - %ld h - %.2f", indexPath.row, h);
    return h;
}





#pragma mark - Switch tapped delegate method

- (void) switchState:(NSInteger)tag changedTo:(BOOL)newState
{
    NSLog(@"Switch on row %ld switched to %@",tag, (newState ? @"On" : @"Off"));
}







@end
