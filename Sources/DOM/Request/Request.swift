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


public enum HeadersInit: JSValueCompatible {
    case dict([String: String])
    case array([[String]])
    
    public static func construct(from value: JSValue) -> Self? {
        if let dict: [String: String] = value.fromJSValue() {
            return .dict(dict)
        }
        if let array: [[String]] = value.fromJSValue() {
            return .array(array)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .dict(dict):
            return dict.jsValue
        case let .array(array):
            return array.jsValue
        }
    }
}

public enum RequestCache: JSString, JSValueCompatible {
    case `default` = "default"
    case noStore = "no-store"
    case reload = "reload"
    case noCache = "no-cache"
    case forceCache = "force-cache"
    case onlyIfCached = "only-if-cached"
    
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

public enum RequestCredentials: JSString, JSValueCompatible {
    case omit = "omit"
    case sameOrigin = "same-origin"
    case include = "include"
    
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

public enum RequestDestination: JSString, JSValueCompatible {
    case _empty = ""
    case audio = "audio"
    case audioworklet = "audioworklet"
    case document = "document"
    case embed = "embed"
    case font = "font"
    case frame = "frame"
    case iframe = "iframe"
    case image = "image"
    case manifest = "manifest"
    case object = "object"
    case paintworklet = "paintworklet"
    case report = "report"
    case script = "script"
    case sharedworker = "sharedworker"
    case style = "style"
    case track = "track"
    case video = "video"
    case worker = "worker"
    case xslt = "xslt"
    
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

public enum RequestDuplex: JSString, JSValueCompatible {
    case half = "half"
    
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

public class RequestInit: BridgedDictionary {
    
    public convenience init(method: String, headers: [[String]], 
                            body: XMLHttpRequestBodyInit?,
                            referrer: String,
                            referrerPolicy: ReferrerPolicy,
                            mode: RequestMode, 
                            credentials: RequestCredentials,
                            cache: RequestCache,
                            redirect: RequestRedirect,
                            integrity: String,
                            keepalive: Bool,
                            signal: AbortSignal?,
                            duplex: RequestDuplex,
                            priority: RequestPriority,
                            window: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.method] = _toJSValue(method)
        object[.headers] = _toJSValue(headers)
        object[.body] = _toJSValue(body)
        object[.referrer] = _toJSValue(referrer)
        object[.referrerPolicy] = _toJSValue(referrerPolicy)
        object[.mode] = _toJSValue(mode)
        object[.credentials] = _toJSValue(credentials)
        object[.cache] = _toJSValue(cache)
        object[.redirect] = _toJSValue(redirect)
        object[.integrity] = _toJSValue(integrity)
        object[.keepalive] = _toJSValue(keepalive)
        object[.signal] = _toJSValue(signal)
        object[.duplex] = _toJSValue(duplex)
        object[.priority] = _toJSValue(priority)
        object[.window] = _toJSValue(window)
        self.init(unsafelyWrapping: object)
    }
    public convenience init(method: String, 
                            headers: [String: String],
                            body: XMLHttpRequestBodyInit?,
                            referrer: String,
                            referrerPolicy: ReferrerPolicy,
                            mode: RequestMode,
                            credentials: RequestCredentials,
                            cache: RequestCache,
                            redirect: RequestRedirect,
                            integrity: String,
                            keepalive: Bool,
                            signal: AbortSignal?,
                            duplex: RequestDuplex,
                            priority: RequestPriority,
                            window: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.method] = _toJSValue(method)
        object[.headers] = _toJSValue(headers)
        object[.body] = _toJSValue(body)
        object[.referrer] = _toJSValue(referrer)
        object[.referrerPolicy] = _toJSValue(referrerPolicy)
        object[.mode] = _toJSValue(mode)
        object[.credentials] = _toJSValue(credentials)
        object[.cache] = _toJSValue(cache)
        object[.redirect] = _toJSValue(redirect)
        object[.integrity] = _toJSValue(integrity)
        object[.keepalive] = _toJSValue(keepalive)
        object[.signal] = _toJSValue(signal)
        object[.duplex] = _toJSValue(duplex)
        object[.priority] = _toJSValue(priority)
        object[.window] = _toJSValue(window)
        self.init(unsafelyWrapping: object)
    }
    
    
    public required init(unsafelyWrapping object: JSObject) {
        _method = ReadWriteAttribute(jsObject: object, name: .method)
        _headers = ReadWriteAttribute(jsObject: object, name: .headers)
        _body = ReadWriteAttribute(jsObject: object, name: .body)
        _referrer = ReadWriteAttribute(jsObject: object, name: .referrer)
        _referrerPolicy = ReadWriteAttribute(jsObject: object, name: .referrerPolicy)
        _mode = ReadWriteAttribute(jsObject: object, name: .mode)
        _credentials = ReadWriteAttribute(jsObject: object, name: .credentials)
        _cache = ReadWriteAttribute(jsObject: object, name: .cache)
        _redirect = ReadWriteAttribute(jsObject: object, name: .redirect)
        _integrity = ReadWriteAttribute(jsObject: object, name: .integrity)
        _keepalive = ReadWriteAttribute(jsObject: object, name: .keepalive)
        _signal = ReadWriteAttribute(jsObject: object, name: .signal)
        _duplex = ReadWriteAttribute(jsObject: object, name: .duplex)
        _priority = ReadWriteAttribute(jsObject: object, name: .priority)
        _window = ReadWriteAttribute(jsObject: object, name: .window)
        super.init(unsafelyWrapping: object)
    }
    
