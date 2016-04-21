//
//  ZYLSubjectsCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSubjectsCell.h"
#import "ZYLSubjectExerciseModel.h"

@interface ZYLSubjectsCell() 
@property (weak, nonatomic) IBOutlet UIImageView *imurl;

@end

@implementation ZYLSubjectsCell

+(id)subjectCellWithTableView:(UITableView *)tableView{
    return [self baseCellWithTableView:tableView];
}

-(void)setBaseModel:(ZYLBaseModel *)baseModel{
    _baseModel = baseModel;
    
    ZYLSubjectExerciseModel *subjectsModel = (ZYLSubjectExerciseModel *)baseModel;
    
    [_imurl sd_setImageWithURL:[NSURL URLWithString:subjectsModel.imgUrl]];
    
}
- (IBAction)shar:(id)sender {
    
    if (self.blockUM) {
        self.blockUM();
    }
}
- (IBAction)collect:(id)sender {
    
    
    UIButton *btn = sender;
    if (!btn.selected) {
        btn.selected = YES;
        [btn setTitle:@" 取消收藏" forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"fav_select"] forState:UIControlStateSelected];
        return;
    }
    btn.selected = NO;
    [btn setTitle:@" 收藏" forState:UIControlStateNormal];
    
//    ZYLDatabass *dm = [ZYLDatabass sharedInstance];
//    NSArray *data =[dm recordWithRecordId:_baseModel.typeId];
//    if (data) {
//        btn.selected = NO;
//        [btn setTitle:@" 收藏" forState:UIControlStateNormal];
//        [dm re]
//    }
//    else{
//        btn.selected = NO;
//        [btn setTitle:@" 收藏" forState:UIControlStateNormal];
//        
//    }
    //收藏
    //如果不存在
//    if (![dm isExistsRecordWithAppModel:_baseModel.typeName recordType:RecordTypeFavorite]) {
//        [dm addRecordWithAppModel:ws.moedl recordType:RecordTypeFavorite];
////        [button setTitle:@"已收藏" forState:UIControlStateNormal];
//        btn.selected = YES;
//    }else{
//        //取消收藏
//        [dm removeRecordWithAppModel:ws.moedl recordType:RecordTypeFavorite];
////        [button setTitle:@"收藏" forState:UIControlStateNormal];
//        btn.selected = NO;
//    }

}

@end
