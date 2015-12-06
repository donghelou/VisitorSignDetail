//
//  UILabel+VerticalAlign.m
//  MapDemoTest
//
//  Created by donghelou on 15/12/5.
//  Copyright © 2015年 donghelou. All rights reserved.
//

#import "UILabel+VerticalAlign.h"

@implementation UILabel (VerticalAlign)

- (void)alignTop {
    UIFont *font = [UIFont systemFontOfSize:12.5696];
    CGSize fontSize = [self.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGRect theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    int newLinesToPad = (finalHeight  - theStringSize.size.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [self.text stringByAppendingString:@"\n "];
    NSLog(@"实际高度是%f",fontSize.height);
}

- (void)alignBottom {
    UIFont *font = [UIFont systemFontOfSize:15.0];
    CGSize fontSize = [self.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
     CGRect theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    
    int newLinesToPad = (finalHeight  - theStringSize.size.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
}


@end

