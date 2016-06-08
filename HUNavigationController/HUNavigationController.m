//
//  XKRWNavigationController.m
//  XKRW
//
//  Created by 忘、 on 15/7/7.
//  Copyright (c) 2015年 XiKang. All rights reserved.
//

#import "HUNavigationController.h"

@interface HUNavigationController ()

@end

@implementation HUNavigationController


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController withNavigationBarType:(NavigationBarType) type
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self setCustomNavigationbarStyleWithType:type];
  
    }
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    if (self = [self initWithRootViewController:rootViewController withNavigationBarType:NavigationBarTypeDefault]) {
        
    }
    return self;
}

#pragma mark - 
- (void)viewDidLoad
{
    __weak HUNavigationController *weakSelf = self;

    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        
        self.interactivePopGestureRecognizer.delegate = (id)weakSelf;
        
        self.delegate = (id)weakSelf;
    }
}

#pragma mark -


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setCustomNavigationbarStyleWithType:(NavigationBarType) type {
    
   
    [self.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
 
    
    if (type == NavigationBarTypeTransparency) {
        CGRect frame = self.navigationBar.frame;
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+20)];
        imageView.image = [UIImage imageNamed:@"navigationBar"];
        imageView.alpha = 0;
        [self.view insertSubview:imageView belowSubview:self.navigationBar];
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow"] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setShadowImage:[UIImage new]];
        
       
    }else
    {
  
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar"] forBarMetrics:UIBarMetricsDefault];
  
    }
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeZero;
    
    NSDictionary *temp = @{NSFontAttributeName              : [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName   : [UIColor whiteColor],
                           NSShadowAttributeName            : shadow,
                           NSVerticalGlyphFormAttributeName : [NSNumber numberWithInteger:0]};
    
    [self.navigationBar setTitleTextAttributes:temp];
}


- (void)navigationBarChangeFromDefaultNavigationBarToTransparencyNavigationBar
{
    if (imageView == nil) {
        CGRect frame = self.navigationBar.frame;
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+20)];
        imageView.image = [UIImage imageNamed:@"navigationBar"];
        [UIView animateWithDuration:0.2 animations:^{
            imageView.alpha = 0;
        } completion:^(BOOL finished) {
        }];
        [self.view insertSubview:imageView belowSubview:self.navigationBar];
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow"] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setShadowImage:[UIImage new]];
        self.navigationBar.layer.masksToBounds = YES;
    }
}

- (void)navigationBarChangeFromBlackHalfTransNavigationBarToTransparencyNavigationBar {
    if (imageView == nil) {
        CGRect frame = self.navigationBar.frame;
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+20)];
        imageView.image = [UIImage imageNamed:@"userArticle_navigationBar"];
        [UIView animateWithDuration:0.2 animations:^{
            imageView.alpha = 0;
        } completion:^(BOOL finished) {
        }];
        [self.view insertSubview:imageView belowSubview:self.navigationBar];
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow"] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.layer.masksToBounds = YES;
        [self.navigationBar setShadowImage:[UIImage new]];
    }

}


- (void)navigationBarChangeFromTransparencyNavigationBarToDefaultNavigationBar
{
    if (imageView != nil) {
        [imageView removeFromSuperview];
        imageView = nil;
    }
    
    [self.navigationBar  setShadowImage:[self createImageWithColor:[self colorFromHexString:@"#AAAAAA"]]];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.layer.masksToBounds = NO;
}


- (void)navigationBarChangeFromDefaultNavigationBarToBlackHarfTransNavigationBar {
    if (imageView != nil) {
        [imageView removeFromSuperview];
        imageView = nil;
    }
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"userArticle_navigationBar"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.layer.masksToBounds = NO;
    
}


- (void)changeImageViewAlpha:(CGFloat) tableViewSlideDistance  andHeaderViewHeight:(CGFloat)height AndViewController:(UIViewController *)viewController andnavigationBarTitle:(NSString *)title
{
    if (tableViewSlideDistance<64) {
        viewController.title = title;
        [UIView animateWithDuration:.4 animations:^{
            imageView.alpha = 1;
        }];
    }else
    {
        viewController.title = @"";
        imageView.alpha = 0;
    }
}


- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
