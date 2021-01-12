//
//  AdoptedDataCellTableViewCell.m
//  AdoptedTVCell
//
//  Created by Водолазкий В.В. on 12.01.2021.
//

#import "AdoptedDataCellTableViewCell.h"

NSString const * AdoptedDataCellTableViewCellID     =   @"AdoptedDataCellTableViewCellID";

@interface AdoptedDataCellTableViewCell()
{
    CGFloat currentHeight;
    UILabel *titleLabel;
    UILabel *noteLabel;
    UIStackView *stView;

    UISwitch *sw;
}


@end

@implementation AdoptedDataCellTableViewCell


- (instancetype) initWithtitle:(NSString *)aTitle note:(NSString *)aNote andSwitchState:(BOOL) aState
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AdoptedDataCellTableViewCellID]) {
        self.titleText = aTitle;
        self.noteText = aNote;
        self.switchState = aState;
        // set up default parameters for cells
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.33 alpha:1.0];
        self.titleColor = [UIColor orangeColor];
        self.noteColor = [UIColor yellowColor];
        self.titleFont = [UIFont systemFontOfSize:14 weight:1.15];
        self.noteFont = [UIFont systemFontOfSize:12 weight:1.0];
        [self prepareLayout];
    }
    return self;
}

- (CGFloat) cellHeight
{
    return currentHeight;
}

- (void) prepareLayout
{
    // Create and place elements
    stView = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, noteLabel]];
    stView.alignment = UIStackViewAlignmentFill;
    stView.distribution = UIStackViewDistributionFillProportionally;
    stView.axis = UILayoutConstraintAxisVertical;
    stView.translatesAutoresizingMaskIntoConstraints = NO;

    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 30)];
    titleLabel.font = self.titleFont;
    titleLabel.textColor = self.titleColor;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.numberOfLines = 1;
    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;

    noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,200,50)];
    noteLabel.font = self.noteFont;
    noteLabel.textColor = self.noteColor;
    noteLabel.textAlignment = NSTextAlignmentLeft;
    noteLabel.numberOfLines = 1;
    noteLabel.lineBreakMode = NSLineBreakByTruncatingTail;

    [self.contentView addSubview:stView];

    sw = [[UISwitch alloc] initWithFrame:CGRectMake(0,0, 0, 0)];
    [sw setOn:self.switchState];
    [sw addTarget:self action:@selector(switchTapped:) forControlEvents:UIControlEventValueChanged];

    [self.contentView addSubview:sw];
}

- (void) switchTapped:(id) sender
{
    BOOL newState = sw.isOn;
    if (self.delegate && ([self.delegate respondsToSelector:@selector(switchState:changedTo:)])) {
        [self.delegate switchState:self.switchTag changedTo:newState];
    }
}

@end
