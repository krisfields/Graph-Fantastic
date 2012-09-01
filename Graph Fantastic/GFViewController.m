//
//  GFViewController.m
//  Graph Fantastic
//
//  Created by Kris Fields on 8/31/12.
//  Copyright (c) 2012 Kris Fields. All rights reserved.
//

#import "GFViewController.h"
#import "GFGraphView.h"

@interface GFViewController ()
@property UIPanGestureRecognizer *graphPanGesture;
@property UIPinchGestureRecognizer *graphPinchGesture;
@property GFGraphView *gv;

@end

@implementation GFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.gv = [[GFGraphView alloc]init];
    self.view = self.gv;
    self.gv.backgroundColor = [UIColor redColor];
    self.gv.scale = 1;
    
    self.graphPanGesture = [UIPanGestureRecognizer new];
    [self.graphPanGesture addTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:self.graphPanGesture];
    self.gv.graphBlock = ^double(double x){
        double y= sin(x);
        return y;
    };

    
    
    self.graphPinchGesture = [[UIPinchGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:self.graphPinchGesture];
}
- (void)pinch:(UIPinchGestureRecognizer *)pinchGesture {
    self.gv.scale = pinchGesture.scale;
//    NSLog(@"%@", pinchGesture);
    [self.gv setNeedsDisplay];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)pan:(UIPanGestureRecognizer *)panGesture {
    NSLog(@"%@", panGesture);
    CGPoint translation = [panGesture translationInView:self.view];
    self.view.bounds = CGRectMake(self.view.bounds.origin.x-translation.x, self.view.bounds.origin.y-translation.y, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view setNeedsDisplay];
}



@end
