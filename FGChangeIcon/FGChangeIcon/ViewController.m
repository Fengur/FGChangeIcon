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
        exit(0);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
