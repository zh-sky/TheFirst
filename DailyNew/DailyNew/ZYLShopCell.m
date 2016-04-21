//
//  ZYLShopCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLShopCell.h"
#import "Header.h"

@interface ZYLShopCell ()

@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIImageView *imageleft;
@property (weak, nonatomic) IBOutlet UIImageView *imageright;

@property (weak, nonatomic) IBOutlet UIButton *btnright;
@property (weak, nonatomic) IBOutlet UILabel *titleLeft;
@property (weak, nonatomic) IBOutlet UILabel *titleRight;
@end

@implementation ZYLShopCell

+(id)shopCellWithTableView:(UITableView *)tableView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)setBtn:(UIButton *)btn{
    _btn = btn;
    btn.layer.cornerRadius = 3;
    btn.layer.borderWidth = 1;
}
-(void)setBtnright:(UIButton *)btnright{
    _btnright = btnright;
    btnright.layer.cornerRadius = 3;
    btnright.layer.borderWidth = 1;
}

-(void)setimage:(ZYLShopCellModel *)model{
    
    [_imageleft sd_setImageWithURL:[NSURL URLWithString:model.url]];
    
    _imageleft.layer.cornerRadius = 5;
    
    _titleLeft.text = [NSString stringWithFormat:@"￥%@",model.price];
    
    
}

-(void)setModelArray:(NSArray *)modelArray{
    _modelArray = modelArray;
    if (modelArray.count == 2) {
        ZYLShopCellModel *model1 = modelArray[0];
        [_imageleft sd_setImageWithURL:[NSURL URLWithString:model1.url]];
        _imageleft.layer.cornerRadius = 5;
        _titleLeft.text = [NSString stringWithFormat:@"￥%@",model1.price];
        
        
        ZYLShopCellModel *model2 = modelArray[1];
        [_imageright sd_setImageWithURL:[NSURL URLWithString:model2.url]];
        _imageright.layer.cornerRadius = 5;
        _titleRight.text = [NSString stringWithFormat:@"￥%@",model2.price];
        return;
    }
    [self setimage:modelArray[0]];
    
    
}
- (IBAction)collectleft:(id)sender {
    UIButton *btn = sender;
    if (btn.selected) {
        btn.selected = YES;
        return;
    }
    btn.selected = NO;
}
- (IBAction)collectRigjht:(id)sender {
    
    UIButton *btn = sender;
    if (btn.selected) {
        btn.selected = YES;
        return;
    }
    btn.selected = NO;
}
- (IBAction)leftbtn:(id)sender {
    
    if (self.ChangePage) {
        ZYLShopCellModel *model = _modelArray[0];
        self.ChangePage(model.sessionData, model.itemId);
    }
}

- (IBAction)rightbtn:(id)sender {
    
    if (self.ChangePage) {
        ZYLShopCellModel *model = _modelArray[1];
        self.ChangePage(model.sessionData, model.itemId);
    }
}


@end
