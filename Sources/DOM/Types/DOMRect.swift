//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class DOMPoint: DOMPointReadOnly {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DOMPoint].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _x = ReadWriteAttribute(jsObject: jsObject, name: .x)
        _y = ReadWriteAttribute(jsObject: jsObject, name: .y)
        _z = ReadWriteAttribute(jsObject: jsObject, name: .z)
        _w = ReadWriteAttribute(jsObject: jsObject, name: .w)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, z: Double? = nil, w: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)]))
    }

    @inlinable override public class func fromPoint(other: DOMPointInit? = nil) -> Self {
        let this = constructor!
        return this[.fromPoint].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @usableFromInline let _x: ReadWriteAttribute<Double>
    @inlinable override public var x: Double {
        get { _x.wrappedValue }
        set { _x.wrappedValue = newValue }
    }

    @usableFromInline let _y: ReadWriteAttribute<Double>
    @inlinable override public var y: Double {
        get { _y.wrappedValue }
        set { _y.wrappedValue = newValue }
    }

    @usableFromInline let _z: ReadWriteAttribute<Double>
    @inlinable override public var z: Double {
        get { _z.wrappedValue }
        set { _z.wrappedValue = newValue }
    }

    @usableFromInline let _w: ReadWriteAttribute<Double>
    @inlinable override public var w: Double {
        get { _w.wrappedValue }
        set { _w.wrappedValue = newValue }
    }
}

public class DOMPointInit: BridgedDictionary {
    public convenience init(x: Double, y: Double, z: Double, w: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.x] = _toJSValue(x)
        object[.y] = _toJSValue(y)
        object[.z] = _toJSValue(z)
        object[.w] = _toJSValue(w)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _x = ReadWriteAttribute(jsObject: object, name: .x)
        _y = ReadWriteAttribute(jsObject: object, name: .y)
        _z = ReadWriteAttribute(jsObject: object, name: .z)
        _w = ReadWriteAttribute(jsObject: object, name: .w)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var x: Double

    @ReadWriteAttribute
    public var y: Double

    @ReadWriteAttribute
    public var z: Double

    @ReadWriteAttribute
    public var w: Double
}

