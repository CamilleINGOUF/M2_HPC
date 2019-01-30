#!/usr/bin/env python3

import cv2 as cv
import time
import sys

if __name__ == '__main__':

    # arguments
    if len(sys.argv) != 2:
        print("usage:", sys.argv[0], "<filename>")
        sys.exit(-1)
    FILENAME = sys.argv[1]

    # load input image
    imgIn = cv.imread(FILENAME)
    if imgIn.size == 0:
        print("failed to load", FILENAME)
        sys.exit(-1)

    # compute output image
    t0 = time.time()
    imgOut = cv.blur(imgIn,(100,100))
    t1 = time.time()

    # outputs
    print("time:", t1-t0, "s")
    cv.imwrite("out_blur_"+FILENAME, imgOut)

