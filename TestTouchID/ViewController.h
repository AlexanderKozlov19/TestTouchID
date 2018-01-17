//
//  ViewController.h
//  TestTouchID
//
//  Created by Alexander Kozlov on 14.10.17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnCheckTouchID;
- (IBAction)onButtonTouch:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@property (nonatomic, strong) LAContext *laContext;


@end

