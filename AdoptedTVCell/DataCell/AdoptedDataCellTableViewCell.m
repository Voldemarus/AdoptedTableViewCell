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

    NSMutableArray <NSLayoutConstraint*> * con;
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

        [self updateConstraints];
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

    stView = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, noteLabel]];
    stView.alignment = UIStackViewAlignmentFill;
    stView.distribution = UIStackViewDistributionFillProportionally;
    stView.axis = UILayoutConstraintAxisVertical;
    stView.translatesAutoresizingMaskIntoConstraints = NO;


    [self.contentView addSubview:stView];

    sw = [[UISwitch alloc] initWithFrame:CGRectMake(0,0, 0, 0)];
    [sw setOn:self.switchState];
    [sw addTarget:self action:@selector(switchTapped:) forControlEvents:UIControlEventValueChanged];

    [self.contentView addSubview:sw];

    // ********  start Add consrtaints
    if (con.count > 0) {
        [NSLayoutConstraint deactivateConstraints:con];
    } else if (!con) {
        con = [NSMutableArray new];
    }

    [con addObject:[stView.topAnchor constraintGreaterThanOrEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:10.0]];
    [con addObject:[stView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:10.0]];
    [con addObject:[stView.centerYAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerYAnchor constant:0.0]];

    [con addObject:[sw.leadingAnchor constraintGreaterThanOrEqualToAnchor:stView.trailingAnchor constant:25.0]];
    [con addObject:[sw.centerYAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerYAnchor constant:0.0]];
    [con addObject:[self.safeAreaLayoutGuide.trailingAnchor constraintEqualToAnchor:sw.trailingAnchor constant:12.0]];

    [NSLayoutConstraint activateConstraints:con];
    // ********  end  constraint definitons

}

- (void) setNoteText:(NSString *)noteText
{
    _noteText = noteText;
    [self layoutSubviews];
}

- (void) setNoteFont:(UIFont *)noteFont
{
    _noteFont = noteFont;
    [self layoutSubviews];
}

- (void) setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    [self layoutSubviews];
}

- (void) setTitleText:(NSString *)titleText
{
    _titleText = titleText;
    [self layoutSubviews];
}




- (void) layoutSubviews
{
    if (!stView) {
        [self prepareLayout];
    }
    [super layoutSubviews];
    currentHeight = stView.frame.size.height;
}

- (void) switchTapped:(id) sender
{
    BOOL newState = sw.isOn;
    if (self.delegate && ([self.delegate respondsToSelector:@selector(switchState:changedTo:)])) {
        [self.delegate switchState:self.switchTag changedTo:newState];
    }
}

@end
