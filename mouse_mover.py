#!/usr/bin/python
import sys
import time
import Quartz.CoreGraphics as cg


def mouseEvent(type, posx, posy):
        theEvent = cg.CGEventCreateMouseEvent(None, type, (posx, posy), cg.kCGMouseButtonLeft)
        cg.CGEventPost(cg.kCGHIDEventTap, theEvent)


def mousemove(posx, posy):
        mouseEvent(cg.kCGEventMouseMoved, posx, posy)


def mouseclickdn(posx, posy):
        mouseEvent(cg.kCGEventLeftMouseDown, posx, posy)


def mouseclickup(posx, posy):
        mouseEvent(cg.kCGEventLeftMouseUp, posx, posy)


def mousedrag(posx, posy):
        mouseEvent(cg.kCGEventLeftMouseDragged, posx, posy)

ourEvent = cg.CGEventCreate(None)
currentpos = cg.CGEventGetLocation(ourEvent)  # Save current mouse position
mouseclickdn(60, 100)
mousedrag(60, 300)
mouseclickup(60, 300)
time.sleep(1)
mousemove(int(currentpos.x), int(currentpos.y))  # Restore mouse position
