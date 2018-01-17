//
//  ViewController.m
//  TestTouchID
//
//  Created by Alexander Kozlov on 14.10.17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.laContext = [[LAContext alloc] init];
   // self.laContext.touchIDAuthenticationAllowableReuseDuration = 1;
    
    self.btnCheckTouchID.layer.borderWidth = 1.0;
    self.btnCheckTouchID.layer.cornerRadius = 4.0;
    self.btnCheckTouchID.layer.borderColor = [[UIColor blackColor] CGColor];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onButtonTouch:(id)sender {
    NSError *err1 = nil;
    BOOL bRes = [self.laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
error:&err1];
    
    if ( !bRes ) {
        self.lblStatus.text = err1.description;
        return;
    }
    
    [self.laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"TestTouchID" reply:^(BOOL success, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                self.lblStatus.text = @"Success!";
               // [self.laContext invalidate];
            } else {
                self.lblStatus.text = [@"Error:" stringByAppendingString:error.description ];
               // [self.laContext invalidate];
            }
        });
    }];
    
        
    
    
}
@end
