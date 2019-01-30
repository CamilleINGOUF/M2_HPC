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
    cap = cv.VideoCapture(FILENAME)
        
    # cap = cv.VideoCapture(0)
    while(cap.isOpened()):
        ret, frame = cap.read()
        blur = cv.blur(frame, (9,9), 1.5)
        outFrame = cv.Canny(blur, 0, 40)
        if not ret:
            break

        cv.imshow('bmx', outFrame)
        if cv.waitKey(30) == 27:
            break
