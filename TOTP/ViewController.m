//
//  ViewController.m
//  TOTP
//
//  Created by Shashank Vaibhav on 20/03/2017.
//  Copyright © 2017 JustRide. All rights reserved.
//

#import "ViewController.h"
#import "TOTPGenerator.h"
#import "MF_Base32Additions.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self generatePIN];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)generatePIN
{
    NSString *secret = @"qwertyuiopasdfghjkl";
    NSData *secretData =  [NSData dataWithBase32String:secret];
    
    NSInteger digits = 6;
    NSInteger period = 30;
    
    
    NSDate *now = [NSDate date];
    long timestamp = (long)[now timeIntervalSince1970];
    if(timestamp % 30 != 0){
        timestamp -= timestamp % 30;
    }
    
    TOTPGenerator *generator = [[TOTPGenerator alloc] initWithSecret:secretData algorithm:kOTPGeneratorSHA1Algorithm digits:digits period:period];
    
    NSString *pin = [generator generateOTPForDate:[NSDate dateWithTimeIntervalSince1970:timestamp]];
    
    NSLog(@"%@",pin);
}



@end
