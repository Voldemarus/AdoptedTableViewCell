//
//  AdoptedDataCellTableViewCell.h
//  AdoptedTVCell
//
//  Created by Водолазкий В.В. on 12.01.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol  AdoptedDataCellDelegate <NSObject>
@optional
- (void) switchState:(NSInteger)tag changedTo:(BOOL)newState;

@end


extern NSString const * AdoptedDataCellTableViewCellID;

@interface AdoptedDataCellTableViewCell : UITableViewCell

// Data itself
@property (nonatomic, retain) NSString *titleText;
@property (nonatomic, retain) NSString *noteText;
// assume all cells have UISwitch on the right
@property (nonatomic) BOOL switchState;

// Appearance tuning
@property (nonatomic, retain) UIColor *backgroundColor;
@property (nonatomic, retain) UIFont *titleFont;
@property (nonatomic, retain) UIFont *noteFont;
@property (nonatomic, retain) UIColor *titleColor;
@property (nonatomic, retain) UIColor *noteColor;

@property (readonly) CGFloat cellHeight;

@property (nonatomic) NSInteger switchTag;      // Mandatory to identofy switch!
@property (nonatomic, assign) id <AdoptedDataCellDelegate> delegate;

- (instancetype) initWithtitle:(NSString *)aTitle
                          note:(NSString *)aNote
                andSwitchState:(BOOL) aState;
- (void) prepareLayout;

@end

NS_ASSUME_NONNULL_END
