//
//  ZYLTryCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLTryCell.h"
#import "ZYLTryModel.h"

@interface ZYLTryCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgurl;


@end

@implementation ZYLTryCell

+(id)tryWithTableView:(UITableView *)tableView{
    
    return [self baseCellWithTableView:tableView];
}

-(void)setBaseModel:(ZYLBaseModel *)baseModel{
    _baseModel = baseModel;
    
    ZYLTryModel *tryModel = (ZYLTryModel *)baseModel;
    
    [_imgurl sd_setImageWithURL:[NSURL URLWithString:tryModel.imgUrl]];
    
}

@end
