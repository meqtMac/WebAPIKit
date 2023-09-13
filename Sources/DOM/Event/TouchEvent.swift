//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class TouchEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TouchEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _touches = ReadonlyAttribute(jsObject: jsObject, name: .touches)
        _targetTouches = ReadonlyAttribute(jsObject: jsObject, name: .targetTouches)
        _changedTouches = ReadonlyAttribute(jsObject: jsObject, name: .changedTouches)
        _altKey = ReadonlyAttribute(jsObject: jsObject, name: .altKey)
        _metaKey = ReadonlyAttribute(jsObject: jsObject, name: .metaKey)
        _ctrlKey = ReadonlyAttribute(jsObject: jsObject, name: .ctrlKey)
        _shiftKey = ReadonlyAttribute(jsObject: jsObject, name: .shiftKey)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: TouchEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var touches: TouchList

    @ReadonlyAttribute
    public var targetTouches: TouchList

    @ReadonlyAttribute
    public var changedTouches: TouchList

    @ReadonlyAttribute
    public var altKey: Bool

    @ReadonlyAttribute
    public var metaKey: Bool

    @ReadonlyAttribute
    public var ctrlKey: Bool

    @ReadonlyAttribute
    public var shiftKey: Bool

    @inlinable public subscript(key: String) -> Bool {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func getModifierState(keyArg: String) -> Bool {
        let this = jsObject
        return this[.getModifierState].function!(this: this, arguments: [_toJSValue(keyArg)]).fromJSValue()!
    }
}

public class TouchEventInit: BridgedDictionary {
    public convenience init(touches: [Touch], targetTouches: [Touch], changedTouches: [Touch]) {
        let object = JSObject.global[.Object].function!.new()
        object[.touches] = _toJSValue(touches)
        object[.targetTouches] = _toJSValue(targetTouches)
        object[.changedTouches] = _toJSValue(changedTouches)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _touches = ReadWriteAttribute(jsObject: object, name: .touches)
        _targetTouches = ReadWriteAttribute(jsObject: object, name: .targetTouches)
        _changedTouches = ReadWriteAttribute(jsObject: object, name: .changedTouches)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var touches: [Touch]

    @ReadWriteAttribute
    public var targetTouches: [Touch]

    @ReadWriteAttribute
    public var changedTouches: [Touch]
}

public class Touch: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Touch].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _identifier = ReadonlyAttribute(jsObject: jsObject, name: .identifier)
        _target = ReadonlyAttribute(jsObject: jsObject, name: .target)
        _screenX = ReadonlyAttribute(jsObject: jsObject, name: .screenX)
        _screenY = ReadonlyAttribute(jsObject: jsObject, name: .screenY)
        _clientX = ReadonlyAttribute(jsObject: jsObject, name: .clientX)
        _clientY = ReadonlyAttribute(jsObject: jsObject, name: .clientY)
        _pageX = ReadonlyAttribute(jsObject: jsObject, name: .pageX)
        _pageY = ReadonlyAttribute(jsObject: jsObject, name: .pageY)
        _radiusX = ReadonlyAttribute(jsObject: jsObject, name: .radiusX)
        _radiusY = ReadonlyAttribute(jsObject: jsObject, name: .radiusY)
        _rotationAngle = ReadonlyAttribute(jsObject: jsObject, name: .rotationAngle)
        _force = ReadonlyAttribute(jsObject: jsObject, name: .force)
        _altitudeAngle = ReadonlyAttribute(jsObject: jsObject, name: .altitudeAngle)
        _azimuthAngle = ReadonlyAttribute(jsObject: jsObject, name: .azimuthAngle)
        _touchType = ReadonlyAttribute(jsObject: jsObject, name: .touchType)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(touchInitDict: TouchInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(touchInitDict)]))
    }

    @ReadonlyAttribute
    public var identifier: Int32

    @ReadonlyAttribute
    public var target: EventTarget

    @ReadonlyAttribute
    public var screenX: Double

    @ReadonlyAttribute
    public var screenY: Double

    @ReadonlyAttribute
    public var clientX: Double

    @ReadonlyAttribute
    public var clientY: Double

    @ReadonlyAttribute
    public var pageX: Double

    @ReadonlyAttribute
    public var pageY: Double

    @ReadonlyAttribute
    public var radiusX: Float

    @ReadonlyAttribute
    public var radiusY: Float

    @ReadonlyAttribute
    public var rotationAngle: Float

    @ReadonlyAttribute
    public var force: Float

    @ReadonlyAttribute
    public var altitudeAngle: Float

    @ReadonlyAttribute
    public var azimuthAngle: Float

    @ReadonlyAttribute
    public var touchType: TouchType
}



