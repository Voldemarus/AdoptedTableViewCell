//
//  Model.h
//  AdoptedTVCell
//
//  Created by Водолазкий В.В. on 12.01.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic) BOOL switchState;

- (instancetype) initWithTitle:(NSString *) aTitle
                          text:(NSString *)aString
                     andSwitch:(BOOL) aState;

@end

@interface ModelData : NSObject

@property (nonatomic, retain) NSArray <Model *> *data;

@end

NS_ASSUME_NONNULL_END
