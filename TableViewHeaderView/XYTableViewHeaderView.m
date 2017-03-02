//
//  XYTableViewHeaderView.m
//  DMP
//
//  Created by Christian on 16/10/17.
//  Copyright © 2016年 Christian. All rights reserved.
//

#import "XYTableViewHeaderView.h"
@interface XYTableViewHeaderView ()
{
    CGRect _frame; // 记录frame
    //UILabel *_lineLable;//标识线label
}
@end

@implementation XYTableViewHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        self.showsVerticalScrollIndicator = FALSE;
        self.showsHorizontalScrollIndicator = FALSE;
    }
    return self;
}

-(void)setTextArr:(NSArray *)textArr
{
    _textArr = textArr;
    //添加控件
    CGFloat contentWidth = (textArr.count -2)*[textArr[textArr.count -2] floatValue];
    self.contentSize = CGSizeMake(contentWidth, _frame.size.height);
    for (int i = 0; i<_textArr.count -2; i++) {
        UIButton *btn = [self addOneHeaderViewBtnX:[textArr[textArr.count -2] floatValue]*i Width:[textArr[textArr.count -2] floatValue] Text:_textArr[i] textColor:[_textArr[textArr.count-1] integerValue]];
        [btn addTarget:self action:@selector(btnCilck:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self addSubview:btn];
    }
    //标识线
    UILabel *oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _frame.size.height-2, [textArr[textArr.count -2] floatValue], 2)];
    oneLabel.backgroundColor = [UIColor colorWithHex:[_textArr[textArr.count-1] integerValue]];
    _lineLable = oneLabel;
    
    [self addSubview:_lineLable];
    
}
//添加一个btn
-(UIButton *)addOneHeaderViewBtnX:(float)x Width:(float)width Text:(NSString *)text textColor:(NSInteger)textColor
{
    UIButton *oneBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, width, _frame.size.height - 2)];
    [oneBtn setTitleColor:[UIColor colorWithHex:textColor] forState:UIControlStateNormal];
    [oneBtn setTitle:text forState:UIControlStateNormal];
    //oneBtn.backgroundColor = [UIColor redColor];
    
    return oneBtn;
}

-(void)btnCilck:(UIButton *)btn
{
    _lineLable.x = btn.x;
    if ([_delegateD respondsToSelector:@selector(cilckBtnTag:)]) {
        [_delegateD cilckBtnTag:(int)btn.tag];
    }
}

-(void)dealloc
{
    _delegateD = nil;
    _textArr = nil;
    _lineLable = nil;
}
@end
