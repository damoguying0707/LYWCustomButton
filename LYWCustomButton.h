//
//  LYWCustomButton.h
//  LYW
//
//  Created by vincent.li on 2017/1/7.
//  Copyright © 2017年 LYW. All rights reserved.
//

/*
 
 使用方法Example：
 
 LYWCustomButton *customBtn = [[LYWCustomButton alloc] initWithFrame:CGRectZero andTitle:@"删除" andImage:@"icon_del"];
 customBtn.backgroundColor = WhiteColor;
 customBtn.buttonType = titleBottomType;
 
 customBtn.normageImageName = @"icon_del";
 customBtn.highlightImageName = @"icon_right";
 customBtn.normalTitleColor = [UIColor redColor];
 customBtn.hightLightTitleColor = [UIColor blueColor];
 
 customBtn.titleLab.font = [UIFont systemFontOfSize:12];
 customBtn.titleLab.textColor = BlackTextColor;
 customBtn.imageVTopMargin = 5;
 customBtn.titleLabTopMargin = 5;
 
 customBtn.eventCallBackBlock = ^(){
 
 NSLog(@"call Your Target Here");
 
 };
 
 [self.view addSubview:customBtn];
 
 
 */

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    
    titleLeftType,
    
    titleTopType,
    
    titleBottomType,
    
    titleRightType
    
}CustomeButtonType;


typedef void(^ClickedEventCallBackBlock)(void);

@interface LYWCustomButton : UIView

/**
 按钮图片
 */
@property(nonatomic, strong)UIImageView *imageV;

/**
 按钮标题
 */
@property(nonatomic, strong)UILabel *titleLab;

/**
 按钮类型（即文字在图片的位置，上下左右）
 */
@property(nonatomic, assign)CustomeButtonType buttonType;

/**
 图片左边距
 */
@property(nonatomic, assign)CGFloat imageVLeftMargin;

/**
 图片右边距
 */
@property(nonatomic, assign)CGFloat imageVRightMargin;

/**
 图片下边距
 */
@property(nonatomic, assign)CGFloat imageVBottomMargin;

/**
 图片上边距
 */
@property(nonatomic, assign)CGFloat imageVTopMargin;

/**
 标题左边距
 */
@property(nonatomic, assign)CGFloat titleLabLeftMargin;

/**
 标题右边距
 */
@property(nonatomic, assign)CGFloat titleLabRightMargin;

/**
 标题下边距
 */
@property(nonatomic, assign)CGFloat titleLabBottomMargin;

/**
 标题上边距
 */
@property(nonatomic, assign)CGFloat titleLabTopMargin;

/**
 正常状态下图片
 */
@property(nonatomic, copy)NSString *normageImageName;

/**
 高亮状态下图片
 */
@property(nonatomic, copy)NSString *highlightImageName;

/**
 正常状态下标题颜色
 */
@property(nonatomic, strong)UIColor *normalTitleColor;

/**
 高亮状态下标题颜色
 */
@property(nonatomic, strong)UIColor *hightLightTitleColor;

/**
 按钮点击事件回调Block
 */
@property(nonatomic, copy)ClickedEventCallBackBlock eventCallBackBlock;

/**
 初始化方法

 @param frame 按钮视图大小
 @param title 按钮标题
 @param imageName 按钮图片
 @return 返回类型
 */
-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title andImage:(NSString *)imageName;

@end
