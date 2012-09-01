//
//  GFGraphView.h
//  Graph Fantastic
//
//  Created by Kris Fields on 8/31/12.
//  Copyright (c) 2012 Kris Fields. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef double(^fn)(double);

@interface GFGraphView : UIView
@property (nonatomic, copy) fn graphBlock;
@property (nonatomic) double scale;
@end
