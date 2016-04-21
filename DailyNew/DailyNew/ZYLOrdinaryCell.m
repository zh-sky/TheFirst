//
//  ZYLTOrdinaryCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLOrdinaryCell.h"
#import "ZYLOrdinaryGoodsModel.h"
#import "Header.h"

@interface ZYLOrdinaryCell()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *url;

@end

@implementation ZYLOrdinaryCell

+(id)ordinaryCellWithTableView:(UITableView *)tableView{
    
    return [self baseCellWithTableView:tableView];
}

-(void)setBaseModel:(ZYLBaseModel *)baseModel{
    
    _baseModel = baseModel;
    
    ZYLOrdinaryGoodsModel *ordinaryModel = (ZYLOrdinaryGoodsModel *)baseModel;
    
    _title.text = ordinaryModel.title;
    _price.text = [NSString stringWithFormat:@"￥%@",ordinaryModel.price];
    [_url sd_setImageWithURL:[NSURL URLWithString:ordinaryModel.url]];

    
    
}
- (IBAction)share:(id)sender {
    
    
    if (self.blockUM) {
        self.blockUM();
    }
//    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"507fcab25270157b37000010" shareText:@"分享内容" shareImage:[UIImage imageNamed:@"分享图片"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil] delegate:nil];
    
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
//    ZYLOrdinaryGoodsModel *model = (ZYLOrdinaryGoodsModel *)_baseModel;
//    ZYLModel *m = [[ZYLModel alloc] init];
//    //收藏
//    //如果不存在
//        if (![dm isExistsRecordWithAppModel: recordId:<#(NSString *)#>:model.typeId recordType:RecordTypeFavorite]) {
//            [dm addRecordWithAppModel:ws.moedl recordType:RecordTypeFavorite];
//    //        [button setTitle:@"已收藏" forState:UIControlStateNormal];
//            btn.selected = YES;
//        }else{
//            //取消收藏
//            [dm removeRecordWithAppModel:ws.moedl recordType:RecordTypeFavorite];
//    //        [button setTitle:@"收藏" forState:UIControlStateNormal];
//            btn.selected = NO;
//        }
}

@end
