#!/usr/bin/env python3
import cv2 as cv
import sys



if __name__ == '__main__':

    # arguments
    if len(sys.argv) != 2:
        print("usage:", sys.argv[0], "<filename>")
        sys.exit(-1)
    FILENAME = sys.argv[1]

    # load input image
    imgIn = cv.imread(FILENAME)/255
    if imgIn.size == 0:
        print("failed to load", FILENAME)
        sys.exit(-1)

    # fonction de rappel pour le trackbar (capture imgInput)
    def update_win(x):
        img = imgIn * x / 100
        cv.imshow('kermorvan', img)

    cv.namedWindow('kermorvan')
    cv.createTrackbar('mytrackbar', 'kermorvan', 0, 100, update_win)
    cv.setTrackbarPos('mytrackbar', 'kermorvan', 50)

    cv.imshow("kermorvan", imgIn)
    while True:
        if (cv.waitKey() == 27):
            break

