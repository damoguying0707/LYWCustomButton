//
//  LYWCustomButton.m
//  LYW
//
//  Created by vincent.li on 2017/1/7.
//  Copyright © 2017年 LYW. All rights reserved.
//

#import "LYWCustomButton.h"

@implementation LYWCustomButton

-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title andImage:(NSString *)imageName{

    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageNamed:imageName];
        self.imageV = imageV;
        [self addSubview:imageV];
        
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.text = title;
        self.titleLab = titleLab;
        [self addSubview:titleLab];
    }
    return self;
}

-(void)layoutSubviews{
    
    //文字在图片上面
    if (_buttonType == titleTopType) {
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(_titleLabLeftMargin);
            make.top.equalTo(self).offset(_titleLabTopMargin);
            make.right.equalTo(self).offset(_titleLabRightMargin);
        }];
        
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(_titleLab.mas_bottom).offset(_imageVTopMargin);
            make.center.equalTo(self);
            
        }];
        
        //文字在图片左边
    }else if (_buttonType == titleLeftType){
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(_titleLabLeftMargin);
            make.top.equalTo(self).offset(_titleLabTopMargin);
            
        }];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_titleLab.mas_right).offset(_imageVLeftMargin);
            make.centerY.equalTo(_titleLab.mas_centerY);
            
        }];
        
        //文字在图片右边
    }else if (_buttonType == titleRightType){
        
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(_imageVLeftMargin);
            make.top.equalTo(self).offset(_imageVTopMargin);
        }];
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_imageV.mas_right).offset(_titleLabLeftMargin);
            make.top.equalTo(self).offset(_titleLabTopMargin);
            
        }];
        //文字在图片的下方
    }else{
        
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(_imageVTopMargin);
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(_titleLab.mas_top).offset(3);
//            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(_imageV.mas_bottom).offset(_titleLabTopMargin);
            make.center.equalTo(_imageV);
            make.bottom.equalTo(self).offset(-3);
//          make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    _imageV.image = [UIImage imageNamed:_highlightImageName];
    _titleLab.textColor = _hightLightTitleColor;
    self.eventCallBackBlock();
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _imageV.image = [UIImage imageNamed:_normageImageName];
    _titleLab.textColor = _normalTitleColor;

}


@end
