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
    UIStackView *internalStView;
    UIStackView *externalStView;

    UIView *customView;

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
        [self prepareLayout];

        [self setNeedsLayout];
    }
    return self;
}

- (CGFloat) cellHeight
{
    return currentHeight;
}

- (void) prepareLayout
{
    customView = [[UIView alloc] initWithFrame:CGRectZero];

    [self.contentView addSubview:customView];
    customView.translatesAutoresizingMaskIntoConstraints = NO;


    NSDictionary *views = NSDictionaryOfVariableBindings(customView);

    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[customView]-10-|"
                                                                   options: 0
                                                                   metrics:nil
                                                                     views:views];
    [self.contentView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[customView]-5-|"
                                                                   options: 0
                                                                   metrics:nil
                                                                     views:views];
    [self.contentView addConstraints:constraints];



    // Create and place elements

    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 30)];
    titleLabel.font = self.titleFont;
    titleLabel.text = @"Title";
    titleLabel.textColor = self.titleColor;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.numberOfLines = 1;
    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;

    // [self.contentView addSubview:titleLabel];

    noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,200,50)];
    noteLabel.font = self.noteFont;
    noteLabel.text = @"Note";
    noteLabel.textColor = self.noteColor;
    noteLabel.textAlignment = NSTextAlignmentLeft;
    noteLabel.numberOfLines = 1;
    noteLabel.lineBreakMode = NSLineBreakByTruncatingTail;

    // [self.contentView addSubview:noteLabel];

    internalStView = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, noteLabel]];
    internalStView.alignment = UIStackViewAlignmentFill;
    internalStView.distribution = UIStackViewDistributionFillProportionally;
    internalStView.axis = UILayoutConstraintAxisVertical;
    internalStView.translatesAutoresizingMaskIntoConstraints = NO;


    sw = [[UISwitch alloc] initWithFrame:CGRectMake(0,0, 0, 0)];
    [sw setOn:self.switchState];
    [sw addTarget:self action:@selector(switchTapped:) forControlEvents:UIControlEventValueChanged];

    externalStView = [[UIStackView alloc] initWithArrangedSubviews:@[internalStView, sw]];
    externalStView.alignment = UIStackViewAlignmentFill;
    externalStView.distribution = UIStackViewDistributionFillProportionally;
    externalStView.axis = UILayoutConstraintAxisHorizontal;
    externalStView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addSubview:externalStView];

    if (!self.backgroundColor) self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.33 alpha:1.0];
    if (!self.titleColor) self.titleColor = [UIColor orangeColor];
    if (!self.noteColor) self.noteColor = [UIColor yellowColor];
    if (!self.titleFont) self.titleFont = [UIFont systemFontOfSize:14 weight:1.25];
    if (!self.noteFont) self.noteFont = [UIFont systemFontOfSize:12 weight:1.0];

    // ********  start Add consrtaints
    if (con && con.count > 0) {
        [NSLayoutConstraint deactivateConstraints:con];
    } else if (!con) {
        con = [NSMutableArray new];
    }

    views = NSDictionaryOfVariableBindings(externalStView);
    //
    //      Constraint block 1. Locate switch on the right cental position
    //

   constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[externalStView]-|"
                                                                   options: 0
                                                                   metrics:nil
                                                                     views:views];
    [self.contentView addConstraints:constraints];
    externalStView.backgroundColor = [UIColor yellowColor];

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[externalStView]-|"
                                                          options: 0
                                                          metrics:nil
                                                            views:views];
    [self.contentView addConstraints:constraints];


    
    //
    //
    //
//
//    // align leading and trailing constraints for labels
//    NSLayoutConstraint *c = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:noteLabel attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
//
//    [self.contentView addConstraint:c];
//
//    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:noteLabel attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0]];
//
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[titleLabel]->=10-[sw]-20-|" options:0 metrics:nil views:views];
//
//    [self.contentView addConstraints:constraints];
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[sw]-|" options:0 metrics:nil views:views];
//
//    [self.contentView addConstraints:constraints];


//    [con addObject:[stView.topAnchor constraintGreaterThanOrEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:10.0]];
//    [con addObject:[stView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:10.0]];
//    [con addObject:[stView.centerYAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerYAnchor constant:0.0]];
//
//    [con addObject:[sw.leadingAnchor constraintGreaterThanOrEqualToAnchor:stView.trailingAnchor constant:25.0]];
//    [con addObject:[sw.centerYAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerYAnchor constant:0.0]];
//    [con addObject:[self.safeAreaLayoutGuide.trailingAnchor constraintEqualToAnchor:sw.trailingAnchor constant:12.0]];

 //   [NSLayoutConstraint activateConstraints:con];
    // ********  end  constraint definitons

}

