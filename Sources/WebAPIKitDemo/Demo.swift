import DOM
import JavaScriptKit
import WebAPIBase
import Foundation

@main
struct Demo {
    static func drawLoop(on context: CanvasRenderingContext2D) {
        context.clearRect(x: 0, y: 0, w: 800, h: 800)
        for i in 0..<4 {
            for j in 0..<3 {
                
                context.beginPath();
                let x = 25 + Double(j) * 50; // x coordinate
                let y = 25 + Double(i) * 50; // y coordinate
                let radius: Double = 20; // Arc radius
                let startAngle: Double = 0; // Starting point on circle
                let endAngle: Double = .pi + (.pi * Double(j)) / 2; // End point on circle
                let counterclockwise = i % 2 != 0; // clockwise or counterclockwise
                context.arc(x: x, y: y, radius: radius, startAngle: startAngle, endAngle: endAngle, counterclockwise: counterclockwise)
                
                if (i > 1) {
                    context.fill();
                } else {
                    context.stroke();
                }
            }
        }
    }
    
    static func drawDouble(on context: CanvasRenderingContext2D) {
        // Filled triangle
        context.clearRect(x: 0, y: 0, w: 800, h: 600)
        context.beginPath();
        context.moveTo(x: 25, y: 25)
        context.lineTo(x: 105, y: 25)
        context.lineTo(x: 25, y: 105)
        context.fill()
        
        context.beginPath()
        context.moveTo(x: 125, y: 125)
        context.lineTo(x: 125, y: 45)
        context.lineTo(x: 45, y: 125)
        context.closePath()
        context.stroke()
    }
    
    static func drawQuadratic(on context: CanvasRenderingContext2D) {
        context.clearRect(x: 0, y: 0, w: 800, h: 600)
        context.beginPath();
        context.moveTo(x: 75, y: 25)
        context.quadraticCurveTo(cpx: 25, cpy: 25, x: 25, y: 62.5)
        context.quadraticCurveTo(cpx: 25, cpy: 100, x: 50, y: 100)
        context.quadraticCurveTo(cpx: 50, cpy: 120, x: 30, y: 125)
        context.quadraticCurveTo(cpx: 60, cpy: 120, x: 65, y: 100)
        context.quadraticCurveTo(cpx: 125, cpy: 100, x: 125, y: 62.5)
        context.quadraticCurveTo(cpx: 125, cpy: 25, x: 75, y: 25)
        context.stroke()
    }
    
