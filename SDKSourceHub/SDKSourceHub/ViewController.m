//
//  ViewController.m
//  SDKSourceHub
//
//  Created by Yang Long on 2021/8/3.
//

#import "ViewController.h"
#import "SDKSourceHub-Swift.h"
#import <YYModel/YYModel.h>
#import "Person.h"


void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"This is my custom imp ...");
}

@interface ViewController ()

@property (nonatomic, strong) Person *aPerson;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _aPerson = [[Person alloc] init];
    _aPerson.name = @"JACK";
    
    YYClassInfo *vcClassInfo = [YYClassInfo classInfoWithClass:UIViewController.class];
    NSLog(@"=====%@", vcClassInfo);
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self performSelector:@selector(resolveThisMethodDynamically)];
    [self performSelector:@selector(printName)];
    NSLog(@"=========encode: %s", @encode(long long));
    
    property_getAttributes(nil);
}


- (IBAction)pushIGList:(id)sender {
    IGListDemoViewController *vc = [[IGListDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    if (sel == @selector(resolveThisMethodDynamically)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    if ([self.aPerson respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self.aPerson];
    } else {
        [super forwardInvocation:anInvocation];
    }
    
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [self.aPerson methodSignatureForSelector:aSelector];
    }
    return signature;
}

@end
