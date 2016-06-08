//
//  XKRWNavigationController.h
//  XKRW
//
//  Created by 忘、 on 15/7/7.
//  Copyright (c) 2015年 XiKang. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 * NavigationBarType
 */
typedef NS_ENUM(NSInteger, NavigationBarType) {
    NavigationBarTypeDefault =0, //默认的
    NavigationBarTypeTransparency   //透明的
};


@interface HUNavigationController : UINavigationController
{
    BOOL changeAlpha;
    UIImageView *imageView;
}

/**
 *  初始化NavigationBarController
 *
 *  @param rootViewController rootVC
 *  @param type               NavigationBar 类型
 *
 *  @return
 */
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController withNavigationBarType:(NavigationBarType) type;


// default style
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

/**
 *  从默认的navigationBar设置为透明的navigationbar
 */
- (void)navigationBarChangeFromDefaultNavigationBarToTransparencyNavigationBar;

/**
 *  从透明的navigationBar设置为默认的navigationbar
 */
- (void)navigationBarChangeFromTransparencyNavigationBarToDefaultNavigationBar;

/**
 *  从透明的navigationBar设置为黑色半透明的navigationbar
 */
- (void)navigationBarChangeFromDefaultNavigationBarToBlackHarfTransNavigationBar;

/**
 *  从黑色半透明的navigationBar设置为透明的navigationBar
 */
- (void)navigationBarChangeFromBlackHalfTransNavigationBarToTransparencyNavigationBar;


/**
 *  <#Description#>
 *
 *  @param tableViewSlideDistance <#tableViewSlideDistance description#>
 *  @param height                 <#height description#>
 *  @param viewController         <#viewController description#>
 *  @param title                  <#title description#>
 */
- (void)changeImageViewAlpha:(CGFloat) tableViewSlideDistance  andHeaderViewHeight:(CGFloat)height AndViewController:(UIViewController *)viewController andnavigationBarTitle:(NSString *)title;



@end
