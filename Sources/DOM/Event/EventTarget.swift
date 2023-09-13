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


open class EventTarget: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.EventTarget].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @inlinable public func addEventListener(type: String, callback: EventListener?, options: AddEventListenerOptions? = nil) {
        let this = jsObject
        _ = this[.addEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }
     @inlinable public func addEventListener(type: String, callback: EventListener?, options: Bool) {
        let this = jsObject
        _ = this[.addEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }


    @inlinable public func removeEventListener(type: String, callback: EventListener?, options: EventListenerOptions? = nil) {
        let this = jsObject
        _ = this[.removeEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }
    
     @inlinable public func removeEventListener(type: String, callback: EventListener?, options: Bool) {
        let this = jsObject
        _ = this[.removeEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }
    

    @inlinable public func dispatchEvent(event: Event) -> Bool {
        let this = jsObject
        return this[.dispatchEvent].function!(this: this, arguments: [_toJSValue(event)]).fromJSValue()!
    }
}
public class EventSource: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.EventSource].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _url = ReadonlyAttribute(jsObject: jsObject, name: .url)
        _withCredentials = ReadonlyAttribute(jsObject: jsObject, name: .withCredentials)
        _readyState = ReadonlyAttribute(jsObject: jsObject, name: .readyState)
        _onopen = ClosureAttribute1Optional(jsObject: jsObject, name: .onopen)
        _onmessage = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessage)
        _onerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onerror)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(url: String, eventSourceInitDict: EventSourceInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(url), _toJSValue(eventSourceInitDict)]))
    }

    @ReadonlyAttribute
    public var url: String

    @ReadonlyAttribute
    public var withCredentials: Bool

    public static let CONNECTING: UInt16 = 0

    public static let OPEN: UInt16 = 1

    public static let CLOSED: UInt16 = 2

    @ReadonlyAttribute
    public var readyState: UInt16

    @ClosureAttribute1Optional
    public var onopen: EventHandler

    @ClosureAttribute1Optional
    public var onmessage: EventHandler

    @ClosureAttribute1Optional
    public var onerror: EventHandler

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
}

public class EventSourceInit: BridgedDictionary {
    public convenience init(withCredentials: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.withCredentials] = _toJSValue(withCredentials)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _withCredentials = ReadWriteAttribute(jsObject: object, name: .withCredentials)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var withCredentials: Bool
}
