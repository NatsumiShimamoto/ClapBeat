//
//  ViewController.m
//  ClapBearFixed
//
//  Created by 株式会社タマヤ on 2012/12/25.
//  Copyright (c) 2012年 株式会社タマヤ. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController

{
    Clap *clapInstance;
    IBOutlet UIPickerView *clapPickerView;
    NSString *repeatNumbersForPicker [10];
    int repeatCount;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //clapを初期化
    clapInstance = [Clap initClap];
    
    //初期の手拍子の数として１（１回）を指定
    repeatCount = 1;
    
    //PickerViewの選択肢一覧を準備
    for (int i = 0; i <10; i++){
        NSString *numberText = [NSString stringWithFormat:@"%d回",i+1];
        
        repeatNumbersForPicker[i] = numberText;
    }
    [self playButtonSetting];
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//PickerViewの列の数を指定
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView{
    
    //今回は１つのカラム（手拍子の回数）のみ
    return 1;
}

//カラムの要素を指定
-(NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component{
    //今回は１０個の要素（「１回」〜「１０回」）
    return 10;
}

//選択肢要素の表示文字列
-(NSString *)pickerView:(UIPickerView *)thePickerView
            titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    //row番目の要素に表示する文字列
    return repeatNumbersForPicker[row];
}

//選択肢が変更された際の処理
-(void)pickerView:(UIPickerView *)thePickerView
     didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //繰り返し回数は（row+1)回
    //例：4番目の要素=>「５回」=>繰り返し回数は（4+1=5)回
    repeatCount = (int)row+1;
}

//再生ボタンが押された際の処理
-(void)play:(id)sender {
    //Clapクラスの中のメソッドを呼び出し、指定回数分再生
    [clapInstance repeatClap:repeatCount];
}

-(void)playButtonSetting{
    
    playButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 300, 60, 60)];
    [[playButton layer] setCornerRadius:30.0];
    [playButton setClipsToBounds:YES];
   
    [[playButton layer] setBorderColor:[[UIColor grayColor] CGColor]];
    
    [[playButton layer] setBorderWidth:1.5];
    
    UIImage *img = [UIImage imageNamed:@"しろくま.png"];

    [playButton setBackgroundImage:img forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:playButton];

}
@end
