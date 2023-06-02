//
//  ViewController.m
//  UIColorPickerSet
//
//  Created by 纵昂 on 2023/5/29.
//

#import "ViewController.h"

@interface ViewController ()<UIColorPickerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIColorPickerViewController *colourPickerVC = [[UIColorPickerViewController alloc] init];
//  遵循代理
    colourPickerVC.delegate = self;
//  在颜色选择器上设置所选颜色，并在用户更改选择时更新。
    colourPickerVC.selectedColor = self.view.backgroundColor;
//  如果设置为“NO”，用户只能选择完全不透明的颜色。
    colourPickerVC.supportsAlpha = NO;
    [self presentViewController:colourPickerVC animated:YES completion:nil];
    
    
}


#pragma mark - Informs the delegate when the user selects a color.当用户选择颜色时通知代理。
- (void)colorPickerViewControllerDidSelectColor:(UIColorPickerViewController *)viewController{
    UIColor *cpSelectedColour = viewController.selectedColor;
    self.view.backgroundColor = cpSelectedColour;
}


/*
 In presentations (except popovers) the color picker shows a close button. If the close button is tapped,
 在演示文稿中(除了弹出窗口)，颜色选择器显示一个关闭按钮。如果按下关闭按钮，
 */

//the view controller is dismissed and `colorPickerViewControllerDidFinish:` is called. Can be used to
//animate alongside the dismissal.
#pragma mark -Informs the delegate that the user dismissed the color picker. 开始解除的视图控制器。
- (void)colorPickerViewControllerDidFinish:(UIColorPickerViewController *)viewController{
    UIColor *cpSelectedColour = viewController.selectedColor;
    self.view.backgroundColor = cpSelectedColour;
}

//#pragma mark -Informs the delegate when a user selects a color, indicating whether the update is part of a continuous user interaction.
//#pragma mark -当用户选择颜色时通知代理，指示更新是否是连续用户交互的一部分。
//- (void)colorPickerViewController:(UIColorPickerViewController *)viewController
//                   didSelectColor:(UIColor *)color
//                     continuously:(BOOL)continuously{
//    这个代理方法不用写，目前业务用不到，知道就行
//}

@end
