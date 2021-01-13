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
    AdoptedDataCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AdoptedDataCellTableViewCellID forIndexPath:indexPath];

    Model *d = data[indexPath.row];
    cell.delegate = self;           // to intercept and delegate switch change events
    cell.titleText = d.title;
    cell.backgroundColor = [UIColor blueColor];
    cell.titleFont = [UIFont systemFontOfSize:16 weight:1.25];
    cell.titleColor = [UIColor whiteColor];
    cell.noteColor = [UIColor yellowColor];
    cell.noteText = d.text;
    cell.switchState = d.switchState;
    cell.switchTag = indexPath.row;     // to be used in delegate

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - Switch tapped delegate method

- (void) switchState:(NSInteger)tag changedTo:(BOOL)newState
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"Switch on row %ld switched to %@",tag, (newState ? @"On" : @"Off"));
    });
}







@end
