//
//  MDIJKSDLGLView.h
//  IJKMediaPlayer
//
//  Created by ashqal on 16/7/14.
//  Copyright © 2016年 bilibili. All rights reserved.
//

// #define MD360PlayerMode
// #define MDFPS

#ifndef MDIJKSDLGLView_h
#define MDIJKSDLGLView_h

#import <UIKit/UIKit.h>
#import "IJKSDLGLView.h"

struct MDVideoFrame {
    int w; /**< Read-only */
    int h; /**< Read-only */
    uint32_t format; /**< Read-only */
    int planes; /**< Read-only */
    uint16_t *pitches; /**< in bytes, Read-only */
    unsigned char **pixels; /**< Read-write */
    CVPixelBufferRef buffer;
};

typedef struct MDVideoFrame MDVideoFrame;

@protocol MDVideoFrameCallback <NSObject>
@required
- (void) onFrameAvailable:(MDVideoFrame*) frame;
@end

@protocol MDIJKSDLGLView <NSObject>
@required
- (void) setFrameCallback:(id<MDVideoFrameCallback>) callback;
@end

@interface IJKSDLGLView (MDVR) <MDIJKSDLGLView>
- (void) display360: (SDL_VoutOverlay *) overlay;
@end
#endif /* MDIJKSDLGLView_h */
