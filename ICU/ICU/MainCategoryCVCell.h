//
//  MainCategoryCVCell.h
//  ICU
//
//  Created by 陈曦翔 on 4/11/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface MainCategoryCVCell : UICollectionViewCell <AVAudioPlayerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *categoryName;

@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property NSURL *soundFileURL;
@property (strong,nonatomic) AVAudioPlayer *player;

- (IBAction)playSound:(id)sender;

@end
