//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/8/31.
//

import JavaScriptKit
import WebAPIBase
import Foundation

public protocol CanvasCompositing {
    var globalAlpha: Double { get set }
    var globalCompositeOperation: String { get set }
}

public extension CanvasCompositing where Self: JSBridgedClass {
    @inlinable var globalAlpha: Double {
        get { jsObject[Strings.globalAlpha].fromJSValue()! }
        nonmutating set { jsObject[Strings.globalAlpha] = _toJSValue(newValue) }
    }

    @inlinable var globalCompositeOperation: String {
        get { jsObject[Strings.globalCompositeOperation].fromJSValue()! }
        nonmutating set { jsObject[Strings.globalCompositeOperation] = _toJSValue(newValue) }
    }
}

public enum CanvasDirection: JSString, JSValueCompatible {
    case ltr = "ltr"
    case rtl = "rtl"
    case inherit = "inherit"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public protocol CanvasDrawImage: JSBridgedClass {}
public extension CanvasDrawImage {
    @inlinable func drawImage(image: CanvasImageSource, dx: Double, dy: Double) {
        let this = jsObject
        _ = this[Strings.drawImage].function!(this: this, arguments: [_toJSValue(image), _toJSValue(dx), _toJSValue(dy)])
    }

    @inlinable func drawImage(image: CanvasImageSource, dx: Double, dy: Double, dw: Double, dh: Double) {
        let this = jsObject
        _ = this[Strings.drawImage].function!(this: this, arguments: [_toJSValue(image), _toJSValue(dx), _toJSValue(dy), _toJSValue(dw), _toJSValue(dh)])
    }

    @inlinable func drawImage(image: CanvasImageSource, sx: Double, sy: Double, sw: Double, sh: Double, dx: Double, dy: Double, dw: Double, dh: Double) {
        let this = jsObject
        _ = this[Strings.drawImage].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(dx), _toJSValue(dy), _toJSValue(dw), _toJSValue(dh)])
    }
}

public protocol CanvasDrawPath: JSBridgedClass {}
public extension CanvasDrawPath {
    @inlinable func beginPath() {
        let this = jsObject
        _ = this[Strings.beginPath].function!(this: this, arguments: [])
    }

    @inlinable func fill(fillRule: CanvasFillRule? = nil) {
        let this = jsObject
        _ = this[Strings.fill].function!(this: this, arguments: [_toJSValue(fillRule)])
    }

    @inlinable func fill(path: Path2D, fillRule: CanvasFillRule? = nil) {
        let this = jsObject
        _ = this[Strings.fill].function!(this: this, arguments: [_toJSValue(path), _toJSValue(fillRule)])
    }

    @inlinable func stroke() {
        let this = jsObject
        _ = this[Strings.stroke].function!(this: this, arguments: [])
    }

    @inlinable func stroke(path: Path2D) {
        let this = jsObject
        _ = this[Strings.stroke].function!(this: this, arguments: [_toJSValue(path)])
    }

    @inlinable func clip(fillRule: CanvasFillRule? = nil) {
        let this = jsObject
        _ = this[Strings.clip].function!(this: this, arguments: [_toJSValue(fillRule)])
    }

    @inlinable func clip(path: Path2D, fillRule: CanvasFillRule? = nil) {
        let this = jsObject
        _ = this[Strings.clip].function!(this: this, arguments: [_toJSValue(path), _toJSValue(fillRule)])
    }

