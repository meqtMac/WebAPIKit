//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/8/30.
//

import JavaScriptKit
import WebAPIBase

/// CanvasFillStrokeStyles
public protocol CanvasFillStrokeStyles {
    func set( strokeStyle: FillStyle)
    func set( fillStyle: FillStyle)
    func createLinearGradient(x0: Double, y0: Double,
                              x1: Double, y1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient
    func createRadialGradient(x0: Double, y0: Double, r0: Double, 
                              x1: Double, y1: Double, r1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient
    func createConicGradient(startAngle: Double, x: Double, y: Double,
                             @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient
    func createPattern(image: CanvasImageSource, repetition: String) -> CanvasPattern?
}

public enum JSColor {
    case rgb(UInt8,UInt8,UInt8)
    case rgba(UInt8,UInt8,UInt8,Double)
    case white
    case black
    case blue
    case yellow
    case green
    case red
}

extension JSColor: ConvertibleToJSValue {
    public var jsValue: JavaScriptKit.JSValue {
        switch self {
        case let .rgb(r, g, b):
            return "rgb(\(r), \(g), \(b))".jsValue
        case let .rgba(r, g, b, a):
            return "rgba(\(r), \(g), \(b), \(a))".jsValue
        case .white:
            return "white".jsValue
        case .black:
            return "black".jsValue
        case .blue:
            return "blue".jsValue
        case .yellow:
            return "yellow".jsValue
        case .green:
            return "green".jsValue
        case .red:
            return "red".jsValue
        }
    }
}

public struct CanvasGradient: JSBridgedClass {
    @inlinable
    public static var constructor: JSFunction? { JSObject.global[Strings.CanvasGradient].function }
    
    public let jsObject: JSObject
    
    public init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @usableFromInline
    mutating func add(colorStop: ColorStop) {
        let this = jsObject
        _ = this[Strings.addColorStop].function!(this: this, arguments: [colorStop.0.jsValue, colorStop.1.jsValue])
    }
    
    public typealias ColorStop = (offset: Double, JSColor)
    
    @resultBuilder
    public enum ColorStopBuilder {
        public typealias Element = ColorStop
        public typealias Component = [Element]
        
        public static func buildBlock(_ components: Element...) -> Component {
            return components
        }
        
        public static func buildBlock(_ components: Component...) -> Component {
            return components.flatMap { $0 }
        }
        
        public static func buildExpression(_ expression: Element) -> Component {
            return [expression]
        }
        
        public static func buildEither(first component: Component) -> Component {
            return component
        }
        
        public static func buildEither(second component: Component) -> Component {
            return component
        }
        
        public static func buildArray(_ components: [Component]) -> Component {
            return components.flatMap { $0 }
        }
        
        public static func buildOptional(_ component: Component?) -> Component {
            if let component {
                return component
            } else {
                return []
            }
        }
    }
    
    
}

public struct CanvasPattern: JSBridgedClass {
    @inlinable public static var constructor: JSFunction? { JSObject.global[Strings.CanvasPattern].function }
    
    public let jsObject: JSObject
    
    public init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public func setTransform(transform: DOMMatrix2DInit? = nil) {
        let this = jsObject
        _ = this[Strings.setTransform].function!(this: this, arguments: [_toJSValue(transform)])
    }
}

public protocol FillStyle: ConvertibleToJSValue {}
extension JSColor: FillStyle {}
extension CanvasPattern: FillStyle {}
extension CanvasGradient: FillStyle {}

public extension CanvasFillStrokeStyles where Self: JSBridgedClass {
    @inlinable
    func set( strokeStyle: FillStyle) {
        jsObject[Strings.strokeStyle] = _toJSValue(strokeStyle)
    }
    
    @inlinable
    func set( fillStyle: FillStyle ) {
        jsObject[Strings.fillStyle] = _toJSValue(fillStyle)
    }
    
    @inlinable
    func createLinearGradient(x0: Double, y0: Double,
                              x1: Double, y1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient {
        var gradient: CanvasGradient =  jsObject[Strings.createLinearGradient]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(x0), _toJSValue(y0), _toJSValue(x1), _toJSValue(y1)]
            ).fromJSValue()!
        
        for colorStop in colorStops() {
            gradient.add(colorStop: colorStop)
        }
        
        return gradient
    }
    
    @inlinable
    func createRadialGradient(x0: Double, y0: Double, r0: Double, 
                              x1: Double, y1: Double, r1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient {
        var gradient: CanvasGradient =  jsObject[Strings.createRadialGradient]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(x0), _toJSValue(y0), _toJSValue(r0), _toJSValue(x1), _toJSValue(y1), _toJSValue(r1)]
            ).fromJSValue()!
        
        for colorStop in colorStops() {
            gradient.add(colorStop: colorStop)
        }
        
        return gradient
    }
    
    @inlinable
    func createConicGradient(startAngle: Double, x: Double, y: Double,
                             @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient {
        var gradient: CanvasGradient =  jsObject[Strings.createConicGradient]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(startAngle), _toJSValue(x), _toJSValue(y)]
            ).fromJSValue()!
        
        for colorStop in colorStops() {
            gradient.add(colorStop: colorStop)
        }
        
        return gradient
    }
    
    @inlinable
    func createPattern(image: CanvasImageSource, repetition: String) -> CanvasPattern? {
        return jsObject[Strings.createPattern]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(image), _toJSValue(repetition)]
            ).fromJSValue()
    }
}
