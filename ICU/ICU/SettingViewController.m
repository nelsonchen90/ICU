//
//  SettingViewController.m
//  ICU
//
//  Created by Chen Liu on 4/23/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "SettingViewController.h"
#import "Language.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingLanguages];
    // Do any additional setup after loading the view.
}

-(void)settingLanguages
{
    self.languageLabel.text=[Language get:@"Language" alter:nil];
    self.voiceLabel.text=[Language get:@"Voice" alter:nil];
    if([[Language getCurrentLanguage] isEqualToString:@"en"])
    {
        [self highLihgtSelectedButton:_enButton];
        [self dismissHighLightedButton:_esButton];
    }
    else if([[Language getCurrentLanguage] isEqualToString:@"es"])
    {
        [self highLihgtSelectedButton:_esButton];
        [self dismissHighLightedButton:_enButton];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)highLihgtSelectedButton:(UIButton*)selectedButton
{
    [[selectedButton layer] setBorderWidth:2.0f];
    [[selectedButton layer] setBorderColor:[UIColor redColor].CGColor];
}

- (void)dismissHighLightedButton:(UIButton*)button
{
    [[button layer] setBorderWidth:0.0f];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)setEnglish:(id)sender {
    
    [Language setLanguage:@"en"];
    [self settingLanguages];

}

- (IBAction)setSpanish:(id)sender {
    [Language setLanguage:@"es"];
    [self settingLanguages];

}
- (IBAction)voiceSwitchOn:(id)sender {
}
@end