    @ReadWriteAttribute
    public var method: String
    
    @ReadWriteAttribute
    public var headers: HeadersInit
    
    @ReadWriteAttribute
    public var body: XMLHttpRequestBodyInit?
    
    @ReadWriteAttribute
    public var referrer: String
    
    @ReadWriteAttribute
    public var referrerPolicy: ReferrerPolicy
    
    @ReadWriteAttribute
    public var mode: RequestMode
    
    @ReadWriteAttribute
    public var credentials: RequestCredentials
    
    @ReadWriteAttribute
    public var cache: RequestCache
    
    @ReadWriteAttribute
    public var redirect: RequestRedirect
    
    @ReadWriteAttribute
    public var integrity: String
    
    @ReadWriteAttribute
    public var keepalive: Bool
    
    @ReadWriteAttribute
    public var signal: AbortSignal?
    
    @ReadWriteAttribute
    public var duplex: RequestDuplex
    
    @ReadWriteAttribute
    public var priority: RequestPriority
    
    @ReadWriteAttribute
    public var window: JSValue
    
}

public enum RequestMode: JSString, JSValueCompatible {
    case navigate = "navigate"
    case sameOrigin = "same-origin"
    case noCors = "no-cors"
    case cors = "cors"
    
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

public enum RequestPriority: JSString, JSValueCompatible {
    case high = "high"
    case low = "low"
    case auto = "auto"
    
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

public enum RequestRedirect: JSString, JSValueCompatible {
    case follow = "follow"
    case error = "error"
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
public class Response: JSBridgedClass, Body {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Response].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _url = ReadonlyAttribute(jsObject: jsObject, name: .url)
        _redirected = ReadonlyAttribute(jsObject: jsObject, name: .redirected)
        _status = ReadonlyAttribute(jsObject: jsObject, name: .status)
        _ok = ReadonlyAttribute(jsObject: jsObject, name: .ok)
        _statusText = ReadonlyAttribute(jsObject: jsObject, name: .statusText)
        _headers = ReadonlyAttribute(jsObject: jsObject, name: .headers)
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(body: XMLHttpRequestBodyInit? = nil, init: ResponseInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(body), _toJSValue(`init`)]))
    }
    
    @inlinable public class func error() -> Self {
        let this = constructor!
        return this[.error].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public class func redirect(url: String, status: UInt16? = nil) -> Self {
        let this = constructor!
        return this[.redirect].function!(this: this, arguments: [_toJSValue(url), _toJSValue(status)]).fromJSValue()!
    }
    
    @inlinable public class func json(data: JSValue, init: ResponseInit? = nil) -> Self {
        let this = constructor!
        return this[.json].function!(this: this, arguments: [_toJSValue(data), _toJSValue(`init`)]).fromJSValue()!
    }
    
    @ReadonlyAttribute
    public var type: ResponseType
    
    @ReadonlyAttribute
    public var url: String
    
    @ReadonlyAttribute
    public var redirected: Bool
    
    @ReadonlyAttribute
    public var status: UInt16
    
