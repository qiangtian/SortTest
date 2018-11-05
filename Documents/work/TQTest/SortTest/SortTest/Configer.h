//
//  Configer.h
//  SortTest
//
//  Created by 西安旺豆电子 on 2018/7/11.
//  Copyright © 2018年 TQ. All rights reserved.
//

#ifndef Configer_h
#define Configer_h



#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width


#define IS_DEVICE_X         (([[UIApplication sharedApplication] statusBarFrame].size.height == 44 )? (YES):(NO))
#define kSTATUS_HEIGHT      [[UIApplication sharedApplication] statusBarFrame].size.height  //64   x== 88
#define kNAV_HEIGHT         (kSTATUS_HEIGHT + 44)
#define kTABBAR_HEIGHT      ((IS_DEVICE_X) ? (34 + 49):(49)) // x== 83

//底部高度
#define kBOTTOM_HEIGHT      ((IS_DEVICE_X) ? 34:0)




#endif /* Configer_h */