    static func drawBezier(on context: CanvasRenderingContext2D) {
        // Cubic curves example
        context.clearRect(x: 0, y: 0, w: 800, h: 600)
        context.beginPath()
        context.moveTo(x: 75, y: 40)
        context.bezierCurveTo(cp1x: 75, cp1y: 37, cp2x: 70, cp2y: 25, x: 50, y: 25)
        context.bezierCurveTo(cp1x: 20, cp1y: 25, cp2x: 20, cp2y: 62.5, x: 20, y: 62.5)
        context.bezierCurveTo(cp1x: 20, cp1y: 80, cp2x: 40, cp2y: 102, x: 75, y: 120)
        context.bezierCurveTo(cp1x: 110, cp1y: 102, cp2x: 130, cp2y: 80, x: 130, y: 62.5)
        context.bezierCurveTo(cp1x: 130, cp1y: 62.5, cp2x: 130, cp2y: 25, x: 100, y: 25)
        context.bezierCurveTo(cp1x: 85, cp1y: 25, cp2x: 75, cp2y: 37, x: 75, y: 40)
        context.fill()
    }
    
    
    static func example7(on context: CanvasRenderingContext2D) {
        
        let roundedRect = { [context]  (x: Double, y: Double, width: Double, height: Double, radius: Double) in
            context.beginPath();
            context.moveTo(x: x, y: y + radius)
            context.arcTo(x1: x, y1: y + height, x2: x + radius, y2: y+height, radius: radius)
            context.arcTo(x1: x + width, y1: y + height, x2: x + width, y2: y + height - radius, radius: radius)
            context.arcTo(x1: x + width, y1: y, x2: x + width - radius, y2: y, radius: radius)
            context.arcTo(x1: x, y1: y, x2: x, y2: y + radius, radius: radius)
            context.stroke();
        }
        
        context.clearRect(x: 0, y: 0, w: 800, h: 800)
        roundedRect(12, 12, 150, 150, 15)
        roundedRect(19, 19, 150, 150, 9)
        roundedRect(53, 53, 49, 33, 10)
        roundedRect(53, 119, 49, 16, 6)
        roundedRect(135, 53, 49, 33, 10)
        roundedRect(135, 119, 25, 49, 10)
        context.beginPath();
        context.arc(x: 37, y: 37, radius: 13, startAngle: .pi / 7, endAngle: -.pi/7, counterclockwise: false)
        context.lineTo(x: 31, y: 37)
        context.fill()
        
        for i in 0..<8 {
            context.fillRect(x: 51 + Double(i) * 16, y: 35, w: 4, h: 4)
        }
        
        for i in 0..<6 {
            context.fillRect(x: 115, y: 51 + Double(i) * 16, w: 4, h: 4)
        }
        
        for i in 0..<6 {
            context.fillRect(x: 51  + Double(i) * 16, y: 99, w: 4, h: 4)
        }
        
        context.beginPath();
        context.moveTo(x: 83, y: 116)
        context.lineTo(x: 83, y: 102)
        context.bezierCurveTo(cp1x: 83, cp1y: 94, cp2x: 89, cp2y: 88, x: 97, y: 88);
        context.bezierCurveTo(cp1x: 105, cp1y: 88, cp2x: 111, cp2y: 94, x: 111, y: 102);
        context.lineTo(x: 111, y: 116)
        context.lineTo(x: 106.333, y: 111.333)
        context.lineTo(x: 101.666, y: 116)
        context.lineTo(x: 97, y: 111.333)
        context.lineTo(x: 92.333, y: 116)
        context.lineTo(x: 87.666, y: 111.333)
        context.lineTo(x: 83, y: 116)
        context.fill()
        
        //        context.fillStyle =  .color(.white)
        context.set(fillStyle: JSColor.white)
        context.beginPath()
        context.moveTo(x: 91, y: 96)
        context.bezierCurveTo(cp1x: 88, cp1y: 96, cp2x: 87, cp2y: 99, x: 87, y: 101)
        context.bezierCurveTo(cp1x: 87, cp1y: 103, cp2x: 88, cp2y: 106, x: 91, y: 106)
        context.bezierCurveTo(cp1x: 94, cp1y: 106, cp2x: 95, cp2y: 103, x: 95, y: 101)
        context.bezierCurveTo(cp1x: 95, cp1y: 99, cp2x: 94, cp2y: 96, x: 91, y: 96)
        context.moveTo(x: 103, y: 96)
        context.bezierCurveTo(cp1x: 100, cp1y: 96, cp2x: 99, cp2y: 99, x: 99, y: 101)
        context.bezierCurveTo(cp1x: 99, cp1y: 103, cp2x: 100, cp2y: 106, x: 103, y: 106)
        context.bezierCurveTo(cp1x: 106, cp1y: 106, cp2x: 107, cp2y: 103, x: 107, y: 101)
        context.bezierCurveTo(cp1x: 107, cp1y: 99, cp2x: 106, cp2y: 96, x: 103, y: 96)
        context.fill();
        
        //        context.set(fillStyle: JSColor.black)
        context.set(fillStyle: JSColor.black)
        context.beginPath()
        context.arc(x: 101, y: 102, radius: 2, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
        context.fill()
        
        context.beginPath()
        context.arc(x: 89, y: 102, radius: 2, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
        context.fill()
    }
    
    
    static func main() {
        let buttonDiv = Div()
        let div = Div {
            Button(title: "First") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                context.beginPath()
                context.moveTo(x: 75, y: 50)
                context.lineTo(x: 100, y: 75)
                context.lineTo(x: 100, y: 25)
                context.fill()
                context.closePath()
                
            }
            Button(title: "Second") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                context.beginPath();
                context.arc(x: 75, y: 75, radius: 50, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
                context.moveTo(x: 110, y: 75)
                context.arc(x: 75, y: 75, radius: 35, startAngle: 0, endAngle: .pi, counterclockwise: false)
                context.moveTo(x: 65, y: 65)
                context.arc(x: 60, y: 65, radius: 5, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
                context.moveTo(x: 95, y: 65)
                context.arc(x: 90, y: 65, radius: 5, startAngle: 0, endAngle: .pi, counterclockwise: true)
                context.closePath()
                context.stroke()
                
            }
            Button(title: "Third") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                drawLoop(on: context)
                //                context
                //                drawDouble(on: context)
            }
            Button(title: "Fourth") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                drawDouble(on: context)
            }
            Button(title: "Fifth") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                drawQuadratic(on: context)
            }
        }
        
