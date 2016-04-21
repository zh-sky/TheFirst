//
//  ZYLMyMenuCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLMyMenuCell.h"
#import "Header.h"

@interface ZYLMyMenuCell()
@property (weak, nonatomic) IBOutlet UIImageView *urlImage;


@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@end

@implementation ZYLMyMenuCell

+(id)myMunuCellWithTableView:(UITableView *)tableView{
    
    return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)setModel:(ZYLMyMenuModel *)Model{
    
    _Model = Model;
    [_urlImage sd_setImageWithURL:[NSURL URLWithString:Model.iconUrl]];
    _titleLable.text = Model.title;
}

@end