    @ReadonlyAttribute
    public var ok: Bool
    
    @ReadonlyAttribute
    public var statusText: String
    
    @ReadonlyAttribute
    public var headers: Headers
    
    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class ResponseInit: BridgedDictionary {
    public convenience init(status: UInt16, statusText: String, headers: [String: String]) {
        let object = JSObject.global[.Object].function!.new()
        object[.status] = _toJSValue(status)
        object[.statusText] = _toJSValue(statusText)
        object[.headers] = _toJSValue(headers)
        self.init(unsafelyWrapping: object)
    }
    
    public convenience init(status: UInt16, statusText: String, headers: [[String]]) {
        let object = JSObject.global[.Object].function!.new()
        object[.status] = _toJSValue(status)
        object[.statusText] = _toJSValue(statusText)
        object[.headers] = _toJSValue(headers)
        self.init(unsafelyWrapping: object)
    }
    
    
    public required init(unsafelyWrapping object: JSObject) {
        _status = ReadWriteAttribute(jsObject: object, name: .status)
        _statusText = ReadWriteAttribute(jsObject: object, name: .statusText)
        _headers = ReadWriteAttribute(jsObject: object, name: .headers)
        super.init(unsafelyWrapping: object)
    }
    
    @ReadWriteAttribute
    public var status: UInt16
    
    @ReadWriteAttribute
    public var statusText: String
    
    @ReadWriteAttribute
    public var headers: HeadersInit
}

public enum ResponseType: JSString, JSValueCompatible {
    case basic = "basic"
    case cors = "cors"
    case `default` = "default"
    case error = "error"
    case opaque = "opaque"
    case opaqueredirect = "opaqueredirect"
    
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

public class Request: JSBridgedClass, Body {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Request].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _method = ReadonlyAttribute(jsObject: jsObject, name: .method)
        _url = ReadonlyAttribute(jsObject: jsObject, name: .url)
        _headers = ReadonlyAttribute(jsObject: jsObject, name: .headers)
        _destination = ReadonlyAttribute(jsObject: jsObject, name: .destination)
        _referrer = ReadonlyAttribute(jsObject: jsObject, name: .referrer)
        _referrerPolicy = ReadonlyAttribute(jsObject: jsObject, name: .referrerPolicy)
        _mode = ReadonlyAttribute(jsObject: jsObject, name: .mode)
        _credentials = ReadonlyAttribute(jsObject: jsObject, name: .credentials)
        _cache = ReadonlyAttribute(jsObject: jsObject, name: .cache)
        _redirect = ReadonlyAttribute(jsObject: jsObject, name: .redirect)
        _integrity = ReadonlyAttribute(jsObject: jsObject, name: .integrity)
        _keepalive = ReadonlyAttribute(jsObject: jsObject, name: .keepalive)
        _isReloadNavigation = ReadonlyAttribute(jsObject: jsObject, name: .isReloadNavigation)
        _isHistoryNavigation = ReadonlyAttribute(jsObject: jsObject, name: .isHistoryNavigation)
        _signal = ReadonlyAttribute(jsObject: jsObject, name: .signal)
        _duplex = ReadonlyAttribute(jsObject: jsObject, name: .duplex)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(input: RequestInfo, init: RequestInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(input), _toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var method: String

    @ReadonlyAttribute
    public var url: String

    @ReadonlyAttribute
    public var headers: Headers

    @ReadonlyAttribute
    public var destination: RequestDestination

    @ReadonlyAttribute
    public var referrer: String

    @ReadonlyAttribute
    public var referrerPolicy: ReferrerPolicy

    @ReadonlyAttribute
    public var mode: RequestMode

    @ReadonlyAttribute
    public var credentials: RequestCredentials

    @ReadonlyAttribute
    public var cache: RequestCache

    @ReadonlyAttribute
    public var redirect: RequestRedirect

    @ReadonlyAttribute
    public var integrity: String

    @ReadonlyAttribute
    public var keepalive: Bool

    @ReadonlyAttribute
    public var isReloadNavigation: Bool

    @ReadonlyAttribute
    public var isHistoryNavigation: Bool

    @ReadonlyAttribute
    public var signal: AbortSignal

    @ReadonlyAttribute
    public var duplex: RequestDuplex

    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }
}
