//
//  ZYLBaseNewsCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLBaseNewsCell.h"

@implementation ZYLBaseNewsCell

+(id)baseCellWithTableView:(UITableView *)tableView{
//    NSString *className = NSStringFromClass([self class]);
//    
//    //加载nib
//    UINib *nib = [UINib nibWithNibName:className bundle:nil];
//    //注册
//    [tableView registerNib:nib forCellReuseIdentifier:className];
//    
//    return [tableView dequeueReusableCellWithIdentifier:className];
    
   return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
