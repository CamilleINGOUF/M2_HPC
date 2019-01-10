#!/usr/bin/env python3
import matplotlib as mpl
mpl.use('TkAgg')
from matplotlib import pyplot as plt
import cv2 as cv
import time
import sys




	# fonction de rappel pour le trackbar (capture imgInput)
	
def update_win(x):
    _ ,img2 = cv.threshold(img,x,255.0,cv.THRESH_BINARY_INV)
    cv.imshow('IMG', img2)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("usage:", sys.argv[0], "<filename>")
        sys.exit(-1)
    FILENAME = sys.argv[1]
    
    imgIn = cv.imread(FILENAME)
    gray = cv.cvtColor(imgIn, cv.COLOR_BGR2GRAY)
    img = gray
# affiche l'image + trackbar
cv.namedWindow('IMG')
cv.createTrackbar('mytrackbar', 'IMG', 0, 100, update_win)
cv.setTrackbarPos('mytrackbar', 'IMG', 50)

while True:
    if cv.waitKey() == 27:
        break
