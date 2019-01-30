import cv2 as cv
import numpy as np

if __name__ == '__main__':

    img = np.zeros((512,512,3), np.uint8)



    cv.namedWindow('draw')

    def draw_circle(event,x,y,flags,param):
        if event == cv.EVENT_LBUTTONDBLCLK:
            cv.circle(img,(x,y),500,(255,255,255),-1)
            cv.imshow("draw",img)
            
    cv.setMouseCallback('draw',draw_circle)

    while True:
        if (cv.waitKey(20) & 0xFF == 27):
            break
    cv.destroyAllWindows()