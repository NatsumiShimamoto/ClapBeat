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
    NSString *repearPolarbear[10];
    
    int repeatCount;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    //clapを初期化
    clapInstance = [Clap initClap];
    
    //初期の手拍子の数として１（１回）を指定
    repeatCount = 1;
    
    //PickerViewの選択肢一覧を準備
    for (i = 0; i <10; i++){
        NSString *numberText = [NSString stringWithFormat:@"%d回",i+1];
        
        repeatNumbersForPicker[i] = numberText;
    }
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
    
    NSLog(@"play");
    
    
    for(i = 0;i < repeatCount;i++){
        
        //Clapクラスの中のメソッドを呼び出し、指定回数分再生
        [clapInstance repeatClap:repeatCount];
        [self fallingBear];
        
        NSLog(@"while");
        
    }
}






-(void)fallingBear{
    NSLog(@"%d",i);
    
    
    image = [UIImage imageNamed:@"polarbear.png"];
    imageView = [[UIImageView alloc]initWithImage:image];
    
    imageView.frame = CGRectMake(15+i*40, -160, 85, 160);
    [self.view addSubview:imageView];
    
    NSLog(@"%@", NSStringFromCGRect(imageView.frame));
    
    // アニメーション
    
    [UIView animateWithDuration:0.5f // アニメーション速度2.5秒
                          delay:0.1f + 0.5f * i // 0.5秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         imageView.transform = CGAffineTransformMakeTranslation(0, 550);
                         NSLog(@"移動");
                        
                     } completion:^(BOOL finished) {
                         // アニメーション終了時
                         NSLog(@"アニメーション終了");
                         
                     }];
    NSLog(@"%@", NSStringFromCGRect(imageView.frame));
    
}



@end
