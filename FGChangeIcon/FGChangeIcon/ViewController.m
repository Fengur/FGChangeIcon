//
//  ViewController.m
//  FGChangeIcon
//
//  Created by Fengur on 2017/4/5.
//  Copyright © 2017年 Fengur. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *containLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIWindow *window = app.window;
    [UIView animateWithDuration:1.0f animations:^{
        _containLabel.alpha = 0;
        window.transform = CGAffineTransformMakeScale(1, 0.0005);
    } completion:^(BOOL finished) {
        [self changeIcon];
        window.transform = CGAffineTransformMakeScale(0.0005, 0.0005);
        _containLabel.alpha = 1;
        [UIView animateWithDuration:0.5 animations:^{
            window.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
    
}


- (void)changeIcon{
    if ([UIApplication sharedApplication].supportsAlternateIcons) {
        NSLog(@"this app can change app icon");
    }else{
        NSLog(@"sorry,this app can not change app icon");
        return;
    }
    NSString *iconName = [[UIApplication sharedApplication] alternateIconName];
    if (iconName) {
        [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"set icon error: %@",error);
            }
            NSLog(@"current icon's name -> %@",iconName);
        }];
    }else{
        [[UIApplication sharedApplication] setAlternateIconName:@"icontwo" completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"set icon error: %@",error);
            }
            NSLog(@"current icon's name -> %@",iconName);
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