public class TouchInit: BridgedDictionary {
    public convenience init(identifier: Int32, target: EventTarget, clientX: Double, clientY: Double, screenX: Double, screenY: Double, pageX: Double, pageY: Double, radiusX: Float, radiusY: Float, rotationAngle: Float, force: Float, altitudeAngle: Double, azimuthAngle: Double, touchType: TouchType) {
        let object = JSObject.global[.Object].function!.new()
        object[.identifier] = _toJSValue(identifier)
        object[.target] = _toJSValue(target)
        object[.clientX] = _toJSValue(clientX)
        object[.clientY] = _toJSValue(clientY)
        object[.screenX] = _toJSValue(screenX)
        object[.screenY] = _toJSValue(screenY)
        object[.pageX] = _toJSValue(pageX)
        object[.pageY] = _toJSValue(pageY)
        object[.radiusX] = _toJSValue(radiusX)
        object[.radiusY] = _toJSValue(radiusY)
        object[.rotationAngle] = _toJSValue(rotationAngle)
        object[.force] = _toJSValue(force)
        object[.altitudeAngle] = _toJSValue(altitudeAngle)
        object[.azimuthAngle] = _toJSValue(azimuthAngle)
        object[.touchType] = _toJSValue(touchType)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _identifier = ReadWriteAttribute(jsObject: object, name: .identifier)
        _target = ReadWriteAttribute(jsObject: object, name: .target)
        _clientX = ReadWriteAttribute(jsObject: object, name: .clientX)
        _clientY = ReadWriteAttribute(jsObject: object, name: .clientY)
        _screenX = ReadWriteAttribute(jsObject: object, name: .screenX)
        _screenY = ReadWriteAttribute(jsObject: object, name: .screenY)
        _pageX = ReadWriteAttribute(jsObject: object, name: .pageX)
        _pageY = ReadWriteAttribute(jsObject: object, name: .pageY)
        _radiusX = ReadWriteAttribute(jsObject: object, name: .radiusX)
        _radiusY = ReadWriteAttribute(jsObject: object, name: .radiusY)
        _rotationAngle = ReadWriteAttribute(jsObject: object, name: .rotationAngle)
        _force = ReadWriteAttribute(jsObject: object, name: .force)
        _altitudeAngle = ReadWriteAttribute(jsObject: object, name: .altitudeAngle)
        _azimuthAngle = ReadWriteAttribute(jsObject: object, name: .azimuthAngle)
        _touchType = ReadWriteAttribute(jsObject: object, name: .touchType)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var identifier: Int32

    @ReadWriteAttribute
    public var target: EventTarget

    @ReadWriteAttribute
    public var clientX: Double

    @ReadWriteAttribute
    public var clientY: Double

    @ReadWriteAttribute
    public var screenX: Double

    @ReadWriteAttribute
    public var screenY: Double

    @ReadWriteAttribute
    public var pageX: Double

    @ReadWriteAttribute
    public var pageY: Double

    @ReadWriteAttribute
    public var radiusX: Float

    @ReadWriteAttribute
    public var radiusY: Float

    @ReadWriteAttribute
    public var rotationAngle: Float

    @ReadWriteAttribute
    public var force: Float

    @ReadWriteAttribute
    public var altitudeAngle: Double

    @ReadWriteAttribute
    public var azimuthAngle: Double

    @ReadWriteAttribute
    public var touchType: TouchType
}

public class TouchList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TouchList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> Touch? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> Touch? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
}

public enum TouchType: JSString, JSValueCompatible {
    case direct = "direct"
    case stylus = "stylus"

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

