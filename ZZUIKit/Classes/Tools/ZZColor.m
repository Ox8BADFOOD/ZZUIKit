//
//  ZZColor.m
//  InternetHospital
//
//  Created by Max on 2020/12/22.
//  Copyright © 2020 GaoLian. All rights reserved.
//

#import "ZZColor.h"

UIColor* zz_RGBA(float r,float g,float b,float a){
    return [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:a];
}

UIColor* zz_RGB(float r,float g,float b){
    return [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0];
}

NSArray* zz_HexToRGB(long hex){
    float red = ((float)((hex & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hex & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hex & 0xFF))/255.0;
    return @[@(red),@(green),@(blue)];
}

UIColor* zz_RGBAHex(long hex,float alpha){
    NSArray * colors = zz_HexToRGB(hex);
    return [UIColor colorWithRed:[colors[0] floatValue]
                           green:[colors[1] floatValue]
                           blue:[colors[2] floatValue]
                           alpha:alpha];
}

UIColor* zz_RGBHex(long hex){
    return zz_RGBAHex(hex, 1);
}

UIColor* zz_RGBRandom(void){
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    return zz_RGB(R, G, B);
}


