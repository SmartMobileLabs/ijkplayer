//
//  MDIJKSDLView.m
//  IJKMediaPlayer
//
//  Created by ashqal on 16/7/13.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDIJKSDLGLView.h"
#include "ijksdl/ijksdl_timer.h"

struct SDL_VoutOverlay_Opaque {
    SDL_mutex *mutex;
    CVPixelBufferRef pixel_buffer;
    Uint16 pitches[AV_NUM_DATA_POINTERS];
    Uint8 *pixels[AV_NUM_DATA_POINTERS];
};

@interface IJKSDLGLView (private)
@property (nonatomic,weak) id<MDVideoFrameCallback> callback;
@end

@implementation IJKSDLGLView (MDVR)

- (void) display360: (SDL_VoutOverlay *) overlay{
    
    if (overlay == nil) {
        return;
    }
    
    MDVideoFrame* frame = malloc(sizeof(MDVideoFrame));
    
    frame -> w = overlay->w;
    frame -> h = overlay->h;
    frame -> format = overlay->format;
    frame -> planes = overlay->planes;
    frame -> pitches = overlay->pitches;
    frame -> pixels = overlay->pixels;
    frame ->buffer = NULL;
    if (overlay->opaque != NULL && overlay->opaque->pixel_buffer != NULL) {
        frame->buffer = ((SDL_VoutOverlay_Opaque*)overlay->opaque)->pixel_buffer;
        //CVBufferRetain(frame->buffer);
    }
    
    [self.callback onFrameAvailable:(frame)];
    
    //if (frame ->buffer != NULL) {
    //    CVBufferRelease(frame->buffer);
    //}
    
    free(frame);
}

- (void) setFrameCallback:(id<MDVideoFrameCallback>) callback{
    self.callback = callback;
}

@end