    @inlinable func isPointInPath(x: Double, y: Double, fillRule: CanvasFillRule? = nil) -> Bool {
        let this = jsObject
        return this[Strings.isPointInPath].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(fillRule)]).fromJSValue()!
    }

    @inlinable func isPointInPath(path: Path2D, x: Double, y: Double, fillRule: CanvasFillRule? = nil) -> Bool {
        let this = jsObject
        return this[Strings.isPointInPath].function!(this: this, arguments: [_toJSValue(path), _toJSValue(x), _toJSValue(y), _toJSValue(fillRule)]).fromJSValue()!
    }

    @inlinable func isPointInStroke(x: Double, y: Double) -> Bool {
        let this = jsObject
        return this[Strings.isPointInStroke].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }

    @inlinable func isPointInStroke(path: Path2D, x: Double, y: Double) -> Bool {
        let this = jsObject
        return this[Strings.isPointInStroke].function!(this: this, arguments: [_toJSValue(path), _toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }
}

public enum CanvasFillRule: JSString, JSValueCompatible {
    case nonzero = "nonzero"
    case evenodd = "evenodd"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public protocol CanvasFilters: JSBridgedClass {}
public extension CanvasFilters {
    @inlinable var filter: String {
        get { jsObject[Strings.filter].fromJSValue()! }
        nonmutating set { jsObject[Strings.filter] = _toJSValue(newValue) }
    }
}

public enum CanvasFontKerning: JSString, JSValueCompatible {
    case auto = "auto"
    case normal = "normal"
    case none = "none"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public enum CanvasFontStretch: JSString, JSValueCompatible {
    case ultraCondensed = "ultra-condensed"
    case extraCondensed = "extra-condensed"
    case condensed = "condensed"
    case semiCondensed = "semi-condensed"
    case normal = "normal"
    case semiExpanded = "semi-expanded"
    case expanded = "expanded"
    case extraExpanded = "extra-expanded"
    case ultraExpanded = "ultra-expanded"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public enum CanvasFontVariantCaps: JSString, JSValueCompatible {
    case normal = "normal"
    case smallCaps = "small-caps"
    case allSmallCaps = "all-small-caps"
    case petiteCaps = "petite-caps"
    case allPetiteCaps = "all-petite-caps"
    case unicase = "unicase"
    case titlingCaps = "titling-caps"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public protocol CanvasImageData: JSBridgedClass {}
public extension CanvasImageData {
    @inlinable func createImageData(sw: Int32, sh: Int32, settings: ImageDataSettings? = nil) -> ImageData {
        let this = jsObject
        return this[Strings.createImageData].function!(this: this, arguments: [_toJSValue(sw), _toJSValue(sh), _toJSValue(settings)]).fromJSValue()!
    }

    @inlinable func createImageData(imagedata: ImageData) -> ImageData {
        let this = jsObject
        return this[Strings.createImageData].function!(this: this, arguments: [_toJSValue(imagedata)]).fromJSValue()!
    }

    @inlinable func getImageData(sx: Int32, sy: Int32, sw: Int32, sh: Int32, settings: ImageDataSettings? = nil) -> ImageData {
        let this = jsObject
        return this[Strings.getImageData].function!(this: this, arguments: [_toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(settings)]).fromJSValue()!
    }

    @inlinable func putImageData(imagedata: ImageData, dx: Int32, dy: Int32) {
        let this = jsObject
        _ = this[Strings.putImageData].function!(this: this, arguments: [_toJSValue(imagedata), _toJSValue(dx), _toJSValue(dy)])
    }

    @inlinable func putImageData(imagedata: ImageData, dx: Int32, dy: Int32, dirtyX: Int32, dirtyY: Int32, dirtyWidth: Int32, dirtyHeight: Int32) {
        let this = jsObject
        _ = this[Strings.putImageData].function!(this: this, arguments: [_toJSValue(imagedata), _toJSValue(dx), _toJSValue(dy), _toJSValue(dirtyX), _toJSValue(dirtyY), _toJSValue(dirtyWidth), _toJSValue(dirtyHeight)])
    }
}

public protocol CanvasImageSmoothing: JSBridgedClass {}
public extension CanvasImageSmoothing {
    @inlinable var imageSmoothingEnabled: Bool {
        get { jsObject[Strings.imageSmoothingEnabled].fromJSValue()! }
        nonmutating set { jsObject[Strings.imageSmoothingEnabled] = _toJSValue(newValue) }
    }

    @inlinable var imageSmoothingQuality: ImageSmoothingQuality {
        get { jsObject[Strings.imageSmoothingQuality].fromJSValue()! }
        nonmutating set { jsObject[Strings.imageSmoothingQuality] = _toJSValue(newValue) }
    }
}

public protocol CanvasPath: JSBridgedClass {}
public extension CanvasPath {
    @inlinable func closePath() {
        let this = jsObject
        _ = this[Strings.closePath].function!(this: this, arguments: [])
    }

    @inlinable func moveTo(x: Double, y: Double) {
        let this = jsObject
        _ = this[Strings.moveTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable func lineTo(x: Double, y: Double) {
        let this = jsObject
        _ = this[Strings.lineTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable func quadraticCurveTo(cpx: Double, cpy: Double, x: Double, y: Double) {
        let this = jsObject
        _ = this[Strings.quadraticCurveTo].function!(this: this, arguments: [_toJSValue(cpx), _toJSValue(cpy), _toJSValue(x), _toJSValue(y)])
    }

    @inlinable func bezierCurveTo(cp1x: Double, cp1y: Double, cp2x: Double, cp2y: Double, x: Double, y: Double) {
        let this = jsObject
        _ = this[Strings.bezierCurveTo].function!(this: this, arguments: [_toJSValue(cp1x), _toJSValue(cp1y), _toJSValue(cp2x), _toJSValue(cp2y), _toJSValue(x), _toJSValue(y)])
    }

    @inlinable func arcTo(x1: Double, y1: Double, x2: Double, y2: Double, radius: Double) {
        let this = jsObject
        _ = this[Strings.arcTo].function!(this: this, arguments: [_toJSValue(x1), _toJSValue(y1), _toJSValue(x2), _toJSValue(y2), _toJSValue(radius)])
    }

    @inlinable func rect(x: Double, y: Double, w: Double, h: Double) {
        let this = jsObject
        _ = this[Strings.rect].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(w), _toJSValue(h)])
    }

    @inlinable func roundRect(x: Double, y: Double, w: Double, h: Double, radii: DOMPointInit_or_Double_or_seq_of_DOMPointInit_or_Double? = nil) {
        let this = jsObject
        _ = this[Strings.roundRect].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(w), _toJSValue(h), _toJSValue(radii)])
    }

    @inlinable func arc(x: Double, y: Double, radius: Double, startAngle: Double, endAngle: Double, counterclockwise: Bool? = nil) {
        let this = jsObject
        _ = this[Strings.arc].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(radius), _toJSValue(startAngle), _toJSValue(endAngle), _toJSValue(counterclockwise)])
    }

    @inlinable func ellipse(x: Double, y: Double, radiusX: Double, radiusY: Double, rotation: Double, startAngle: Double, endAngle: Double, counterclockwise: Bool? = nil) {
        let this = jsObject
        _ = this[Strings.ellipse].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(radiusX), _toJSValue(radiusY), _toJSValue(rotation), _toJSValue(startAngle), _toJSValue(endAngle), _toJSValue(counterclockwise)])
    }
}

extension CGFloat: JSValueCompatible {
    public var jsValue: JavaScriptKit.JSValue {
        .number(self)
    }
}

public protocol CanvasRect: JSBridgedClass {}
public extension CanvasRect {
    @inlinable
    func clear(rect: CGRect) {
        jsObject[Strings.clearRect].function!(this: jsObject,
                                              arguments: [rect.origin.x.jsValue,
                                                          rect.origin.y.jsValue,
                                                          rect.size.width.jsValue,
                                                          rect.size.height.jsValue])
    }

    @inlinable 
    func fill(rect: CGRect) {
        _ = jsObject[Strings.fillRect]
            .function!(
                this: jsObject,
                arguments: [rect.origin.x.jsValue,
                            rect.origin.y.jsValue,
                            rect.size.width.jsValue,
                            rect.size.height.jsValue]
            )
    }

    @inlinable 
    func stroke(rect: CGRect) {
        _ = jsObject[Strings.strokeRect]
            .function!(
                this: jsObject,
                arguments: [rect.origin.x.jsValue,
                            rect.origin.y.jsValue,
                            rect.size.width.jsValue,
                            rect.size.height.jsValue]
            )
    }
}
public protocol CanvasShadowStyles: JSBridgedClass {}
public extension CanvasShadowStyles {
    @inlinable var shadowOffsetX: Double {
        get { jsObject[Strings.shadowOffsetX].fromJSValue()! }
        nonmutating set { jsObject[Strings.shadowOffsetX] = _toJSValue(newValue) }
    }

    @inlinable var shadowOffsetY: Double {
        get { jsObject[Strings.shadowOffsetY].fromJSValue()! }
        nonmutating set { jsObject[Strings.shadowOffsetY] = _toJSValue(newValue) }
    }

    @inlinable var shadowBlur: Double {
        get { jsObject[Strings.shadowBlur].fromJSValue()! }
        nonmutating set { jsObject[Strings.shadowBlur] = _toJSValue(newValue) }
    }

    @inlinable var shadowColor: JSColor {
        get {
//            jsObject[Strings.shadowColor].fromJSValue()!
            fatalError()
        }
        nonmutating set { jsObject[Strings.shadowColor] = _toJSValue(newValue) }
    }
}



public protocol CanvasText: JSBridgedClass {}
public extension CanvasText {
    @inlinable func fill(_ text: String, x: Double, y: Double, maxWidth: Double? = nil) {
        let this = jsObject
        _ = this[Strings.fillText].function!(this: this, arguments: [_toJSValue(text), _toJSValue(x), _toJSValue(y), _toJSValue(maxWidth)])
    }

    @inlinable func stroke(_ text: String, x: Double, y: Double, maxWidth: Double? = nil) {
        let this = jsObject
        _ = this[Strings.strokeText].function!(this: this, arguments: [_toJSValue(text), _toJSValue(x), _toJSValue(y), _toJSValue(maxWidth)])
    }

    @inlinable func measure(_ text: String) -> TextMetrics {
        let this = jsObject
        return this[Strings.measureText].function!(this: this, arguments: [_toJSValue(text)]).fromJSValue()!
    }
}

public enum CanvasTextAlign: JSString, JSValueCompatible {
    case start = "start"
    case end = "end"
    case left = "left"
    case right = "right"
    case center = "center"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public enum CanvasTextBaseline: JSString, JSValueCompatible {
    case top = "top"
    case hanging = "hanging"
    case middle = "middle"
    case alphabetic = "alphabetic"
    case ideographic = "ideographic"
    case bottom = "bottom"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public protocol CanvasTextDrawingStyles: JSBridgedClass {}
public extension CanvasTextDrawingStyles {
    @inlinable var font: String {
        get { jsObject[Strings.font].fromJSValue()! }
        nonmutating set { jsObject[Strings.font] = _toJSValue(newValue) }
    }

    @inlinable var textAlign: CanvasTextAlign {
        get { jsObject[Strings.textAlign].fromJSValue()! }
        nonmutating set { jsObject[Strings.textAlign] = _toJSValue(newValue) }
    }

    @inlinable var textBaseline: CanvasTextBaseline {
        get { jsObject[Strings.textBaseline].fromJSValue()! }
        nonmutating set { jsObject[Strings.textBaseline] = _toJSValue(newValue) }
    }

    @inlinable var direction: CanvasDirection {
        get { jsObject[Strings.direction].fromJSValue()! }
        nonmutating set { jsObject[Strings.direction] = _toJSValue(newValue) }
    }

    @inlinable var letterSpacing: String {
        get { jsObject[Strings.letterSpacing].fromJSValue()! }
        nonmutating set { jsObject[Strings.letterSpacing] = _toJSValue(newValue) }
    }

    @inlinable var fontKerning: CanvasFontKerning {
        get { jsObject[Strings.fontKerning].fromJSValue()! }
        nonmutating set { jsObject[Strings.fontKerning] = _toJSValue(newValue) }
    }

    @inlinable var fontStretch: CanvasFontStretch {
        get { jsObject[Strings.fontStretch].fromJSValue()! }
        nonmutating set { jsObject[Strings.fontStretch] = _toJSValue(newValue) }
    }

    @inlinable var fontVariantCaps: CanvasFontVariantCaps {
        get { jsObject[Strings.fontVariantCaps].fromJSValue()! }
        nonmutating set { jsObject[Strings.fontVariantCaps] = _toJSValue(newValue) }
    }

    @inlinable var textRendering: CanvasTextRendering {
        get { jsObject[Strings.textRendering].fromJSValue()! }
        nonmutating set { jsObject[Strings.textRendering] = _toJSValue(newValue) }
    }

    @inlinable var wordSpacing: String {
        get { jsObject[Strings.wordSpacing].fromJSValue()! }
        nonmutating set { jsObject[Strings.wordSpacing] = _toJSValue(newValue) }
    }
}

public enum CanvasTextRendering: JSString, JSValueCompatible {
    case auto = "auto"
    case optimizeSpeed = "optimizeSpeed"
    case optimizeLegibility = "optimizeLegibility"
    case geometricPrecision = "geometricPrecision"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public protocol CanvasUserInterface: JSBridgedClass {}

public extension CanvasUserInterface {
    @inlinable func drawFocusIfNeeded(element: Element) {
        let this = jsObject
        _ = this[Strings.drawFocusIfNeeded].function!(this: this, arguments: [_toJSValue(element)])
    }

    @inlinable func drawFocusIfNeeded(path: Path2D, element: Element) {
        let this = jsObject
        _ = this[Strings.drawFocusIfNeeded].function!(this: this, arguments: [_toJSValue(path), _toJSValue(element)])
    }

    @inlinable func scrollPathIntoView() {
        let this = jsObject
        _ = this[Strings.scrollPathIntoView].function!(this: this, arguments: [])
    }

    @inlinable func scrollPathIntoView(path: Path2D) {
        let this = jsObject
        _ = this[Strings.scrollPathIntoView].function!(this: this, arguments: [_toJSValue(path)])
    }
}

