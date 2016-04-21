//
//  Header.h
//  DailyNew
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#ifndef DailyNew_Header_h
#define DailyNew_Header_h

#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "ZJModelTool.h"
#import "ZYLCreateNavButton.h"
#import "ZYLDatabass.h"
#import "ZYLModel.h"
//#import "UMSocial.h"

//屏幕宽度
#define  ScreenWidth  [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define ScreenHight  [UIScreen mainScreen].bounds.size.height

//视图高度
#define ViewHight self.view.bounds.size.height

//视图宽度
#define  ViewWidth self.view.bounds.size.width


//新款首页
#define NEW_PAGE @"http://mobileapi.j.cn/?method=listv4&first=1&count=10&uid=866796029634199&imgSize=mid2&longitude=&latitude=&thisTime=&lastTime=&termId=0&pid=&tid=&shopId=&v=3.7.1&net="

//宝贝详情
#define BaBySHOP_PAGE @"http://mobileapi.j.cn/?method=detailv2&uid=866796029634199&imgSize=mid2&longitude=&latitude=&actionFrom=Stream&v=3.7.1&net="

//我的页面
#define MY_PAGE @"http://mobileapi.j.cn/?method=myMenu&uid=866796029634199&v=3.7.1&net="
//搜索
#define Search_PAGE @"http://mobileapi.j.cn/?method=term_tags&uid=866796029634199&v=3.7.1&net="
//试衣
#define TRY_PAGE @"http://mobileapi.j.cn/?method=dreMenuv3&uid=866796029634199&count=10&parentId=&v=3.7.1&net="
//社区
#define SNS_PAGE @"http://bbs.j.cn/api/groupsV2?jcnappid=866796029634199&jcnuserid=791491a7c6db4c7aa8cdfc8de6d585ce&pageSize=10&net=&v=3.7.1&longitude=&latitude="

//社区row
#define SNS_ROWS @"http://bbs.j.cn/api/newPostListV3?jcnappid=866796029634199&jcnuserid=791491a7c6db4c7aa8cdfc8de6d585ce&little_group_id=0&star_only=false&page_size=10&its=&longitude=&latitude=&pageRecord=&hasPosts=0&v=3.7.1&net=&from=groups_recommend"
//社区楼主
#define  Sns_ROWs_LOW @"http://bbs.j.cn/api/newPostV3?jcnappid=866796029634199&jcnuserid=791491a7c6db4c7aa8cdfc8de6d585ce&page_no=1&page_size=10&author_only=false&sorts=0&longitude=&latitude=&hasPosts=0&v=3.7.1&net=wifi&from=group"
//店铺
#define SHOP_PAGE @"http://mobileapi.j.cn/?method=listv4&tid=&start=0&count=10&uid=866796029634199&imgSize=mid2&longitude=&latitude=&v=3.7.1&net="

//风格
#define TYPE_PAGE @"http://mobileapi.j.cn/?method=listv4&shopId=&count=10&uid=866796029634199&imgSize=mid2&longitude=&latitude=&sessionData=&sortType=CTimeDesc&v=3.7.1&net="

//搜索栏
#define Search_lan @"http://mobileapi.j.cn/?method=searchv2&count=10&uid=866796029634199&imgSize=mid2&longitude=&latitude=&v=3.7.1&net="

//搜索类型
#define Search_type @"http://mobileapi.j.cn/?method=listv4&first=0&count=10&uid=866796029634199&imgSize=mid2&longitude=&latitude=&thisTime=&lastTime=&freshRecord=&from=nav&tid=&shopId=&v=3.7.1&net="

//主题
#define Subject_Page @"http://mobileapi.j.cn/?method=listv4&first=0&count=10&uid=866796029634199&imgSize=mid2&longitude=&latitude=&thisTime=&lastTime=&freshRecord=&termId=2&pid=0&tid=0&shopId=0&queryType=ActivityList&activityName=20150327&v=3.7.1&net="
//发型
#define Try_FAN @"http://mobileapi.j.cn/?method=dressingListv3&count=10&uid=866796029634199&v=3.7.1&net="

//试衣Schema
#define  Try_Schema @"http://mobileapi.j.cn/?method=dreMenuv3&uid=866796029634199&count=10&v=3.7.1&net="

//拍照
#define Try_phoho @"http://mobileapi.j.cn/?method=dressingItemv2&uid=866796029634199&v=3.7.1&net="


#endif
