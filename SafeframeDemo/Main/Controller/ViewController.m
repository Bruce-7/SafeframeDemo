//
//  ViewController.m
//  SafeframeDemo
//
//  Created by HeDong on 16/6/5.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import "ViewController.h"
#import "HDDrawTextField.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet HDDrawTextField *drawTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.drawTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickShowPWD:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:HDDrawTextFieldIsShowPasswordNotification object:nil];
}

- (IBAction)clickOk:(UIButton *)sender
{
    NSLog(@"密码:%@", self.drawTextField.text);
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.testView.transform = CGAffineTransformMakeTranslation(0, -100.0);
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.testView.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

@end
