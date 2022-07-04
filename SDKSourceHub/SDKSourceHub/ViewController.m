//
//  ViewController.m
//  SDKSourceHub
//
//  Created by Yang Long on 2021/8/3.
//

#import "ViewController.h"
#import "SDKSourceHub-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pushIGList:(id)sender {
    IGListDemoViewController *vc = [[IGListDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
