//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class AbortController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.AbortController].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _signal = ReadonlyAttribute(jsObject: jsObject, name: .signal)
        self.jsObject = jsObject
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadonlyAttribute
    public var signal: AbortSignal

    @inlinable public func abort(reason: JSValue? = nil) {
        let this = jsObject
        _ = this[.abort].function!(this: this, arguments: [_toJSValue(reason)])
    }
}

public class AbortSignal: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.AbortSignal].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _aborted = ReadonlyAttribute(jsObject: jsObject, name: .aborted)
        _reason = ReadonlyAttribute(jsObject: jsObject, name: .reason)
        _onabort = ClosureAttribute1Optional(jsObject: jsObject, name: .onabort)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public class func abort(reason: JSValue? = nil) -> Self {
        let this = constructor!
        return this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }

    @inlinable public class func timeout(milliseconds: UInt64) -> Self {
        let this = constructor!
        return this[.timeout].function!(this: this, arguments: [_toJSValue(milliseconds)]).fromJSValue()!
    }

    @inlinable public class func any(signals: [AbortSignal]) -> Self {
        let this = constructor!
        return this[.any].function!(this: this, arguments: [_toJSValue(signals)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var aborted: Bool

    @ReadonlyAttribute
    public var reason: JSValue

    @inlinable public func throwIfAborted() {
        let this = jsObject
        _ = this[.throwIfAborted].function!(this: this, arguments: [])
    }

    @ClosureAttribute1Optional
    public var onabort: EventHandler
}

