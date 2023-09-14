//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase

public enum ScrollBehavior: JSString, JSValueCompatible {
    case auto = "auto"
    case instant = "instant"
    case smooth = "smooth"

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

public class ScrollIntoViewOptions: BridgedDictionary {
    public convenience init(block: ScrollLogicalPosition, inline: ScrollLogicalPosition) {
        let object = JSObject.global[.Object].function!.new()
        object[.block] = _toJSValue(block)
        object[.inline] = _toJSValue(inline)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _block = ReadWriteAttribute(jsObject: object, name: .block)
        _inline = ReadWriteAttribute(jsObject: object, name: .inline)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var block: ScrollLogicalPosition

    @ReadWriteAttribute
    public var inline: ScrollLogicalPosition
}

public enum ScrollLogicalPosition: JSString, JSValueCompatible {
    case start = "start"
    case center = "center"
    case end = "end"
    case nearest = "nearest"

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

public class ScrollOptions: BridgedDictionary {
    public convenience init(behavior: ScrollBehavior) {
        let object = JSObject.global[.Object].function!.new()
        object[.behavior] = _toJSValue(behavior)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _behavior = ReadWriteAttribute(jsObject: object, name: .behavior)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var behavior: ScrollBehavior
}

public enum ScrollRestoration: JSString, JSValueCompatible {
    case auto = "auto"
    case manual = "manual"

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

public class ScrollToOptions: BridgedDictionary {
    public convenience init(left: Double, top: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.left] = _toJSValue(left)
        object[.top] = _toJSValue(top)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _left = ReadWriteAttribute(jsObject: object, name: .left)
        _top = ReadWriteAttribute(jsObject: object, name: .top)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var left: Double

    @ReadWriteAttribute
    public var top: Double
}

