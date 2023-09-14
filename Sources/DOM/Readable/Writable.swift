//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import JavaScriptBigIntSupport
import WebAPIBase
import JavaScriptEventLoop

open class WritableStream: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.WritableStream].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _locked = ReadonlyAttribute(jsObject: jsObject, name: .locked)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(underlyingSink: JSObject? = nil, strategy: QueuingStrategy? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(underlyingSink), _toJSValue(strategy)]))
    }

    @ReadonlyAttribute
    public var locked: Bool

    @inlinable public func abort(reason: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func abort(reason: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func close() -> JSPromise {
        let this = jsObject
        return this[.close].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func close() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.close].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func getWriter() -> WritableStreamDefaultWriter {
        let this = jsObject
        return this[.getWriter].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class WritableStreamDefaultController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WritableStreamDefaultController].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _signal = ReadonlyAttribute(jsObject: jsObject, name: .signal)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var signal: AbortSignal

    @inlinable public func error(e: JSValue? = nil) {
        let this = jsObject
        _ = this[.error].function!(this: this, arguments: [_toJSValue(e)])
    }
}

public class WritableStreamDefaultWriter: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WritableStreamDefaultWriter].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _closed = ReadonlyAttribute(jsObject: jsObject, name: .closed)
        _desiredSize = ReadonlyAttribute(jsObject: jsObject, name: .desiredSize)
        _ready = ReadonlyAttribute(jsObject: jsObject, name: .ready)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(stream: WritableStream) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(stream)]))
    }

    @ReadonlyAttribute
    public var closed: JSPromise

    @ReadonlyAttribute
    public var desiredSize: Double?

    @ReadonlyAttribute
    public var ready: JSPromise

    @inlinable public func abort(reason: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func abort(reason: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func close() -> JSPromise {
        let this = jsObject
        return this[.close].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func close() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.close].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func releaseLock() {
        let this = jsObject
        _ = this[.releaseLock].function!(this: this, arguments: [])
    }

    @inlinable public func write(chunk: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.write].function!(this: this, arguments: [_toJSValue(chunk)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func write(chunk: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.write].function!(this: this, arguments: [_toJSValue(chunk)]).fromJSValue()!
        _ = try await _promise.value
    }
}

