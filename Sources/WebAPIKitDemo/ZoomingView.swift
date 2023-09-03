//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/3.
//

//import Foundation
import DOM
import JavaScriptKit
import WebAPIBase


struct ZoomingView: HTMLProtocol {
    let element: HTMLButtonElement
    
    private static func draw(on context: CanvasRenderingContext2D) {
        let radgrad: CanvasGradient  = context.createRadialGradient(x0: 180, y0: 180, r0: 40, x1: 208, y1: 200, r1: 120)
        radgrad.addColorStop(offset: 0, color: .rgb(r: 0xa7, g: 0xd3, b: 0xc))
        radgrad.addColorStop(offset: 0.9, color: .rgb(r: 1, g: 0x9f, b: 0x62))
        radgrad.addColorStop(offset: 1, color: .rgba(r: 1, g: 159, b: 98, a: 0))
        
        let radgrad2 = context.createRadialGradient(x0: 420, y0: 420, r0: 80, x1: 448, y1: 480, r1: 200)
        radgrad2.addColorStop(offset: 0, color: .rgb(r: 0xff, g: 0x5f, b: 0x98))
        radgrad2.addColorStop(offset: 0.75, color: .rgb(r: 0xff, g: 1, b: 0x88))
        radgrad2.addColorStop(offset: 1, color: .rgba(r: 255, g: 1, b: 136, a: 0))
        
        let radgrad3 = context.createRadialGradient(x0: 380, y0: 60, r0: 60, x1: 408, y1: 80, r1: 160)
        radgrad3.addColorStop(offset: 0, color: .rgb(r: 0, g: 0xc9, b: 0xff))
        radgrad3.addColorStop(offset: 0.8, color: .rgb(r: 0, g: 0xb5, b: 0xe2))
        radgrad3.addColorStop(offset: 1, color: .rgba(r: 0, g: 201, b: 255, a: 0))
        
        let radgrad4 = context.createRadialGradient(x0: 0, y0: 600, r0: 200, x1: 0, y1: 560, r1: 360)
        radgrad4.addColorStop(offset: 0, color: .rgb(r: 0xf4, g: 0xf2, b: 1))
        radgrad4.addColorStop(offset: 0.8, color: .rgb(r: 0xe4, g: 0xc7, b: 0))
        radgrad4.addColorStop(offset: 1, color: .rgba(r: 228, g: 199, b: 0, a: 0))
        
        context.set(fillStyle: radgrad4)
        context.fillRect(x: 0, y: 0, w: 600, h: 600)
        context.set(fillStyle: radgrad3)
        context.fillRect(x: 0, y: 0, w: 600, h: 600)
        context.set(fillStyle: radgrad2)
        context.fillRect(x: 0, y: 0, w: 600, h: 600)
        context.set(fillStyle: radgrad)
        context.fillRect(x: 0, y: 0, w: 600, h: 600)
    }
    
    init(title: String, parent: HTMLElement) {
        self.element = Button(title: title) {
            parent.jsObject.innerHTML = ""
            let width: Int32 = 600, height: Int32 = 600
            let canvas = Canvas(width: UInt32(width), height: UInt32(height))
            let smoothingZoomCanvas = Canvas(width: 200, height: 200)
            let pixelatedZoomCanvas = Canvas(width: 200, height: 200)
            let div = Div {
                canvas
                smoothingZoomCanvas
                pixelatedZoomCanvas
            }
            
            Self.draw(on: canvas.context)
            let originalData = canvas.context.getImageData(sx: 0, sy: 0, sw: width, sh: height)
            canvas.context.putImageData(imagedata: originalData, dx: 0, dy: 0)
            
            smoothingZoomCanvas.context.imageSmoothingEnabled = true
            pixelatedZoomCanvas.context.imageSmoothingEnabled = false
            
            func zoom(on context: CanvasRenderingContext2D, source: HTMLCanvasElement, x: Double, y: Double) {
                context.drawImage(image: .htmlCanvasElement(source),
                                  sx: min(max(0, x - 5), Double(width) - 10),
                                  sy: min(max(0, y - 5), Double(height) - 10),
                                  sw: 10,
                                  sh: 10,
                                  dx: 0,
                                  dy: 0,
                                  dw: 200,
                                  dh: 200)
            }
            
            _ = parent.jsValue.appendChild(div.element.jsValue)
            
            canvas.element.addEventListener(type: "mousemove") { event in
                console.log(data: "mouse move")
                let mouseEvent = MouseEvent(unsafelyWrapping: event.jsObject)
                let x = Double(mouseEvent.clientX - canvas.element.offsetLeft)
                let y = Double(mouseEvent.clientY - canvas.element.offsetTop)
                zoom(on: smoothingZoomCanvas.context, source: canvas.element, x: x, y: y)
                zoom(on: pixelatedZoomCanvas.context, source: canvas.element, x: x, y: y)
            }
            
     }.element
        
    }
}
