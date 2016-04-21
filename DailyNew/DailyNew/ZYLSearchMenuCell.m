//
//  ZYLSearchMenuCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSearchMenuCell.h"

@implementation ZYLSearchMenuCell
{
    UIButton *_btn;
    UIButton *lastBtn;
 
}

+(id)searchMenuWithMenu:(UITableView *)tableView{
    return [[self alloc] init];
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self creatCell];
    }
    return self;
}

-(void)creatCell{
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.contentView addSubview:_btn];
    
    _btn.frame = CGRectMake(0, 0, 100, 60);
    
    
    [_btn setBackgroundImage:[UIImage imageNamed:@"MenuLeftCellSelect"] forState:UIControlStateSelected];
    
    [_btn setBackgroundImage:[UIImage imageNamed:@"menuLeftCellBg"] forState:UIControlStateNormal];
    
    [_btn addTarget:self action:@selector(btnSeclt:) forControlEvents:UIControlEventTouchUpInside];
    _btn.titleLabel.font = [UIFont systemFontOfSize:20];
    
 
}

-(void)btnSeclt:(UIButton *)btn{
    
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    btn.tag = _rowteger;
    
    if (self.block) {
        self.block(btn);
    }
}

-(void)setRowteger:(NSInteger)rowteger{
    _rowteger = rowteger;
    
}

-(void)setTitleBtn:(NSArray *)titleBtn{
    _titleBtn = titleBtn;
    [_btn setTitle:self.titleBtn[_rowteger] forState:UIControlStateNormal];
    
}

-(void)setImageBtn:(NSArray *)imageBtn
{
    _imageBtn = imageBtn;
    
    [_btn setImage:[UIImage imageNamed:_imageBtn[_rowteger]] forState:UIControlStateNormal];
}

-(void)setSelectImageBtn:(NSArray *)selectImageBtn{
    _selectImageBtn = selectImageBtn;
    [_btn setImage:[UIImage imageNamed:selectImageBtn[_rowteger]] forState:UIControlStateSelected];
}



@end