        let div02 = Div {
            Button(title: "Sixth") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                drawBezier(on: context)
            }
            Button(title: "Seven") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                example7(on: context)
            }
            Button(title: "8") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                let rectangle = Path2D()
                rectangle.rect(x: 40, y: 40, w: 200, h: 200)
                let circle = Path2D();
                circle.arc(x: 400, y: 140, radius: 100, startAngle: 0, endAngle: 2 * .pi)
                context.stroke(path: rectangle)
                context.fill(path: circle)
            }
            Button(title: "Example9") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                for i in 0..<6 {
                    for j in 0..<6 {
                        context.set(fillStyle: JSColor .rgb(r: UInt8(255 - 42.5 * Double(i)), g: UInt8(255 - 42.5 * Double(j)), b: 0) )
                        context.fillRect(x: Double(j*100), y: Double(i*100), w: 100, h: 100)
                    }
                }
            }
            
            Button(title: "Example10") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                for i in 0..<6 {
                    for j in 0..<6 {
                        let i = Double(i)
                        let j = Double(j)
                        context.set(strokeStyle: JSColor.rgb(r: 0, g: .init(255 - 42.5 * Double(i)), b: .init(255 - 42.5 * Double(j))) )
                        context.beginPath();
                        context.arc(x: 50 + j * 100, y: 50 + i * 100, radius: 40, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
                        context.stroke();
                    }
                }
            }
        }
        
        let div03 = Div {
            Button(title: "GlobalAlpha") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                // draw background
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                context.set(fillStyle: JSColor.rgb(r: 0xff, g: 0xdd, b: 0))
                context.fillRect(x: 0, y: 0, w: 300, h: 300)
                context.set(fillStyle: JSColor.rgb(r: 0x66, g: 0xcc, b: 0) )
                context.fillRect(x: 300, y: 0, w: 300, h: 300)
                context.set(fillStyle: JSColor.rgb(r: 0, g: 0x99, b: 0xff) )
                context.fillRect(x: 0, y: 300, w: 300, h: 300)
                context.set(fillStyle: JSColor.rgb(r: 0xff, g: 0x33, b: 0) )
                context.fillRect(x: 300, y: 300, w: 300, h: 300)
                context.set(fillStyle: JSColor.rgb(r: 0xff, g: 0xff, b: 0xff) )
                
                // set transparency value
                context.globalAlpha = 0.2
                
                // Draw semi transparent circles
                for i in 0..<7 {
                    context.beginPath()
                    context.arc(x: 300, y: 300, radius: 40 + 40 * Double(i), startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
                    context.fill()
                }
                context.globalAlpha = 1
            }
            Button(title: "RGBA") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                // Draw background
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                context.set(fillStyle: JSColor.rgb(r: 255, g: 221, b: 0) )
                
                context.fillRect(x: 0, y: 0, w: 600, h: 150);
                context.set(fillStyle: JSColor.rgb(r: 102, g: 204, b: 0) )
                context.fillRect(x: 0, y: 150, w: 600, h: 150)
                context.set(fillStyle: JSColor.rgb(r: 0, g: 153, b: 255) )
                context.fillRect(x: 0, y: 300, w: 600, h: 150);
                context.set(fillStyle: JSColor.rgb(r: 255, g: 51, b: 0) )
                context.fillRect(x: 0, y: 450, w: 600, h: 150);
                
                // Draw semi transparent rectangles
                for i in 0..<10 {
                    context.set(fillStyle: JSColor.rgba(r: 255, g: 255, b: 255, a: Double(i+1) / 10 ) )
                    for j in 0..<4 {
                        context.fillRect(x: 20 + Double(i) * 56, y: 20 + Double(j) * 150, w: 56, h: 110)
                    }
                }
            }
            
            Button(title: "Line") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                for i in 0..<10 {
                    context.lineWidth = 1 + Double(i)
                    context.beginPath()
                    context.moveTo(x: 20 + Double(i) * 56, y: 20)
                    context.lineTo(x: 20 + Double(i) * 56, y: 560)
                    context.stroke()
                }
            }
            
            Button(title: "LineCap") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                // Draw guides
                context.set(strokeStyle: JSColor.rgb(r: 0x00, g: 0x99, b: 0xff) )
                context.beginPath();
                context.moveTo(x: 40, y: 40)
                context.lineTo(x: 560, y: 40)
                context.moveTo(x: 40, y: 560)
                context.lineTo(x: 560, y: 560)
                context.stroke();
                
                // Draw lines
                context.set(strokeStyle: JSColor.rgb(r: 0x00, g: 0x00, b: 0x00) )
                for (i, cap) in LineCap.allCases.enumerated() {
                    context.lineWidth = 15;
                    context.lineCap = cap;
                    context.beginPath();
                    context.moveTo(x: 100 + Double(i) * 200, y: 40)
                    context.lineTo(x: 100 + Double(i) * 200, y: 560)
                    context.stroke();
                }
            }
            
            Button(title: "LineJoin") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                context.lineWidth = 10
                for (i, join) in LineJoin.allCases.enumerated() {
                    context.lineJoin = join
                    context.beginPath()
                    context.moveTo(x: -20, y: 20 + Double(i) * 160)
                    context.lineTo(x: 140, y: 180 + Double(i) * 160)
                    context.lineTo(x: 300, y: 20 + Double(i) * 160)
                    context.lineTo(x: 460, y: 180 + Double(i) * 160)
                    context.lineTo(x: 620, y: 20 + Double(i) * 160)
                    context.stroke()
                }
            }
        }
        
        let div04 = Div {
            Button(title: "LineMiter") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.clearRect(x: 0, y: 0, w: 800, h: 600)
                // Draw guides
                context.set(strokeStyle: JSColor.rgb(r: 0, g: 0x99, b: 0xff) )
                context.lineWidth = 2;
                context.strokeRect(x: -5, y: 50, w: 160, h: 50)
                
                // Set line styles
                context.set(strokeStyle: JSColor.rgb(r: 0, g: 0, b: 0) )
                context.lineWidth = 10
                
                // Draw lines
                context.beginPath();
                context.moveTo(x: 0, y: 100);
                for i in 0..<24 {
                    let dy: Double = ( i % 2 == 0) ? 25 : -25
                    context.lineTo(x: pow(Double(i), 1.5) * 2, y: 75 + dy)
                }
                context.stroke();
            }
            Button(title: "Dash") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                func draw(on context: CanvasRenderingContext2D, with offset: Double) {
                    context.clearRect(x: 0, y: 0, w: Double(canvas.element.width), h: Double(canvas.element.height))
                    context.setLineDash(segments: [4, 2])
                    context.lineDashOffset = -offset;
                    context.strokeRect(x: 40, y: 40, w: 400, h: 400)
                }
                
                draw(on: context, with: 2)
            }
            Button(title: "Gradients") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                let linear = context.createLinearGradient(x0: 0, y0: 0, x1: 0, y1: 600)
                
                linear.addColorStop(offset: 0, color: .rgb(r: 0, g: 0xab, b: 0xeb))
                linear.addColorStop(offset: 0.5, color: .rgb(r: 0xff, g: 0xff, b: 0xff))
                linear.addColorStop(offset: 0.5, color: .rgb(r: 0x00, g: 0xff, b: 0x00))
                linear.addColorStop(offset: 1, color: .rgb(r: 0xff, g: 0xff, b: 0xff))
                
                let linear2 = context.createLinearGradient(x0: 0, y0: 200, x1: 0, y1: 380)
                linear2.addColorStop(offset: 0.5, color: .rgb(r: 0, g: 0, b: 0))
                linear2.addColorStop(offset: 1, color: .rgba(r: 0, g: 0, b: 0, a: 0))
                
                context.set(fillStyle: linear)
                context.set(strokeStyle: linear2)
                
                // draw shapes
                context.fillRect(x: 40, y: 40, w: 520, h: 520)
                context.strokeRect(x: 200, y: 200, w: 200, h: 200)
            }
            Button(title: "Radial") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                // Create gradients
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
            Button(title: "Conic") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                let conic1 = context.createConicGradient(startAngle: 2, x: 248, y: 300)
                conic1.addColorStop(offset: 0, color: .rgb(r: 0xa7, g: 0xd3, b: 0xc))
                conic1.addColorStop(offset: 1, color: .white)
                
                let conic2 = context.createConicGradient(startAngle: 0, x: 748, y: 300)
                conic2.addColorStop(offset: 0, color: .black)
                conic2.addColorStop(offset: 0.25, color: .black)
                conic2.addColorStop(offset: 0.25, color: .white)
                conic2.addColorStop(offset: 0.5, color: .white)
                conic2.addColorStop(offset: 0.5, color: .black)
                conic2.addColorStop(offset: 0.75, color: .black)
                conic2.addColorStop(offset: 0.75, color: .white)
                conic2.addColorStop(offset: 1, color: .white)
                
                context.set(fillStyle: conic1)
                context.fillRect(x: 48, y: 100, w: 400, h: 400)
                
                context.set(fillStyle: conic2)
                context.fillRect(x: 548, y: 100, w: 400, h: 400)
            }
        }
        
        let div05 = Div {
            Button(title: "Pattern") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvasbase = Canvas(width: 200, height: 200)
                let contextBase = canvasbase.context
                let canvas = Canvas(width: 800, height: 800)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                //                contextBase.set(fillStyle: JSColor.black)
                contextBase.set(fillStyle: JSColor.black)
                contextBase.beginPath()
                contextBase.moveTo(x: 0, y: 0)
                contextBase.lineTo(x: 100, y: 0)
                contextBase.lineTo(x: 0, y: 100)
                contextBase.fill()
                let pattern = context.createPattern(image: .htmlCanvasElement(canvasbase.element), repetition: "repeat")
                contextBase.set(fillStyle: pattern!)
                context.fillRect(x: 0, y: 0, w: 800, h: 800)
            }
            Button(title: "Shadow") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 800)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.shadowOffsetX = 2;
                context.shadowOffsetY = 2;
                context.shadowBlur = 2;
                context.shadowColor = .rgba(r: 0, g: 0, b: 0, a: 0.5)
                
                context.font =  "20px Times New Roman";
                context.set(fillStyle: JSColor.black)
                context.fillText(text: "Sample String", x: 5, y: 30)
            }
            Button(title: "Fill") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 800)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.beginPath();
                context.arc(x: 50, y: 50, radius: 30, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
                context.arc(x: 50, y: 50, radius: 15, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
                context.fill(fillRule: .evenodd)
            }
        }
        
        let div06 = Div {
            Button(title: "fillText") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.font = "48px serif";
                context.fillText(text: "Hello, world", x: 10, y: 50)
            }
            
            Button(title: "strokeText") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.font = "48px serif";
                context.strokeText(text: "Hello world", x: 10, y: 50);
                context.textAlign = .right
                context.strokeText(text: "Right", x: 500, y: 500);
                
            }
            
            Button(title: "Measure") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                let text = context.measureText(text: "foo");
                context.font = "48px serif";
                context.strokeText(text: "\(text.width)", x: 10, y: 50);
            }
        }
        
        let div07 = Div {
            Button(title: "State") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.fillRect(x: 0, y: 0, w: 150, h: 150)
                context.save()
                
                context.set(fillStyle: JSColor.rgb(r: 0, g: 0x99, b: 0xff))
                context.fillRect(x: 15, y: 15, w: 120, h: 120)
                context.save()
                
                context.set(fillStyle: JSColor.white)
                context.globalAlpha = 0.5
                context.fillRect(x: 30, y: 30, w: 90, h: 90)
                
                context.restore()
                context.fillRect(x: 45, y: 45, w: 60, h: 60)
                
                context.restore()
                context.fillRect(x: 60, y: 60, w: 30, h: 30)
            }
            
            Button(title: "Translate") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                for i in 0..<3 {
                    for j in 0..<3 {
                        context.save()
                        context.set(fillStyle: JSColor.rgb(r: UInt8(51 * i), g: UInt8(255 - i * 51), b: 255))
                        context.translate(x: Double(40 + j * 200), y: Double(40 + i * 200))
                        context.fillRect(x: 0, y: 0, w: 100, h: 100)
                        context.restore()
                    }
                }
            }
            
            Button(title: "Rotate") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.save();
                context.set(fillStyle: JSColor.rgb(r: 0, g: 0x95, b: 0xdd))
                context.fillRect(x: 30, y: 30, w: 100, h: 100)
                context.rotate(angle: .pi / 180 * 25)
                context.set(fillStyle: JSColor.rgb(r: 0x4d, g: 0x4e, b: 0x53))
                context.fillRect(x: 30, y: 30, w: 100, h: 100)
                context.restore();
                
                context.set(fillStyle: JSColor.rgb(r: 0, g: 0x95, b: 0xdd))
                context.fillRect(x: 150, y: 30, w: 100, h: 100)
                
                context.translate(x: 200, y: 80)
                context.rotate(angle: .pi / 180 * 25)
                context.translate(x: -200, y: -80)
                
                context.set(fillStyle: JSColor.rgb(r: 0x4d, g: 0x4e, b: 0x53))
                context.fillRect(x: 150, y: 30, w: 100, h: 100)
            }
            
            Button(title: "Scaling") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                // draw a simple rectangle, but scale it.
                context.save();
                context.scale(x: 10, y: 3)
                context.fillRect(x: 1, y: 10, w: 10, h: 10)
                context.restore();
                
                context.scale(x: -1, y: 1)
                context.font = "48px serif";
                context.fillText(text: "MDN", x: -135, y: 120);
            }
            
            Button(title: "Transforms") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                // draw a simple rectangle, but scale it.
                let sina: Double = sin(.pi / 6)
                let cosa: Double = cos(.pi / 6)
                context.translate(x: 100, y: 100)
                for i in 0..<12 {
                    let c = UInt8( 255 / 12 * Double(i) )
                    context.set(fillStyle: JSColor.rgb(r: c, g: c, b: c))
                    context.fillRect(x: 0, y: 0, w: 100, h: 10)
                    context.transform(a: cosa, b: sina, c: -sina, d: cosa, e: 0, f: 0)
                }
                
                context.setTransform(a: -1, b: 0, c: 0,
                                     d: 1, e: 100, f: 100)
                context.set(fillStyle: JSColor.rgba(r: 255, g: 128, b: 255, a: 0.5))
                context.fillRect(x: 0, y: 50, w: 100, h: 100)
            }
        }
        
        let div08 = Div {
            Button(title: "Clip") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 600)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                
                context.fillRect(x: 0, y: 0, w: 150, h: 150)
                context.translate(x: 75, y: 75)
                context.beginPath()
                context.arc(x: 0, y: 0, radius: 60, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
                context.clip()
                let linearGradient = context.createLinearGradient(x0: 0, y0: -75, x1: 0, y1: 75)
                linearGradient.addColorStop(offset: 0, color: .rgb(r: 0x23, g: 0x22, b: 0x56))
                linearGradient.addColorStop(offset: 1, color: .rgb(r: 0x14, g: 0x37, b: 0x78))
                
                context.set(fillStyle: linearGradient)
                context.fillRect(x: -75, y: -75, w: 150, h: 150)
                
                func drawStar(on context: CanvasRenderingContext2D, radius: Double) {
                    context.save();
                    context.beginPath();
                    context.moveTo(x: radius, y: 0)
                    for i in 0..<9 {
                        context.rotate(angle: .pi / 5)
                        if  i % 2 == 0 {
                            context.lineTo(x: (radius / 0.525731) * 0.200811, y: 0)
                        } else {
                            context.lineTo(x: radius, y: 0)
                        }
                    }
                    context.closePath();
                    context.fill();
                    context.restore();
                }
                
                for _ in 1..<50 {
                    context.save()
                    context.set(fillStyle: JSColor.white)
                    context.translate(x: 75 - Double.random(in: 0...10) * 150 , y: 75 - .random(in: 0...10) * 150)
                    drawStar(on: context, radius: .random(in: 0...10) * 4 + 2)
                    context.restore()
                }
            }
            Button(title: "Sort") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 800, height: 612)
                let context = canvas.context
                
                func draw(arrs: [Double], on context: CanvasRenderingContext2D) {
                    context.clearRect(x: 0, y: 0, w: 800, h: 612)
                    func draw(rect: (x: Double, y: Double, width: Double, height: Double), on context: CanvasRenderingContext2D) {
                        context.set(fillStyle: JSColor.rgba(r: 0, g: 0, b: 0, a: 0.5))
                        context.fillRect(x: rect.x, y: 600 - rect.height, w: rect.width, h: rect.height)
                    }
                    for (i, arr) in arrs.enumerated() {
                        draw(rect: (x: Double(3 + 6*i) , y: 0, width: 4, height: arr), on: context)
                    }
                }
                var arrs = (0..<100).map { _ in Double.random(in: 0..<600) }
                draw(arrs: arrs, on: context)
                let sortButton = Button(title: "Next") {
                    arrs.sort()
                    draw(arrs: arrs, on: context)
                }
                _ = buttonDiv.element.jsValue.appendChild(sortButton.element.jsValue)
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
            }
            Button(title: "Basic Animations") {
                buttonDiv.element.jsObject.innerHTML = ""
                let canvas = Canvas(width: 300, height: 300)
                let context = canvas.context
                _ = buttonDiv.element.jsValue.appendChild(canvas.element.jsValue)
                let start = Double(Date().timeIntervalSince1970)
                
                func draw() {
                    context.globalCompositeOperation = "destination-over";
                    context.clearRect(x: 0, y: 0, w: 300, h: 300)
                    context.set(fillStyle: JSColor.rgba(r: 0, g: 0, b: 0, a: 0.4))
                    context.set(strokeStyle: JSColor.rgba(r: 0, g: 153, b: 255, a: 0.4))
                    context.save()
                    context.translate(x: 150, y: 150)
                    
                    // earth
                    let time = Date().timeIntervalSince1970 - start
                    context.rotate(angle: 2 * .pi / 60 * time)
                    context.translate(x: 105, y: 0)
                    
                    context.set(fillStyle: JSColor.rgb(r: 0, g: 0, b: 0xff))
                    context.beginPath()
                    context.arc(x: 0, y: 0, radius: 12, startAngle: 0, endAngle: 2 * .pi)
                    context.closePath()
                    context.fill()
                    context.set(fillStyle: JSColor.rgba(r: 0, g: 0, b: 0, a: 0.4))
                    context.fillRect(x: 0, y: -12, w: 40, h: 24)
                    
                    // Moon
                    context.save()
                    context.rotate(angle: 2 * .pi / 6 * time)
                    context.translate(x: 0, y: 28.5)
                    context.set(fillStyle: JSColor.rgb(r: 0xff, g: 0xff, b: 0xff))
                    context.beginPath()
                    context.arc(x: 0, y: 0, radius: 3.5, startAngle: 0, endAngle: 2 * .pi)
                    context.closePath()
                    context.fill()
                    context.set(fillStyle: JSColor.rgba(r: 0, g: 0, b: 0, a: 0.4))
                    context.restore()
                    
                    context.restore()
                    
                    context.beginPath()
                    context.arc(x: 150, y: 150, radius: 105, startAngle: 0, endAngle: .pi * 2, counterclockwise: false)
                    context.stroke()
                    
                    context.set(fillStyle: JSColor.rgb(r: 0, g: 0xff, b: 127))
                    context.beginPath()
                    context.arc(x: 150, y: 150, radius: 40, startAngle: 0, endAngle: 2 * .pi)
                    context.fill()
                    context.set(fillStyle: JSColor.rgb(r: 0, g: 0, b: 0))
                    context.fillRect(x: 0, y: 0, w: 300, h: 300)
                    
                    
                    
                    _ = globalThis.requestAnimationFrame { _ in
                        draw()
                    }
                }
                
                func startApp() {
                    _ = globalThis.requestAnimationFrame { _ in
                        draw()
                    }
                }
                startApp()
            }
            MouseButton(title: "Mouse Following", parent: buttonDiv.element)
            BouncingView(title: "Bouncing Ball", parent: buttonDiv.element)
            PixelDataView(parent: buttonDiv.element)
            GrayScaleView(parent: buttonDiv.element)
            ZoomingView(title: "Zoom", parent: buttonDiv.element)
        }
        
        let rootDiv = Div {
            buttonDiv
            div
            div02
            div03
            div04
            div05
            div06
            div07
            div08
            Div {
                WebSocketDemo(title: "WebSocket", parent: buttonDiv.element)
            }
        }
        _ = document.body?.appendChild(node: rootDiv.element)
    }
}
