//
//  ItchAndPainViewController.m
//  ICU
//
//  Created by 陈曦翔 on 4/14/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "ItchAndPainViewController.h"
#import "HumanBodyImageView.h"
#import "Language.h"
#import "UIImage+Resizing.h"
@interface ItchAndPainViewController ()

@end

@implementation ItchAndPainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [Language get:_mainCategory.categoryName alter:nil];
    CGAffineTransform trans=CGAffineTransformMakeRotation(-M_PI_2);
    _scaleSlider.transform=trans;
    _sliderBackground.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"scaleTrack" ofType:@"png"]];
    _titleLabel.text = [Language get:@"scale" alter:nil];
    self.areaLabel.text = [Language get:@"area" alter:nil];
    UIImage* thumbImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"thumb" ofType:@"png"]];
    thumbImage = [UIImage imageWithImage:thumbImage scaledToSize:CGSizeMake(50, 50)];
    [_scaleSlider setThumbImage:thumbImage forState:UIControlStateNormal];
    UIImage* trackImage = [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"transparentTrack" ofType:@"png"] ] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ];
    UIImage* trackMaxImage = [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"transparentTrackMax" ofType:@"png"] ] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) ];
    
    [_scaleSlider setMinimumTrackImage:trackImage forState:UIControlStateNormal];
    [_scaleSlider setMaximumTrackImage:trackMaxImage forState:UIControlStateNormal];
    
    [((HumanBodyImageView*)self.bodyImage) changeCircleDiameter:self.areaSlider.value];
    [((HumanBodyImageView*)self.bodyImage) changeColor:self.scaleSlider.value];
    
    
    [_scale1ImageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"media/icon/body/1" ofType:@"png"]]];
    [_scale2ImageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"media/icon/body/2" ofType:@"png"]]];
    [_scale3ImageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"media/icon/body/3" ofType:@"png"]]];
    [_scale4ImageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"media/icon/body/4" ofType:@"png"]]];
    [_scale5ImageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"media/icon/body/5" ofType:@"png"]]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sliderValueChange:(id)sender
{
    //self.degreeLabel.text = [NSString stringWithFormat:@"%.2f",self.degreeSlider.value];
    [((HumanBodyImageView*)self.bodyImage) changeCircleDiameter:self.areaSlider.value];
    
}

- (IBAction)scaleSliderValueChange:(id)sender
{
    float scaleValue = self.scaleSlider.value;
    [((HumanBodyImageView*)self.bodyImage) changeColor:scaleValue];
    if(scaleValue<=2){
        [self highLightScaleIcon:_scale1ImageView];
//        [_scale1ImageView.layer setBorderWidth:2];
//        [_scale1ImageView.layer setBorderColor:[[UIColor blueColor] CGColor]];
    }else if(scaleValue>2&&scaleValue<=4){
        [self highLightScaleIcon:_scale2ImageView];
//        [_scale2ImageView.layer setBorderWidth:2];
//        [_scale2ImageView.layer setBorderColor:[[UIColor blueColor] CGColor]];
    }else if(scaleValue>4&&scaleValue<=6){
        [self highLightScaleIcon:_scale3ImageView];
//        [_scale3ImageView.layer setBorderWidth:2];
//        [_scale3ImageView.layer setBorderColor:[[UIColor blueColor] CGColor]];
    }else if(scaleValue>6&&scaleValue<=8){
        [self highLightScaleIcon:_scale4ImageView];
//        [_scale4ImageView.layer setBorderWidth:2];
//        [_scale4ImageView.layer setBorderColor:[[UIColor blueColor] CGColor]];
    }else if(scaleValue>8&&scaleValue<=10){
        [self highLightScaleIcon:_scale5ImageView];
//        [_scale5ImageView.layer setBorderWidth:2];
//        [_scale5ImageView.layer setBorderColor:[[UIColor blueColor] CGColor]];
    }
}

-(void) highLightScaleIcon:(UIImageView*)target
{
    [_scale1ImageView.layer setBorderWidth:0];
    [_scale2ImageView.layer setBorderWidth:0];
    [_scale3ImageView.layer setBorderWidth:0];
    [_scale4ImageView.layer setBorderWidth:0];
    [_scale5ImageView.layer setBorderWidth:0];
    [target.layer setBorderWidth:2];
    [target.layer setBorderColor:[[UIColor blueColor] CGColor]];
}



@end
