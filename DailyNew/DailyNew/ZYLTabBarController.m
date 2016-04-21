//
//  ZYLTabBarController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLTabBarController.h"
#import "Header.h"
#import "ZYLNavController.h"
#import "ZYLRootController.h"

@interface ZYLTabBarController ()

@property (nonatomic, strong) NSMutableArray *btnArray;

@property (nonatomic, strong) UIView *tabview;

@end

@implementation ZYLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];

    [self createTabBar];
}

//定制button
-(void)createTabBar{
    
    self.tabBar.hidden = YES;
    _tabview = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHight - 49, ScreenWidth, 49)];
    [self.view addSubview:_tabview];
    _tabview.backgroundColor = [UIColor grayColor];
 

}

-(void)createButton:(NSInteger)buttonCount{
    _btnArray = [NSMutableArray array];
    CGFloat w = ScreenWidth/buttonCount;
    CGFloat h = _tabview.bounds.size.height;
    
    for (int i = 0; i < buttonCount; i++) {
         UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(w*i, 0, w, h);
        [_tabview addSubview:btn];
        
        btn.tag = 10 + i;
        btn.adjustsImageWhenHighlighted = NO;
        [btn addTarget:self action:@selector(seletbtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [_btnArray addObject:btn];

    }
    UIButton *button = (UIButton *)[self.view viewWithTag:10];
    
    [self seletbtn:button];
    
}

//正常图片
-(void)setImageName:(NSArray *)imageName{
    _imageName = imageName;
    
    
    for (int i = 0; i < _imageName.count; i++) {
        
        [_btnArray[i] setImage:[UIImage imageNamed:_imageName[i]] forState:UIControlStateNormal];
       
        UIButton *btn = _btnArray[i];
   
        
        //设置图片偏移，让开文字
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 23, 20, 0);
        
        
        
    }
    
   
}

//选中图片
-(void)setSelectedImage:(NSArray *)selectedImage{
    _selectedImage = selectedImage;
    
    for (int i = 0; i < _btnArray.count; i++) {
        
        [_btnArray[i] setBackgroundImage:[UIImage imageNamed:_selectedImage[i]] forState:UIControlStateSelected];
        [_btnArray[i] setBackgroundImage:[UIImage imageNamed:_selectedImage[i]] forState:UIControlStateHighlighted];
    }
}

-(void)setControllerName:(NSArray *)controllerName{
    _controllerName = controllerName;
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < controllerName.count; i ++) {
        //根据类名得到类对象
        Class controllerClass = NSClassFromString(controllerName[i]);
        
        ZYLRootController *controller = [[controllerClass alloc] init];
        controller.urlPage = _URLPages[i];
        controller.title = _titlePage[i];
        //添加nav
        ZYLNavController *nav = [[ZYLNavController alloc] initWithRootViewController:controller];
       
    
        [array addObject:nav];
    
    }
    self.viewControllers = array;
    
   
}

-(void)setURLPages:(NSArray *)URLPages{
    
    _URLPages = URLPages;
    
    
}

-(void)setTitlePage:(NSArray *)titlePage{
    _titlePage = titlePage;
}


//button题目
-(void)setTitleLable:(NSArray *)titleLable{
    _titleLable = titleLable;
    
    for (int i = 0; i < _btnArray.count; i++) {
        UIButton *button = _btnArray[i];
        [_btnArray[i] setTitle:titleLable[i] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:10];
        
        button.titleEdgeInsets = UIEdgeInsetsMake(23, 0, 0, 23);

    }
}

-(void)seletbtn:(UIButton *)btn{
 
    
    for (int i = 0; i < _btnArray.count; i ++) {
        UIButton *btnn = _btnArray[i];
        btnn.userInteractionEnabled = YES;
        btnn.selected = NO;
    }
    btn.selected = YES;
    btn.userInteractionEnabled = NO;
    self.selectedIndex = btn.tag - 10;
}
-(void)setController:(NSString *)controllerName title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectedImage{
    
    //根据类名得到类对象
    Class controllerClass = NSClassFromString(controllerName);
    
    UIViewController *controller = [[controllerClass alloc] init];
    
    
    controller.title = title;
    
    UIImage *normalImage = [UIImage imageNamed:imageName];
    UIImage *SImage = [UIImage imageNamed:selectedImage];
    
    controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:SImage];
    
    
    
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:controller];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.viewControllers];
    
    [array addObject:nc];
    
    self.viewControllers = array;
    
}

@end
