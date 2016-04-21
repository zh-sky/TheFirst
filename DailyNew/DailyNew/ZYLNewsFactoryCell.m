//
//  ZYLNewsFactoryCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLNewsFactoryCell.h"
#import "ZYLSubjectsCell.h"
#import "ZYLOrdinaryCell.h"
#import "ZYLTryCell.h"
#import "ZYLSinglesCell.h"

@implementation ZYLNewsFactoryCell

+(ZYLBaseNewsCell *)cellWithNews:(ZYLBaseModel *)newsModel andTableView:(UITableView *)tableView{
    
    ZYLBaseNewsCell *cell = nil;
    if ([newsModel.typeName isEqualToString:@"主题活动"]) {
        cell = [ZYLSubjectsCell subjectCellWithTableView:tableView];
        cell.baseModel = newsModel;
    }
    else if ([newsModel.typeName isEqualToString:@"普通商品"]) {
        cell = [ZYLOrdinaryCell ordinaryCellWithTableView:tableView];
        cell.baseModel = newsModel;
    }
    else if ([newsModel.typeName isEqualToString:@"虚拟试衣"]) {
        cell = [ZYLTryCell tryWithTableView:tableView];
        cell.baseModel = newsModel;
    }
    
    else if ([newsModel.typeName isEqualToString:@"她社区"]) {
        cell = [ZYLTryCell tryWithTableView:tableView];
        cell.baseModel = newsModel;
    }
    else if ([newsModel.typeName isEqualToString:@"主推单品"]) {
        cell = [ZYLSinglesCell singleWithTableView:tableView];
        cell.baseModel = newsModel;
    }
    else{
        cell = [ZYLTryCell tryWithTableView:tableView];
        cell.baseModel = newsModel;
    }
    
    
    return cell;
    
}

@end
