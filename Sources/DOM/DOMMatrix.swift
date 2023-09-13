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


public class DOMMatrix: DOMMatrixReadOnly {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DOMMatrix].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _a = ReadWriteAttribute(jsObject: jsObject, name: .a)
        _b = ReadWriteAttribute(jsObject: jsObject, name: .b)
        _c = ReadWriteAttribute(jsObject: jsObject, name: .c)
        _d = ReadWriteAttribute(jsObject: jsObject, name: .d)
        _e = ReadWriteAttribute(jsObject: jsObject, name: .e)
        _f = ReadWriteAttribute(jsObject: jsObject, name: .f)
        _m11 = ReadWriteAttribute(jsObject: jsObject, name: .m11)
        _m12 = ReadWriteAttribute(jsObject: jsObject, name: .m12)
        _m13 = ReadWriteAttribute(jsObject: jsObject, name: .m13)
        _m14 = ReadWriteAttribute(jsObject: jsObject, name: .m14)
        _m21 = ReadWriteAttribute(jsObject: jsObject, name: .m21)
        _m22 = ReadWriteAttribute(jsObject: jsObject, name: .m22)
        _m23 = ReadWriteAttribute(jsObject: jsObject, name: .m23)
        _m24 = ReadWriteAttribute(jsObject: jsObject, name: .m24)
        _m31 = ReadWriteAttribute(jsObject: jsObject, name: .m31)
        _m32 = ReadWriteAttribute(jsObject: jsObject, name: .m32)
        _m33 = ReadWriteAttribute(jsObject: jsObject, name: .m33)
        _m34 = ReadWriteAttribute(jsObject: jsObject, name: .m34)
        _m41 = ReadWriteAttribute(jsObject: jsObject, name: .m41)
        _m42 = ReadWriteAttribute(jsObject: jsObject, name: .m42)
        _m43 = ReadWriteAttribute(jsObject: jsObject, name: .m43)
        _m44 = ReadWriteAttribute(jsObject: jsObject, name: .m44)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(init: String_or_seq_of_Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @inlinable override public class func fromMatrix(other: DOMMatrixInit? = nil) -> Self {
        let this = constructor!
        return this[.fromMatrix].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable override public class func fromFloat32Array(array32: Float32Array) -> Self {
        let this = constructor!
        return this[.fromFloat32Array].function!(this: this, arguments: [_toJSValue(array32)]).fromJSValue()!
    }

    @inlinable override public class func fromFloat64Array(array64: Float64Array) -> Self {
        let this = constructor!
        return this[.fromFloat64Array].function!(this: this, arguments: [_toJSValue(array64)]).fromJSValue()!
    }

    @usableFromInline let _a: ReadWriteAttribute<Double>
    @inlinable override public var a: Double {
        get { _a.wrappedValue }
        set { _a.wrappedValue = newValue }
    }

    @usableFromInline let _b: ReadWriteAttribute<Double>
    @inlinable override public var b: Double {
        get { _b.wrappedValue }
        set { _b.wrappedValue = newValue }
    }

    @usableFromInline let _c: ReadWriteAttribute<Double>
    @inlinable override public var c: Double {
        get { _c.wrappedValue }
        set { _c.wrappedValue = newValue }
    }

    @usableFromInline let _d: ReadWriteAttribute<Double>
    @inlinable override public var d: Double {
        get { _d.wrappedValue }
        set { _d.wrappedValue = newValue }
    }

    @usableFromInline let _e: ReadWriteAttribute<Double>
    @inlinable override public var e: Double {
        get { _e.wrappedValue }
        set { _e.wrappedValue = newValue }
    }

    @usableFromInline let _f: ReadWriteAttribute<Double>
    @inlinable override public var f: Double {
        get { _f.wrappedValue }
        set { _f.wrappedValue = newValue }
    }

    @usableFromInline let _m11: ReadWriteAttribute<Double>
    @inlinable override public var m11: Double {
        get { _m11.wrappedValue }
        set { _m11.wrappedValue = newValue }
    }

    @usableFromInline let _m12: ReadWriteAttribute<Double>
    @inlinable override public var m12: Double {
        get { _m12.wrappedValue }
        set { _m12.wrappedValue = newValue }
    }

    @usableFromInline let _m13: ReadWriteAttribute<Double>
    @inlinable override public var m13: Double {
        get { _m13.wrappedValue }
        set { _m13.wrappedValue = newValue }
    }

    @usableFromInline let _m14: ReadWriteAttribute<Double>
    @inlinable override public var m14: Double {
        get { _m14.wrappedValue }
        set { _m14.wrappedValue = newValue }
    }

    @usableFromInline let _m21: ReadWriteAttribute<Double>
    @inlinable override public var m21: Double {
        get { _m21.wrappedValue }
        set { _m21.wrappedValue = newValue }
    }

    @usableFromInline let _m22: ReadWriteAttribute<Double>
    @inlinable override public var m22: Double {
        get { _m22.wrappedValue }
        set { _m22.wrappedValue = newValue }
    }

    @usableFromInline let _m23: ReadWriteAttribute<Double>
    @inlinable override public var m23: Double {
        get { _m23.wrappedValue }
        set { _m23.wrappedValue = newValue }
    }

    @usableFromInline let _m24: ReadWriteAttribute<Double>
    @inlinable override public var m24: Double {
        get { _m24.wrappedValue }
        set { _m24.wrappedValue = newValue }
    }

    @usableFromInline let _m31: ReadWriteAttribute<Double>
    @inlinable override public var m31: Double {
        get { _m31.wrappedValue }
        set { _m31.wrappedValue = newValue }
    }

    @usableFromInline let _m32: ReadWriteAttribute<Double>
    @inlinable override public var m32: Double {
        get { _m32.wrappedValue }
        set { _m32.wrappedValue = newValue }
    }

    @usableFromInline let _m33: ReadWriteAttribute<Double>
    @inlinable override public var m33: Double {
        get { _m33.wrappedValue }
        set { _m33.wrappedValue = newValue }
    }

    @usableFromInline let _m34: ReadWriteAttribute<Double>
    @inlinable override public var m34: Double {
        get { _m34.wrappedValue }
        set { _m34.wrappedValue = newValue }
    }

    @usableFromInline let _m41: ReadWriteAttribute<Double>
    @inlinable override public var m41: Double {
        get { _m41.wrappedValue }
        set { _m41.wrappedValue = newValue }
    }

    @usableFromInline let _m42: ReadWriteAttribute<Double>
    @inlinable override public var m42: Double {
        get { _m42.wrappedValue }
        set { _m42.wrappedValue = newValue }
    }

    @usableFromInline let _m43: ReadWriteAttribute<Double>
    @inlinable override public var m43: Double {
        get { _m43.wrappedValue }
        set { _m43.wrappedValue = newValue }
    }

    @usableFromInline let _m44: ReadWriteAttribute<Double>
    @inlinable override public var m44: Double {
        get { _m44.wrappedValue }
        set { _m44.wrappedValue = newValue }
    }

    @inlinable public func multiplySelf(other: DOMMatrixInit? = nil) -> Self {
        let this = jsObject
        return this[.multiplySelf].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable public func preMultiplySelf(other: DOMMatrixInit? = nil) -> Self {
        let this = jsObject
        return this[.preMultiplySelf].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable public func translateSelf(tx: Double? = nil, ty: Double? = nil, tz: Double? = nil) -> Self {
        let this = jsObject
        return this[.translateSelf].function!(this: this, arguments: [_toJSValue(tx), _toJSValue(ty), _toJSValue(tz)]).fromJSValue()!
    }

    @inlinable public func scaleSelf(scaleX: Double? = nil, scaleY: Double? = nil, scaleZ: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> Self {
        let this = jsObject
        return this[.scaleSelf].function!(this: this, arguments: [_toJSValue(scaleX), _toJSValue(scaleY), _toJSValue(scaleZ), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }

    @inlinable public func scale3dSelf(scale: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> Self {
        let this = jsObject
        return this[.scale3dSelf].function!(this: this, arguments: [_toJSValue(scale), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }

    @inlinable public func rotateSelf(rotX: Double? = nil, rotY: Double? = nil, rotZ: Double? = nil) -> Self {
        let this = jsObject
        return this[.rotateSelf].function!(this: this, arguments: [_toJSValue(rotX), _toJSValue(rotY), _toJSValue(rotZ)]).fromJSValue()!
    }

    @inlinable public func rotateFromVectorSelf(x: Double? = nil, y: Double? = nil) -> Self {
        let this = jsObject
        return this[.rotateFromVectorSelf].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }

    @inlinable public func rotateAxisAngleSelf(x: Double? = nil, y: Double? = nil, z: Double? = nil, angle: Double? = nil) -> Self {
        let this = jsObject
        return this[.rotateAxisAngleSelf].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(angle)]).fromJSValue()!
    }

    @inlinable public func skewXSelf(sx: Double? = nil) -> Self {
        let this = jsObject
        return this[.skewXSelf].function!(this: this, arguments: [_toJSValue(sx)]).fromJSValue()!
    }

    @inlinable public func skewYSelf(sy: Double? = nil) -> Self {
        let this = jsObject
        return this[.skewYSelf].function!(this: this, arguments: [_toJSValue(sy)]).fromJSValue()!
    }

    @inlinable public func invertSelf() -> Self {
        let this = jsObject
        return this[.invertSelf].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func setMatrixValue(transformList: String) -> Self {
        let this = jsObject
        return this[.setMatrixValue].function!(this: this, arguments: [_toJSValue(transformList)]).fromJSValue()!
    }
}

public class DOMMatrix2DInit: BridgedDictionary {
    public convenience init(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double, m11: Double, m12: Double, m21: Double, m22: Double, m41: Double, m42: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.a] = _toJSValue(a)
        object[.b] = _toJSValue(b)
        object[.c] = _toJSValue(c)
        object[.d] = _toJSValue(d)
        object[.e] = _toJSValue(e)
        object[.f] = _toJSValue(f)
        object[.m11] = _toJSValue(m11)
        object[.m12] = _toJSValue(m12)
        object[.m21] = _toJSValue(m21)
        object[.m22] = _toJSValue(m22)
        object[.m41] = _toJSValue(m41)
        object[.m42] = _toJSValue(m42)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _a = ReadWriteAttribute(jsObject: object, name: .a)
        _b = ReadWriteAttribute(jsObject: object, name: .b)
        _c = ReadWriteAttribute(jsObject: object, name: .c)
        _d = ReadWriteAttribute(jsObject: object, name: .d)
        _e = ReadWriteAttribute(jsObject: object, name: .e)
        _f = ReadWriteAttribute(jsObject: object, name: .f)
        _m11 = ReadWriteAttribute(jsObject: object, name: .m11)
        _m12 = ReadWriteAttribute(jsObject: object, name: .m12)
        _m21 = ReadWriteAttribute(jsObject: object, name: .m21)
        _m22 = ReadWriteAttribute(jsObject: object, name: .m22)
        _m41 = ReadWriteAttribute(jsObject: object, name: .m41)
        _m42 = ReadWriteAttribute(jsObject: object, name: .m42)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var a: Double

    @ReadWriteAttribute
    public var b: Double

    @ReadWriteAttribute
    public var c: Double

    @ReadWriteAttribute
    public var d: Double

    @ReadWriteAttribute
    public var e: Double

    @ReadWriteAttribute
    public var f: Double

    @ReadWriteAttribute
    public var m11: Double

    @ReadWriteAttribute
    public var m12: Double

    @ReadWriteAttribute
    public var m21: Double

    @ReadWriteAttribute
    public var m22: Double

    @ReadWriteAttribute
    public var m41: Double

    @ReadWriteAttribute
    public var m42: Double
}

public class DOMMatrixInit: BridgedDictionary {
    public convenience init(m13: Double, m14: Double, m23: Double, m24: Double, m31: Double, m32: Double, m33: Double, m34: Double, m43: Double, m44: Double, is2D: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.m13] = _toJSValue(m13)
        object[.m14] = _toJSValue(m14)
        object[.m23] = _toJSValue(m23)
        object[.m24] = _toJSValue(m24)
        object[.m31] = _toJSValue(m31)
        object[.m32] = _toJSValue(m32)
        object[.m33] = _toJSValue(m33)
        object[.m34] = _toJSValue(m34)
        object[.m43] = _toJSValue(m43)
        object[.m44] = _toJSValue(m44)
        object[.is2D] = _toJSValue(is2D)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _m13 = ReadWriteAttribute(jsObject: object, name: .m13)
        _m14 = ReadWriteAttribute(jsObject: object, name: .m14)
        _m23 = ReadWriteAttribute(jsObject: object, name: .m23)
        _m24 = ReadWriteAttribute(jsObject: object, name: .m24)
        _m31 = ReadWriteAttribute(jsObject: object, name: .m31)
        _m32 = ReadWriteAttribute(jsObject: object, name: .m32)
        _m33 = ReadWriteAttribute(jsObject: object, name: .m33)
        _m34 = ReadWriteAttribute(jsObject: object, name: .m34)
        _m43 = ReadWriteAttribute(jsObject: object, name: .m43)
        _m44 = ReadWriteAttribute(jsObject: object, name: .m44)
        _is2D = ReadWriteAttribute(jsObject: object, name: .is2D)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var m13: Double

    @ReadWriteAttribute
    public var m14: Double

    @ReadWriteAttribute
    public var m23: Double

    @ReadWriteAttribute
    public var m24: Double

    @ReadWriteAttribute
    public var m31: Double

    @ReadWriteAttribute
    public var m32: Double

    @ReadWriteAttribute
    public var m33: Double

    @ReadWriteAttribute
    public var m34: Double

    @ReadWriteAttribute
    public var m43: Double

    @ReadWriteAttribute
    public var m44: Double

    @ReadWriteAttribute
    public var is2D: Bool
}

public class DOMMatrixReadOnly: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMMatrixReadOnly].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _a = ReadonlyAttribute(jsObject: jsObject, name: .a)
        _b = ReadonlyAttribute(jsObject: jsObject, name: .b)
        _c = ReadonlyAttribute(jsObject: jsObject, name: .c)
        _d = ReadonlyAttribute(jsObject: jsObject, name: .d)
        _e = ReadonlyAttribute(jsObject: jsObject, name: .e)
        _f = ReadonlyAttribute(jsObject: jsObject, name: .f)
        _m11 = ReadonlyAttribute(jsObject: jsObject, name: .m11)
        _m12 = ReadonlyAttribute(jsObject: jsObject, name: .m12)
        _m13 = ReadonlyAttribute(jsObject: jsObject, name: .m13)
        _m14 = ReadonlyAttribute(jsObject: jsObject, name: .m14)
        _m21 = ReadonlyAttribute(jsObject: jsObject, name: .m21)
        _m22 = ReadonlyAttribute(jsObject: jsObject, name: .m22)
        _m23 = ReadonlyAttribute(jsObject: jsObject, name: .m23)
        _m24 = ReadonlyAttribute(jsObject: jsObject, name: .m24)
        _m31 = ReadonlyAttribute(jsObject: jsObject, name: .m31)
        _m32 = ReadonlyAttribute(jsObject: jsObject, name: .m32)
        _m33 = ReadonlyAttribute(jsObject: jsObject, name: .m33)
        _m34 = ReadonlyAttribute(jsObject: jsObject, name: .m34)
        _m41 = ReadonlyAttribute(jsObject: jsObject, name: .m41)
        _m42 = ReadonlyAttribute(jsObject: jsObject, name: .m42)
        _m43 = ReadonlyAttribute(jsObject: jsObject, name: .m43)
        _m44 = ReadonlyAttribute(jsObject: jsObject, name: .m44)
        _is2D = ReadonlyAttribute(jsObject: jsObject, name: .is2D)
        _isIdentity = ReadonlyAttribute(jsObject: jsObject, name: .isIdentity)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(init: String_or_seq_of_Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @inlinable public class func fromMatrix(other: DOMMatrixInit? = nil) -> Self {
        let this = constructor!
        return this[.fromMatrix].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable public class func fromFloat32Array(array32: Float32Array) -> Self {
        let this = constructor!
        return this[.fromFloat32Array].function!(this: this, arguments: [_toJSValue(array32)]).fromJSValue()!
    }

    @inlinable public class func fromFloat64Array(array64: Float64Array) -> Self {
        let this = constructor!
        return this[.fromFloat64Array].function!(this: this, arguments: [_toJSValue(array64)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var a: Double

    @ReadonlyAttribute
    public var b: Double

    @ReadonlyAttribute
    public var c: Double

    @ReadonlyAttribute
    public var d: Double

    @ReadonlyAttribute
    public var e: Double

    @ReadonlyAttribute
    public var f: Double

    @ReadonlyAttribute
    public var m11: Double

    @ReadonlyAttribute
    public var m12: Double

    @ReadonlyAttribute
    public var m13: Double

    @ReadonlyAttribute
    public var m14: Double

    @ReadonlyAttribute
    public var m21: Double

    @ReadonlyAttribute
    public var m22: Double

    @ReadonlyAttribute
    public var m23: Double

    @ReadonlyAttribute
    public var m24: Double

    @ReadonlyAttribute
    public var m31: Double

    @ReadonlyAttribute
    public var m32: Double

    @ReadonlyAttribute
    public var m33: Double

    @ReadonlyAttribute
    public var m34: Double

    @ReadonlyAttribute
    public var m41: Double

    @ReadonlyAttribute
    public var m42: Double

    @ReadonlyAttribute
    public var m43: Double

    @ReadonlyAttribute
    public var m44: Double

    @ReadonlyAttribute
    public var is2D: Bool

    @ReadonlyAttribute
    public var isIdentity: Bool

    @inlinable public func translate(tx: Double? = nil, ty: Double? = nil, tz: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.translate].function!(this: this, arguments: [_toJSValue(tx), _toJSValue(ty), _toJSValue(tz)]).fromJSValue()!
    }

    @inlinable public func scale(scaleX: Double? = nil, scaleY: Double? = nil, scaleZ: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.scale].function!(this: this, arguments: [_toJSValue(scaleX), _toJSValue(scaleY), _toJSValue(scaleZ), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }

    @inlinable public func scaleNonUniform(scaleX: Double? = nil, scaleY: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.scaleNonUniform].function!(this: this, arguments: [_toJSValue(scaleX), _toJSValue(scaleY)]).fromJSValue()!
    }

    @inlinable public func scale3d(scale: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.scale3d].function!(this: this, arguments: [_toJSValue(scale), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }

    @inlinable public func rotate(rotX: Double? = nil, rotY: Double? = nil, rotZ: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.rotate].function!(this: this, arguments: [_toJSValue(rotX), _toJSValue(rotY), _toJSValue(rotZ)]).fromJSValue()!
    }

    @inlinable public func rotateFromVector(x: Double? = nil, y: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.rotateFromVector].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }

    @inlinable public func rotateAxisAngle(x: Double? = nil, y: Double? = nil, z: Double? = nil, angle: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.rotateAxisAngle].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(angle)]).fromJSValue()!
    }

    @inlinable public func skewX(sx: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.skewX].function!(this: this, arguments: [_toJSValue(sx)]).fromJSValue()!
    }

    @inlinable public func skewY(sy: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.skewY].function!(this: this, arguments: [_toJSValue(sy)]).fromJSValue()!
    }

    @inlinable public func multiply(other: DOMMatrixInit? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.multiply].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable public func flipX() -> DOMMatrix {
        let this = jsObject
        return this[.flipX].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func flipY() -> DOMMatrix {
        let this = jsObject
        return this[.flipY].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func inverse() -> DOMMatrix {
        let this = jsObject
        return this[.inverse].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func transformPoint(point: DOMPointInit? = nil) -> DOMPoint {
        let this = jsObject
        return this[.transformPoint].function!(this: this, arguments: [_toJSValue(point)]).fromJSValue()!
    }

    @inlinable public func toFloat32Array() -> Float32Array {
        let this = jsObject
        return this[.toFloat32Array].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func toFloat64Array() -> Float64Array {
        let this = jsObject
        return this[.toFloat64Array].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public var description: String {
        jsObject[.toString]!().fromJSValue()!
    }

    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