public class DOMPointReadOnly: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMPointReadOnly].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _x = ReadonlyAttribute(jsObject: jsObject, name: .x)
        _y = ReadonlyAttribute(jsObject: jsObject, name: .y)
        _z = ReadonlyAttribute(jsObject: jsObject, name: .z)
        _w = ReadonlyAttribute(jsObject: jsObject, name: .w)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, z: Double? = nil, w: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)]))
    }

    @inlinable public class func fromPoint(other: DOMPointInit? = nil) -> Self {
        let this = constructor!
        return this[.fromPoint].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var x: Double

    @ReadonlyAttribute
    public var y: Double

    @ReadonlyAttribute
    public var z: Double

    @ReadonlyAttribute
    public var w: Double

    @inlinable public func matrixTransform(matrix: DOMMatrixInit? = nil) -> DOMPoint {
        let this = jsObject
        return this[.matrixTransform].function!(this: this, arguments: [_toJSValue(matrix)]).fromJSValue()!
    }

    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class DOMQuad: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMQuad].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _p1 = ReadonlyAttribute(jsObject: jsObject, name: .p1)
        _p2 = ReadonlyAttribute(jsObject: jsObject, name: .p2)
        _p3 = ReadonlyAttribute(jsObject: jsObject, name: .p3)
        _p4 = ReadonlyAttribute(jsObject: jsObject, name: .p4)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(p1: DOMPointInit? = nil, p2: DOMPointInit? = nil, p3: DOMPointInit? = nil, p4: DOMPointInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(p1), _toJSValue(p2), _toJSValue(p3), _toJSValue(p4)]))
    }

    @inlinable public class func fromRect(other: DOMRectInit? = nil) -> Self {
        let this = constructor!
        return this[.fromRect].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable public class func fromQuad(other: DOMQuadInit? = nil) -> Self {
        let this = constructor!
        return this[.fromQuad].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var p1: DOMPoint

    @ReadonlyAttribute
    public var p2: DOMPoint

    @ReadonlyAttribute
    public var p3: DOMPoint

    @ReadonlyAttribute
    public var p4: DOMPoint

    @inlinable public func getBounds() -> DOMRect {
        let this = jsObject
        return this[.getBounds].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class DOMQuadInit: BridgedDictionary {
    public convenience init(p1: DOMPointInit, p2: DOMPointInit, p3: DOMPointInit, p4: DOMPointInit) {
        let object = JSObject.global[.Object].function!.new()
        object[.p1] = _toJSValue(p1)
        object[.p2] = _toJSValue(p2)
        object[.p3] = _toJSValue(p3)
        object[.p4] = _toJSValue(p4)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _p1 = ReadWriteAttribute(jsObject: object, name: .p1)
        _p2 = ReadWriteAttribute(jsObject: object, name: .p2)
        _p3 = ReadWriteAttribute(jsObject: object, name: .p3)
        _p4 = ReadWriteAttribute(jsObject: object, name: .p4)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var p1: DOMPointInit

    @ReadWriteAttribute
    public var p2: DOMPointInit

    @ReadWriteAttribute
    public var p3: DOMPointInit

    @ReadWriteAttribute
    public var p4: DOMPointInit
}

public class DOMRect: DOMRectReadOnly {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DOMRect].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _x = ReadWriteAttribute(jsObject: jsObject, name: .x)
        _y = ReadWriteAttribute(jsObject: jsObject, name: .y)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, width: Double? = nil, height: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)]))
    }

    @inlinable override public class func fromRect(other: DOMRectInit? = nil) -> Self {
        let this = constructor!
        return this[.fromRect].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @usableFromInline let _x: ReadWriteAttribute<Double>
    @inlinable override public var x: Double {
        get { _x.wrappedValue }
        set { _x.wrappedValue = newValue }
    }

    @usableFromInline let _y: ReadWriteAttribute<Double>
    @inlinable override public var y: Double {
        get { _y.wrappedValue }
        set { _y.wrappedValue = newValue }
    }

    @usableFromInline let _width: ReadWriteAttribute<Double>
    @inlinable override public var width: Double {
        get { _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }

    @usableFromInline let _height: ReadWriteAttribute<Double>
    @inlinable override public var height: Double {
        get { _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
}

public class DOMRectInit: BridgedDictionary {
    public convenience init(x: Double, y: Double, width: Double, height: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.x] = _toJSValue(x)
        object[.y] = _toJSValue(y)
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _x = ReadWriteAttribute(jsObject: object, name: .x)
        _y = ReadWriteAttribute(jsObject: object, name: .y)
        _width = ReadWriteAttribute(jsObject: object, name: .width)
        _height = ReadWriteAttribute(jsObject: object, name: .height)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var x: Double

    @ReadWriteAttribute
    public var y: Double

    @ReadWriteAttribute
    public var width: Double

    @ReadWriteAttribute
    public var height: Double
}

public class DOMRectList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMRectList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> DOMRect? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> DOMRect? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
}

public class DOMRectReadOnly: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMRectReadOnly].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _x = ReadonlyAttribute(jsObject: jsObject, name: .x)
        _y = ReadonlyAttribute(jsObject: jsObject, name: .y)
        _width = ReadonlyAttribute(jsObject: jsObject, name: .width)
        _height = ReadonlyAttribute(jsObject: jsObject, name: .height)
        _top = ReadonlyAttribute(jsObject: jsObject, name: .top)
        _right = ReadonlyAttribute(jsObject: jsObject, name: .right)
        _bottom = ReadonlyAttribute(jsObject: jsObject, name: .bottom)
        _left = ReadonlyAttribute(jsObject: jsObject, name: .left)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, width: Double? = nil, height: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)]))
    }

    @inlinable public class func fromRect(other: DOMRectInit? = nil) -> Self {
        let this = constructor!
        return this[.fromRect].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
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
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}
