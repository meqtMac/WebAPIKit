// This file was auto-generated by WebIDLToSwift. DO NOT EDIT!

import JavaScriptEventLoop
import JavaScriptKit

public class DOMRectReadOnly: JSBridgedClass {
    @inlinable public class var constructor: JSFunction { JSObject.global[Strings.DOMRectReadOnly].function! }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _x = ReadonlyAttribute(jsObject: jsObject, name: Strings.x)
        _y = ReadonlyAttribute(jsObject: jsObject, name: Strings.y)
        _width = ReadonlyAttribute(jsObject: jsObject, name: Strings.width)
        _height = ReadonlyAttribute(jsObject: jsObject, name: Strings.height)
        _top = ReadonlyAttribute(jsObject: jsObject, name: Strings.top)
        _right = ReadonlyAttribute(jsObject: jsObject, name: Strings.right)
        _bottom = ReadonlyAttribute(jsObject: jsObject, name: Strings.bottom)
        _left = ReadonlyAttribute(jsObject: jsObject, name: Strings.left)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, width: Double? = nil, height: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor.new(arguments: [x?.jsValue ?? .undefined, y?.jsValue ?? .undefined, width?.jsValue ?? .undefined, height?.jsValue ?? .undefined]))
    }

    @inlinable public static func fromRect(other: DOMRectInit? = nil) -> Self {
        let this = constructor
        return this[Strings.fromRect].function!(this: this, arguments: [other?.jsValue ?? .undefined]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var x: Double

    @ReadonlyAttribute
    public var y: Double

    @ReadonlyAttribute
    public var width: Double

    @ReadonlyAttribute
    public var height: Double

    @ReadonlyAttribute
    public var top: Double

    @ReadonlyAttribute
    public var right: Double

    @ReadonlyAttribute
    public var bottom: Double

    @ReadonlyAttribute
    public var left: Double

    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[Strings.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}