- (void) setNoteText:(NSString *)noteText
{
    _noteText = noteText;
    noteLabel.text = noteText;
    [self setNeedsLayout];
}

- (void) setNoteFont:(UIFont *)noteFont
{
    _noteFont = noteFont;
    [self setNeedsLayout];
}

- (void) setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    [self setNeedsLayout];
}

- (void) setTitleText:(NSString *)titleText
{
    _titleText = titleText;
    titleLabel.text = titleText;
    [self setNeedsLayout];
}


- (void) updateConstraintsAAA
{
    if (!sw) {
        [self prepareLayout];
    }

    CGFloat cellWidth = self.contentView.frame.size.width;

    // size of the switch
    CGSize switchSize = sw.frame.size;

    CGFloat rightOffset = cellWidth - switchSize.width - 20;
    CGFloat leftOffset = 20;

    NSDictionary *attrDict = @{
        NSFontAttributeName: (self.titleFont ? self.titleFont : [UIFont systemFontOfSize:14.0 weight:1.15]),
    };

    CGRect titleRect = [self.noteText boundingRectWithSize:CGSizeMake(rightOffset, CGFLOAT_MAX)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attrDict
                                                   context:nil];
    CGFloat textBlockHeight = titleRect.size.height;
    CGSize tSize = titleRect.size;

    // Cell minimal height
    CGFloat minHeight = switchSize.height;
    if (tSize.height > minHeight) {
        minHeight = switchSize.height;
    }

    attrDict = @{
        NSFontAttributeName: (self.noteFont ? self.noteFont : [UIFont systemFontOfSize:12.0]),
    };

    CGRect noteRect = [self.noteText boundingRectWithSize:CGSizeMake(tSize.width, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attrDict
                                              context:nil];

    if (self.noteText.length > 0) {
        textBlockHeight += noteRect.size.height + 10;
    }

    if (textBlockHeight > minHeight) {
        minHeight = textBlockHeight;
    }

    currentHeight = minHeight *1.2; // add 10%  from top and bottom

    CGFloat yOffset = minHeight * 0.1;  // starting offset

    titleLabel.frame = ({
        CGRect frame = CGRectZero;
        frame.origin.x = leftOffset;
        frame.origin.y = yOffset;
        frame.size.width = tSize.width;
        frame.size.height = tSize.height;
        yOffset += tSize.height;
        frame;
    });

    if (self.noteText.length > 0) {
        yOffset += 10;
        noteLabel.frame = ({
            CGRect frame = CGRectZero;
            frame.origin.x = leftOffset;
            frame.origin.y = yOffset;
            frame.size.width = tSize.width;
            frame.size.height = noteRect.size.height;
            yOffset += noteRect.size.height;
            frame;
        });
        noteLabel.hidden = NO;
    } else {
        noteLabel.hidden = YES;
    }

    yOffset += minHeight * 0.1;

    currentHeight = yOffset;

    sw.frame = ({
        CGRect frame = CGRectZero;
        frame.origin.x = rightOffset;
        frame.origin.y = (currentHeight - switchSize.height) * 0.5;
        frame.size.width = switchSize.width;
        frame.size.height = switchSize.height;
        frame;
    });

    [self showFrame:titleLabel];
    NSLog(@"title - %@", titleLabel.text);
    [self showFrame:noteLabel];
    NSLog(@"note - %@", noteLabel.text);
    [self showFrame:sw];
    NSLog(@"switch - %@", (sw.on ? @"On" : @"Off"));

 //   [super updateConstraints];


}


- (void) showFrame:(UIView *)v
{
    CGRect f =  v.frame;
    NSLog(@"x: %.2f y: %.2f w: %.2f h: %.2f", f.origin.x, f.origin.y, f.size.width, f.size.height);
}

- (void) switchTapped:(id) sender
{
    BOOL newState = sw.isOn;
    if (self.delegate && ([self.delegate respondsToSelector:@selector(switchState:changedTo:)])) {
        [self.delegate switchState:self.switchTag changedTo:newState];
    }
}

@end
