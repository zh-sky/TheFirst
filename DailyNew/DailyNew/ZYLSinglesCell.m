//
//  ZYLSinglesCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSinglesCell.h"
#import "ZYLSingleModel.h"

@interface ZYLSinglesCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgurl;
@property (weak, nonatomic) IBOutlet UILabel *title;


@end

@implementation ZYLSinglesCell

+(id)singleWithTableView:(UITableView *)tableView{
    return [self baseCellWithTableView:tableView];
}

-(void)setBaseModel:(ZYLBaseModel *)baseModel{
    _baseModel = baseModel;
    ZYLSingleModel *model = (ZYLSingleModel *)baseModel;
    [_imgurl sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    _title.text = model.title;
}

- (IBAction)share:(id)sender {
    
    if (self.blockUM) {
        self.blockUM();
    }
}
- (IBAction)collect:(id)sender {
}


@end
