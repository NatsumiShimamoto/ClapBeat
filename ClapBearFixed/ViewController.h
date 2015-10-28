//
//  ViewController.h
//  ClapBearFixed
//
//  Created by 株式会社タマヤ on 2012/12/25.
//  Copyright (c) 2012年 株式会社タマヤ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Clap.h"


@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    
    
    Clap *clapInstance;
    IBOutlet UIPickerView *clapPickerView;
    NSString *repeatNumbersForPicker [10];
    NSString *repearPolarbear[10];
    
    int repeatCount;
    IBOutlet UIButton *encountButton;
    
    UIImage *image;
    UIImageView *imageView;
    int i;
    int sum;
    int btnPushed;
}

-(IBAction)play:(id)sender;

@end
