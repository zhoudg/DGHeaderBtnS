//
//  XYTableViewHeaderView.h
//  DMP
//
//  Created by Christian on 16/10/17.
//  Copyright © 2016年 Christian. All rights reserved.
//


/**
 headerView多btn点击处理使用步骤及传值：
                     1。在引用类中alloc init
                     2，传button的标题数据进来
                     3.实现代理方法
                     4.NSArray *textArr 接收所有要显示的按钮，数组中最后一个元素放一个每个按钮的宽度值
 */
#import <UIKit/UIKit.h>

@protocol XYTableViewHeaderViewDelegate <NSObject>

-(void)cilckBtnTag:(int)tag;

@end

@interface XYTableViewHeaderView : UIScrollView

@property(nonatomic,weak) id<XYTableViewHeaderViewDelegate>delegateD;

@property(nonatomic,strong) NSArray *textArr; //接收button的titletext
//@[@"前期手续",@"招标及开工",@"竣工验收",@"决算审计",@"资产转结",@100,@0x00000]数组参考格式，后面两个是一个宽度一个颜色必须传

@property(nonatomic,strong) UILabel *lineLable;//标识线label
@end
