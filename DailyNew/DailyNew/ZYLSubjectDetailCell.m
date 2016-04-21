//
//  ZYLSubjectDetailCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSubjectDetailCell.h"
#import "Header.h"

@implementation ZYLSubjectDetailCell
{
    UIImageView *image;
    UIImageView *newimage;
    UILabel  *lable;
    UILabel *discount;
    UILabel *price;
    UILabel *oreprice;
}

+(id)subjectCellWithTableView:(UITableView *)tableView{
    
    
    NSString *str = @"cell";
    ZYLSubjectDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[ZYLSubjectDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
    
    
    newimage = [[UIImageView alloc] init];
    [image addSubview:newimage];
    
    discount = [[UILabel alloc] init];
    [image addSubview:discount];
    discount.alpha = 0.6;
    discount.backgroundColor = [UIColor grayColor];
    discount.textColor = [UIColor whiteColor];
    discount.font = [UIFont systemFontOfSize:13];
    
    price = [[UILabel alloc] init];
    price.textColor = [UIColor redColor];
    [lable addSubview:price];
    price.font = [UIFont systemFontOfSize:15];
    
    oreprice = [[UILabel alloc] init];
    [lable addSubview:oreprice];
    oreprice.font = [UIFont systemFontOfSize:15];
    
    
}

-(void)setModel:(ZYLSubjectDetailModel *)model{
    _model = model;
    
    CGFloat w = ScreenWidth/2.0 - 10;
    CGFloat h = model.cellHeight - 10;
    CGFloat x = 5;
    CGFloat y = 5;
    lable.frame = CGRectMake(x, y, w, h);
   
   
    image.frame = CGRectMake(0, 0, w, h - 30);
    [image sd_setImageWithURL:[NSURL URLWithString:model.url]];
    
    
    discount.frame = CGRectMake(w - 40, h-30-20, 40, 20);
    discount.text = [NSString stringWithFormat:@"%@折",model.discount];
    
    newimage.frame = CGRectMake(10, 0, 40, 38);
    [newimage sd_setImageWithURL:[NSURL URLWithString:model.tagImgUrl]];
    
    price.text = [NSString stringWithFormat:@"￥%@",model.price];
    price.frame = CGRectMake(0, h-30, w/2, 30);
    
    
    oreprice.text = [NSString stringWithFormat:@"原价:￥%@",model.originalPrice];
    oreprice.frame = CGRectMake(w/2, h-30, w/2, 30);
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, oreprice.frame.size.width-5, 2)];
    [oreprice addSubview:la];
    la.backgroundColor = [UIColor grayColor];
    
}

@end
