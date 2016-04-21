//
//  ZYLTypeCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLTypeCell.h"
#import "Header.h"

@implementation ZYLTypeCell
{
    UILabel *lable;
    UIImageView *image;
    UILabel *price;
    UIButton *btn;
    
}

+(id)typeCellWithTableView:(UITableView *)tableView{
    
    
    NSString *str = @"cell";
    ZYLTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[ZYLTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];;
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createUI];
    }
    return self;
}

-(void)createUI{
    
    lable = [[UILabel alloc] init];
    [self addSubview:lable];
    lable.clipsToBounds = YES;
    lable.layer.cornerRadius = 5;
    lable.layer.borderColor = [UIColor grayColor].CGColor;
    lable.layer.borderWidth = 1;
    lable.userInteractionEnabled = YES;
    
    image = [[UIImageView alloc] init];
    [lable addSubview:image];
    image.layer.cornerRadius  =5;
    
    price = [[UILabel alloc] init];
    [lable addSubview:price];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lable addSubview:btn];
    [btn setTitle:@" 收藏" forState:UIControlStateNormal];
    [btn setTitle:@" 取消收藏" forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setImage:[UIImage imageNamed:@"fav_select"] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:@"fav_normal"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

-(void)collect:(UIButton *)button{
    if (button.selected) {
        button.selected = NO;
        return;
    }
    button.selected = YES;
}

-(void)setModel:(ZYLTypeModel *)model{
    _model = model;
    
    CGFloat w = ScreenWidth/2.0 - 10;
    CGFloat h = model.cellHeight - 10;
    CGFloat x = 5;
    CGFloat y = 5;
    
    lable.frame = CGRectMake(x, y, w, h);
    
    CGFloat imh = w/model.picWidth.floatValue*model.picHeight.floatValue;
    
    image.frame = CGRectMake(0, 0, w, imh);
    [image sd_setImageWithURL:[NSURL URLWithString:model.url]];
    
    price.frame = CGRectMake(0, imh, w/2, 30);
    price.text = [NSString stringWithFormat:@"￥%@",model.price];
    
    btn.frame = CGRectMake(w/2, imh, w/2, 30);
    
    
}



@end
