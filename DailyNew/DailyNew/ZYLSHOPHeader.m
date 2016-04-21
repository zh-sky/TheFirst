//
//  ZYLSHOPHeader.m
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSHOPHeader.h"

@interface ZYLSHOPHeader()

@property (weak, nonatomic) IBOutlet UILabel *bound;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UIButton *SHANG;
@property (weak, nonatomic) IBOutlet UIButton *Hot;


@end
@implementation ZYLSHOPHeader

+(id)shopHeader{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)setBound:(UILabel *)bound{
    _bound = bound;
    bound.layer.cornerRadius = 5;
    bound.layer.borderColor = [UIColor grayColor].CGColor;
    bound.layer.borderWidth = 1;
}
-(void)setShopname:(NSString *)shopname{
    _shopname = shopname;
    _shopName.text = shopname;
    _shopName.font = [UIFont systemFontOfSize:13];
    _SHANG.selected = YES;
    
}

- (IBAction)collect:(id)sender {
    UIButton *btn = sender;
    
    if (btn.selected) {
        btn.selected = NO;
        return;
    }
    btn.selected = YES;
}

- (IBAction)SHANG:(id)sender {
  
    if (self.block) {
        
        NSString *url = [NSString stringWithFormat:@"%@&sortType=CTimeDesc",_shopurl];
        self.block(url);
    }
    
    UIButton *btn = sender;

    if (_Hot.selected) {
        _Hot.selected = NO;
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        _Hot.userInteractionEnabled = YES;
        return;
    }
    
}
- (IBAction)Hot:(id)sender {
    
    
    if (self.block) {
        self.block(_shopurl);
    }

    
    UIButton *btn = sender;
    if (_SHANG.selected) {
        _SHANG.selected = NO;
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        _SHANG.userInteractionEnabled = YES;
        return;
    }
}

@end
