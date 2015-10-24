//
//  Clap.h
//  ClapBeat
//
//  Created by 株式会社タマヤ on 2012/12/25.
//  Copyright (c) 2012年 株式会社タマヤ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Clap : NSObject{
   
    UIViewController *viewController;
    
    UIImage *image;
    UIImageView *imageView;
    
    int i;
}

+(id)initClap;
-(void)repeatClap:(int)repeatCount;

@end
