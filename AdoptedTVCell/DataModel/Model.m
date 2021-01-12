//
//  Model.m
//  AdoptedTVCell
//
//  Created by Водолазкий В.В. on 12.01.2021.
//

#import "Model.h"

@implementation Model

@synthesize title, text, switchState;

- (instancetype) initWithTitle:(NSString *) aTitle
                           text:(NSString *)aString
                      andSwitch:(BOOL) aState
{
    if (self = [super init]) {
        self.title = aTitle;
        self.text = aString;
        self.switchState = aState;
    }
    return self;
}

@end

@implementation ModelData

- (instancetype) init
{
    if (self = [super init]) {
        NSMutableArray *n = [NSMutableArray new];
        Model *m = [[Model alloc] initWithTitle:@"Stream via Wi-Fi only"
                                           text:@"Helps reduce mobile traffic" andSwitch:YES];
        [n addObject:m];
        m = [[Model alloc] initWithTitle:@"Show your liked music from YouTube" text:@"Music videos that you marked in thumbs up in other YouTube appswill be shown in your linked playlist." andSwitch:NO];
        [n addObject:m];
        m = [[Model alloc] initWithTitle:@"Stats for nerds" text:@"" andSwitch:YES];
        [n addObject:m];
        m = [[Model alloc] initWithTitle:@"Restricted Mode" text:@"This helps to hide potentially mature videos. No filter is 100\% accurate though. This setting applies for this app on this device only." andSwitch:NO];

        self.data = [[NSArray alloc] initWithArray:n];
    }
    return self;
}

@end
