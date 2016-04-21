//
//  ZYLBabyHeard.m
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLBabyHeard.h"
#import "ZYLBabyShopController.h"
#import "Header.h"


@interface ZYLBabyHeard()

@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *personNumber;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIButton *shopbtn;




@end

@implementation ZYLBabyHeard

+(id)babyHeardWithView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)setModel:(ZYLBabyHeaderModel *)model{
    _model = model;
    _title.text = model.title;
    _price.text = [NSString stringWithFormat:@"￥%@",model.price.stringValue];
    _personNumber.text = [NSString stringWithFormat:@"已有%@人购买",model.volume.stringValue];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(30, 122, 16*model.shopLevelDetail.integerValue, 16)];
    NSString *str;
    if (model.shopLevelOriPic.length > 0) {
        str = [model.shopLevelOriPic substringToIndex:model.shopLevelOriPic.length-4];
    }
    
    [image setImage:[UIImage imageNamed:str]];
    [self addSubview:image];
    UILabel *lable  = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(image.frame), 122, 200, 16)];
    lable.font = [UIFont systemFontOfSize:13];
    lable.text = [NSString stringWithFormat:@"【%@】",model.shopName];
    lable.textColor = [UIColor blueColor];
    [self addSubview:lable];

}


-(void)setShopbtn:(UIButton *)shopbtn{
    _shopbtn = shopbtn;
    shopbtn.layer.cornerRadius = 5;
    shopbtn.layer.borderColor = [UIColor grayColor].CGColor;
    shopbtn.layer.borderWidth = 1;
    
}
- (IBAction)shop:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(changPageInShop:WithShopName:)]) {
        
        NSString *shopUrl = [NSString stringWithFormat:@"%@&sessionData=%@&shopId=%@",SHOP_PAGE,_model.sessionData,_model.shopId.stringValue];
        [self.delegate changPageInShop:shopUrl WithShopName:_model.shopName];
    }
    
}
- (IBAction)buy:(id)sender {
    
     if ([self.delegate respondsToSelector:@selector(changPage:)]) {//判断方法是否实现
  
    [self.delegate changPage:_model.buyUrl];
     }
   
}

- (IBAction)share:(id)sender {
    if (self.blockUM) {
        self.blockUM();
    }
}
- (IBAction)collect:(id)sender {
    
    UIButton *btn  = sender;
    
    if (btn.selected) {
        btn.selected = NO;
        return;
    }
    btn.selected = YES;
}


@end
