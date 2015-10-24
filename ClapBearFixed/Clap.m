//
//  Clap.m
//  ClapBeat
//
//  Created by 株式会社タマヤ on 2012/12/25.
//  Copyright (c) 2012年 株式会社タマヤ. All rights reserved.
//

#import "Clap.h"
#import "ViewController.h"

@implementation Clap {
    //音のファイルの所在を示すURL
    CFURLRef soundURL;
    //サウンドIDを生成
    SystemSoundID soundID;
}



//音ファイルを読み込んで設定
-(void)setSound{
    //ファイルを読み込んで、soundURLを生成
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    soundURL = CFBundleCopyResourceURL(mainBundle,CFSTR("voice03"),
                                       CFSTR("mp3"),nil);
    
    //soundURLをもとに、soundIDを生成
    AudioServicesCreateSystemSoundID(soundURL,&soundID);
}

//soundIDを再生
-(void)play {
    AudioServicesPlaySystemSound(soundID);
}

//while文による繰り返し
-(void)repeatClap:(int)repeatCount {
    //iの値を初期化
    i = 0;
    
    //音を再生
    [self play];
    
    //0.5秒（500000);
    usleep(500000);
    
    
}



//初期化処理
+(id)initClap {
    return[[self alloc] init];
}

-(id)init{
    self = [super init];
    [self setSound];
    return self;
}
@end
