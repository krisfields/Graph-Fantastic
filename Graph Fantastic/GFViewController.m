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
    self.gv.backgroundColor = [UIColor blackColor];
    self.gv.scale = 0.05;
    NSLog(@"SETTING GV SCALE TO 0.01");
    self.graphPanGesture = [UIPanGestureRecognizer new];
    [self.graphPanGesture addTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:self.graphPanGesture];
    self.gv.graphBlock = ^double(double x){
        double y= sin(x);
        return y;
    };
    self.gv.bounds = CGRectMake(-160, -240, self.gv.bounds.size.width, self.gv.bounds.size.height);

    
    
    self.graphPinchGesture = [[UIPinchGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:self.graphPinchGesture];
}
- (void)pinch:(UIPinchGestureRecognizer *)pinchGesture {
    self.gv.scale /= pinchGesture.scale;
    NSLog(@"pinchGesture.scale = %f", pinchGesture.scale);
    NSLog(@"self.gv.scale = %f", self.gv.scale);
    [self.gv setNeedsDisplay];
    if (self.gv.scale > 1){
        self.gv.scale = 1;
    }else if (self.gv.scale < 0){
        self.gv.scale = 0;
    }
    pinchGesture.scale = 1.0;
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
//    NSLog(@"%@", panGesture);
    CGPoint translation = [panGesture translationInView:self.view];
    self.view.bounds = CGRectMake(self.view.bounds.origin.x-translation.x, self.view.bounds.origin.y-translation.y, self.view.bounds.size.width, self.view.bounds.size.height);
//    NSLog(@"self view bounds origin x: %f", self.view.bounds.origin.x);
//    NSLog(@"self view bounds origin y: %f", self.view.bounds.origin.y);
//    NSLog(@"self view frame origin x: %f", self.view.frame.origin.x);
//    NSLog(@"self view frame origin y: %f", self.view.frame.origin.y);
    [self.view setNeedsDisplay];
}



@end
