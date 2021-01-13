//
//  AdoptedDataCellTableViewCell.m
//  AdoptedTVCell
//
//  Created by Водолазкий В.В. on 12.01.2021.
//

#import "AdoptedDataCellTableViewCell.h"

NSString * const AdoptedDataCellTableViewCellID     =   @"AdoptedDataCellTableViewCellID";

@interface AdoptedDataCellTableViewCell()
{
    CGFloat currentHeight;
    UILabel *titleLabel;
    UILabel *noteLabel;

    UIView *customView;

    UISwitch *sw;
}


@end

@implementation AdoptedDataCellTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AdoptedDataCellTableViewCellID]) {
        [self createElementsAndConstraints];
    }
    return self;
}

- (void) createElementsAndConstraints
{
    // Вызывается только раз при создании ячейки!
    
    self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.33 alpha:1.0];
    self.titleColor = [UIColor blueColor];
    self.noteColor = [UIColor darkTextColor];
    self.titleFont = [UIFont systemFontOfSize:14 weight:1.25];
    self.noteFont = [UIFont systemFontOfSize:12 weight:0.85];

    // Create and place elements

    titleLabel = [[UILabel alloc] init];
    titleLabel.font = self.titleFont;
    titleLabel.text = @"Title";
    titleLabel.textColor = self.titleColor;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.numberOfLines = 1111111;
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;

    noteLabel = [[UILabel alloc] init];
    noteLabel.font = self.noteFont;
    noteLabel.text = @"Note";
    noteLabel.textColor = self.noteColor;
    noteLabel.textAlignment = NSTextAlignmentLeft;
    noteLabel.numberOfLines = 1111111;
    noteLabel.lineBreakMode = NSLineBreakByWordWrapping;

    UIStackView *stView = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, noteLabel]];
    stView.alignment = UIStackViewAlignmentFill;
    stView.distribution = UIStackViewDistributionFill;
    stView.axis = UILayoutConstraintAxisVertical;
    
    [self.contentView addSubview:stView];  // Добавляем на contentView !!!

    sw = [[UISwitch alloc] init];
    [sw setOn:NO];
    [sw addTarget:self action:@selector(switchTapped:) forControlEvents:UIControlEventValueChanged];

    [self.contentView addSubview:sw]; // Добавляем на contentView !!!

    
    // ********  start Add consrtaints
    NSMutableArray <NSLayoutConstraint*> * con = [NSMutableArray new];
    
    [con addObjectsFromArray:@[
        [stView.topAnchor     constraintGreaterThanOrEqualToAnchor:self.contentView.topAnchor constant:10.0],
        [stView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10.0],
        [stView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor constant:0.0],
        [sw.leadingAnchor     constraintGreaterThanOrEqualToAnchor:stView.trailingAnchor constant:25.0],
        [sw.topAnchor         constraintGreaterThanOrEqualToAnchor:self.contentView.topAnchor constant:10.0],
        [sw.centerYAnchor     constraintEqualToAnchor:self.contentView.centerYAnchor constant:0.0],
        [sw.trailingAnchor    constraintEqualToAnchor:self.contentView.trailingAnchor constant:-12.0],
    ]];

    [NSLayoutConstraint activateConstraints:con];
    
    stView.translatesAutoresizingMaskIntoConstraints = NO; // !!!!
    sw.translatesAutoresizingMaskIntoConstraints = NO;     // !!!!
    
    // ********  end  constraint definitons

}

- (void) setNoteText:(NSString *)noteText
{
    _noteText = noteText;
    noteLabel.text = noteText;
}

- (void) setNoteFont:(UIFont *)noteFont
{
    _noteFont = noteFont;
    noteLabel.font = noteFont;
}

- (void) setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    titleLabel.font = titleFont;
}

- (void) setTitleText:(NSString *)titleText
{
    _titleText = titleText;
    titleLabel.text = titleText;
}

- (void) setSwitchState:(BOOL)switchState
{
    sw.on = switchState;
    _switchState = switchState;
}

- (void) setBackgroundColor:(UIColor *)backgroundColor
{
    self.contentView.backgroundColor = backgroundColor;
}

- (void) setTitleColor:(UIColor *)titleColor
{
    titleLabel.textColor = titleColor;
}

- (void) setNoteColor:(UIColor *)noteColor
{
    noteLabel.textColor = noteColor;
}


- (void) switchTapped:(id) sender
{
    BOOL newState = sw.isOn;
    if (self.delegate && ([self.delegate respondsToSelector:@selector(switchState:changedTo:)])) {
        [self.delegate switchState:self.switchTag changedTo:newState];
    }
}

@end
