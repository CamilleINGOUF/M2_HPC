#!/usr/bin/env python3
import matplotlib as mpl
mpl.use('TkAgg')
from matplotlib import pyplot as plt
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

    imgIn = cv.cvtColor(imgIn, cv.COLOR_BGR2RGB)
    color = ('b','g','r')
    for channel,col in enumerate(color):    
        plot = cv.calcHist([imgIn],[channel],None,[256],[0,256])
        plt.plot(plot, col)
        plt.xlim([0,256])
    plt.show()