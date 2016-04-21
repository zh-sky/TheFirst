//
//  ZYLSnsLowCell.m
//  DailyNew
//
//  Created by qianfeng on 15/11/1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsLowCell.h"

@implementation ZYLSnsLowCell

+(id)snsLowCellWithTableView:(UITableView *)tableView{
    
    
    NSString *str = @"cell";
    ZYLSnsLowCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[ZYLSnsLowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
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
    
    
}

-(void)setModel:(ZYLSnsLowModel *)model{
    _model = model;
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    
    [self addSubview:lable];
    
    lable.text = model.level.stringValue;
}

@end
