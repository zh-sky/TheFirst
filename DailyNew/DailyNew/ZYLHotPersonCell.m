//
//  ZYLHotPersonCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLHotPersonCell.h"
#import "Header.h"
@implementation ZYLHotPersonCell

{
    UIImageView *image;
    UILabel *title;
    UILabel *lable;
}



+(id)hotPersonCellWithTableView:(UITableView *)tableView{
    
    
    NSString *str = @"cell";
    ZYLHotPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[ZYLHotPersonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
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
    image.layer.cornerRadius = 5;
    
    title = [[UILabel alloc] init];
    [lable addSubview:title];
    title.layer.cornerRadius = 5;
    title.font = [UIFont systemFontOfSize:15];
    title.textAlignment = NSTextAlignmentCenter;
    
    
}




-(void)setPersonModel:(ZYLHotPersonModel *)personModel{
    _personModel = personModel;
    
    
    
    CGFloat w = ScreenWidth/2.0 - 10;
    CGFloat h = personModel.cellHeight - 10;
    CGFloat x = 5;
    CGFloat y = 5;
    
    lable.frame = CGRectMake(x, y, w, h);
    
    CGFloat imh = w/personModel.picWidth.floatValue*personModel.picHeight.floatValue;
    
    image.frame = CGRectMake(0, 0, w, imh);
    [image sd_setImageWithURL:[NSURL URLWithString:personModel.imgUrl]];
    
    title.frame = CGRectMake(0, CGRectGetMaxY(image.frame), image.frame.size.width, 30);
    title.text = personModel.title;
}




@end
