//
//  ZYLSearchShopCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSearchShopCell.h"
#import "Header.h"

@interface ZYLSearchShopCell()

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@property (weak, nonatomic) IBOutlet UIButton *btn3;

@end

@implementation ZYLSearchShopCell

+(id)searchShopWith:(UITableView *)tableview{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)setModel:(ZYLSearchShopModel *)model{
    
    _model = model;
    
    
}
- (IBAction)btn1:(id)sender {
    UIButton *btn = sender;
    if (self.block) {
        ZYLSearchShopModel *model = _modelArray[btn.tag - 1];
        NSString *url = [NSString stringWithFormat:@"%@&tid=%@",Search_type,model.tagID];
        self.block (model.tagName,model.tagID.stringValue);
    }
}
- (IBAction)btn2:(id)sender {
    UIButton *btn = sender;
    if (self.block) {
        ZYLSearchShopModel *model = _modelArray[btn.tag - 1];
        NSString *url = [NSString stringWithFormat:@"%@&tid=%@",Search_type,model.tagID];
        self.block (model.tagName,model.tagID.stringValue);
    }
}
- (IBAction)btn3:(id)sender {
    UIButton *btn = sender;
    if (self.block) {
        ZYLSearchShopModel *model = _modelArray[btn.tag - 1];
        NSString *url = [NSString stringWithFormat:@"%@&tid=%@",Search_type,model.tagID];
        self.block (model.tagName,model.tagID.stringValue);
    }
}

-(void)setModelArray:(NSArray *)modelArray{
    _modelArray = modelArray;
    _btn1.tag = 1;
    _btn2.tag = 2;
    _btn3.tag = 3;
    _btn1.adjustsImageWhenHighlighted = NO;
    _btn2.adjustsImageWhenHighlighted = NO;
    _btn3.adjustsImageWhenHighlighted = NO;
    if (modelArray.count == 3) {
    
    ZYLSearchShopModel *model1 = modelArray[0];
    
    if (model1.flag.intValue == 1) {
        [_btn1 setBackgroundImage:[UIImage imageNamed:@"rightItemSelect"] forState:UIControlStateNormal];
    }
    else{
        [_btn1 setBackgroundImage:[UIImage imageNamed:@"rightItemNormal"] forState:UIControlStateNormal];
    }
    [_btn1 setTitle:model1.tagName forState:UIControlStateNormal];
    
    ZYLSearchShopModel *model2 = modelArray[1];
    if (model2.flag.intValue == 1) {
        [_btn2 setBackgroundImage:[UIImage imageNamed:@"rightItemSelect"] forState:UIControlStateNormal];
    }
    else{
        [_btn2 setBackgroundImage:[UIImage imageNamed:@"rightItemNormal"] forState:UIControlStateNormal];
    }
    [_btn2 setTitle:model2.tagName forState:UIControlStateNormal];
    
    ZYLSearchShopModel *model3 = modelArray[2];
    if (model3.flag.intValue == 1) {
        [_btn3 setBackgroundImage:[UIImage imageNamed:@"rightItemSelect"] forState:UIControlStateNormal];
    }
    else{
        [_btn3 setBackgroundImage:[UIImage imageNamed:@"rightItemNormal"] forState:UIControlStateNormal];
    }
    [_btn3 setTitle:model3.tagName forState:UIControlStateNormal];
    }
    else if(modelArray.count == 2){
        
        ZYLSearchShopModel *model1 = modelArray[0];
        
        if (model1.flag.intValue == 1) {
            [_btn1 setBackgroundImage:[UIImage imageNamed:@"rightItemSelect"] forState:UIControlStateNormal];
        }
        else{
            [_btn1 setBackgroundImage:[UIImage imageNamed:@"rightItemNormal"] forState:UIControlStateNormal];
        }
        [_btn1 setTitle:model1.tagName forState:UIControlStateNormal];
        
        ZYLSearchShopModel *model2 = modelArray[1];
        if (model2.flag.intValue == 1) {
            [_btn2 setBackgroundImage:[UIImage imageNamed:@"rightItemSelect"] forState:UIControlStateNormal];
        }
        else{
            [_btn2 setBackgroundImage:[UIImage imageNamed:@"rightItemNormal"] forState:UIControlStateNormal];
        }
        [_btn2 setTitle:model2.tagName forState:UIControlStateNormal];
        
        _btn3.hidden = YES;
        
    }
    else if(modelArray.count == 1){
        
        ZYLSearchShopModel *model1 = modelArray[0];
        
        if (model1.flag.intValue == 1) {
            [_btn1 setBackgroundImage:[UIImage imageNamed:@"rightItemSelect"] forState:UIControlStateNormal];
        }
        else{
            [_btn1 setBackgroundImage:[UIImage imageNamed:@"rightItemNormal"] forState:UIControlStateNormal];
        }
        [_btn1 setTitle:model1.tagName forState:UIControlStateNormal];
        _btn3.hidden = YES;
        _btn2.hidden = YES;
    }
    
}

@end
