//
//  ZZFont.m
//  InternetHospital
//
//  Created by Max on 2020/12/22.
//  Copyright © 2020 GaoLian. All rights reserved.
//

#import "ZZFont.h"

UIFont * zz_PFFont(CGFloat size){
    return [UIFont fontWithName:PFRegularName size:size];
}

UIFont * zz_PFMediumFont(CGFloat size){
    return [UIFont fontWithName:PFMediumName size:size];
}

UIFont * zz_PFBoldFont(CGFloat size){
    return [UIFont fontWithName:PFSemiboldName size:size];
}
