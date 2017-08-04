//
//  MyMandelbrotView.swift
//  Experiments
//
//  Created by max tang on 17/8/4.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class MyMandelbrotView: UIView {

    let MANDELBROT_STEPS = 1000 // determines how long the calculation takes
    var bitmapContext: CGContext!
    // jumping-off point: draw the Mandelbrot set
    func drawThatPuppy () {
        self.makeBitmapContext(size: self.bounds.size)
        let center = CGPoint(self.bounds.midX, self.bounds.midY)
        self.draw(center: center, zoom:1)
        self.setNeedsDisplay()
    }
    // create bitmap context
    func makeBitmapContext(size:CGSize) {
        var bitmapBytesPerRow = Int(size.width * 4)
        bitmapBytesPerRow += (16 - (bitmapBytesPerRow % 16)) % 16
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let prem = CGImageAlphaInfo.premultipliedLast.rawValue
        let context = CGContext(data: nil,
                                width: Int(size.width), height: Int(size.height),
                                bitsPerComponent: 8, bytesPerRow: bitmapBytesPerRow,
                                space: colorSpace, bitmapInfo: prem)
        self.bitmapContext = context
    }
    // draw pixels of bitmap context
    func draw(center:CGPoint, zoom:CGFloat) {
        func isInMandelbrotSet(_ re:Float, _ im:Float) -> Bool {
            var fl = true
            var (x, y, nx, ny) : (Float,Float,Float,Float) = (0,0,0,0)
            for _ in 0 ..< MANDELBROT_STEPS {
                nx = x*x - y*y + re
                ny = 2*x*y + im
                if nx*nx + ny*ny > 4 {
                    fl = false
                    break
                }
                x = nx
                y = ny
            }
            return fl
        }
        self.bitmapContext.setAllowsAntialiasing(false)
        self.bitmapContext.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        var re : CGFloat
        var im : CGFloat
        let maxi = Int(self.bounds.size.width)
        let maxj = Int(self.bounds.size.height)
        for i in 0 ..< maxi {
            for j in 0 ..< maxj {
                re = (CGFloat(i) - 1.33 * center.x) / 160
                im = (CGFloat(j) - 1.0 * center.y) / 160
                re /= zoom
                im /= zoom
                if (isInMandelbrotSet(Float(re), Float(im))) {
                    self.bitmapContext.fill(
                        CGRect(CGFloat(i), CGFloat(j), 1.0, 1.0))
                }
            }
        }
    }
    
    // turn pixels of bitmap context into CGImage, draw into ourselves
    override func draw(_ rect: CGRect) {
        if self.bitmapContext != nil {
            let context = UIGraphicsGetCurrentContext()!
            let im = self.bitmapContext.makeImage()
            context.draw(im!, in: self.bounds)
        }
    }
}
