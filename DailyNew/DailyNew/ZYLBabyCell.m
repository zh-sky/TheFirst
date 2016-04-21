//
//  ZYLBabyCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLBabyCell.h"
#import "Header.h"

@interface ZYLBabyCell()


@end

@implementation ZYLBabyCell
{
    UIImageView *image;
}

+(id)babyCellWithTableView:(UITableView *)tableView{
 
    
    NSString *str = @"cell";
    ZYLBabyCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[ZYLBabyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];;
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
    image = [[UIImageView alloc] init];
    [self addSubview:image];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setModel:(ZYLBabyCellModel *)model{
    
    _model = model;
    
    
    
    CGFloat x = 5;
    CGFloat y = 5;
    CGFloat w = ScreenWidth ;
    CGFloat h = model.cellHeight  ;
//    CGFloat h = w / model.width.floatValue * model.height.floatValue ;

    image.frame = CGRectMake(x,y,w-10,h-10);
    
    
    [image sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    
    image.center = CGPointMake(w/2, h/2);
    
}

@end
