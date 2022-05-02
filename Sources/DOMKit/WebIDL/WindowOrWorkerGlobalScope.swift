// This file was auto-generated by WebIDLToSwift. DO NOT EDIT!

import JavaScriptEventLoop
import JavaScriptKit

public protocol WindowOrWorkerGlobalScope: JSBridgedClass {}
public extension WindowOrWorkerGlobalScope {
    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) -> JSPromise {
        let this = jsObject
        return this[Strings.fetch].function!(this: this, arguments: [input.jsValue, `init`?.jsValue ?? .undefined]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) async throws -> Response {
        let this = jsObject
        let _promise: JSPromise = this[Strings.fetch].function!(this: this, arguments: [input.jsValue, `init`?.jsValue ?? .undefined]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable var origin: String { ReadonlyAttribute[Strings.origin, in: jsObject] }

    @inlinable var isSecureContext: Bool { ReadonlyAttribute[Strings.isSecureContext, in: jsObject] }

    @inlinable var crossOriginIsolated: Bool { ReadonlyAttribute[Strings.crossOriginIsolated, in: jsObject] }

    @inlinable func reportError(e: JSValue) {
        let this = jsObject
        _ = this[Strings.reportError].function!(this: this, arguments: [e.jsValue])
    }

    @inlinable func btoa(data: String) -> String {
        let this = jsObject
        return this[Strings.btoa].function!(this: this, arguments: [data.jsValue]).fromJSValue()!
    }

    @inlinable func atob(data: String) -> String {
        let this = jsObject
        return this[Strings.atob].function!(this: this, arguments: [data.jsValue]).fromJSValue()!
    }

    @inlinable func setTimeout(handler: TimerHandler, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[Strings.setTimeout].function!(this: this, arguments: [handler.jsValue, timeout?.jsValue ?? .undefined] + arguments.map(\.jsValue)).fromJSValue()!
    }

    @inlinable func clearTimeout(id: Int32? = nil) {
        let this = jsObject
        _ = this[Strings.clearTimeout].function!(this: this, arguments: [id?.jsValue ?? .undefined])
    }

    @inlinable func setInterval(handler: TimerHandler, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[Strings.setInterval].function!(this: this, arguments: [handler.jsValue, timeout?.jsValue ?? .undefined] + arguments.map(\.jsValue)).fromJSValue()!
    }

    @inlinable func clearInterval(id: Int32? = nil) {
        let this = jsObject
        _ = this[Strings.clearInterval].function!(this: this, arguments: [id?.jsValue ?? .undefined])
    }

    // XXX: method 'queueMicrotask' is ignored

    @inlinable func createImageBitmap(image: ImageBitmapSource, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[Strings.createImageBitmap].function!(this: this, arguments: [image.jsValue, options?.jsValue ?? .undefined]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmapSource, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[Strings.createImageBitmap].function!(this: this, arguments: [image.jsValue, options?.jsValue ?? .undefined]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func createImageBitmap(image: ImageBitmapSource, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let _arg0 = image.jsValue
        let _arg1 = sx.jsValue
        let _arg2 = sy.jsValue
        let _arg3 = sw.jsValue
        let _arg4 = sh.jsValue
        let _arg5 = options?.jsValue ?? .undefined
        let this = jsObject
        return this[Strings.createImageBitmap].function!(this: this, arguments: [_arg0, _arg1, _arg2, _arg3, _arg4, _arg5]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmapSource, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let _arg0 = image.jsValue
        let _arg1 = sx.jsValue
        let _arg2 = sy.jsValue
        let _arg3 = sw.jsValue
        let _arg4 = sh.jsValue
        let _arg5 = options?.jsValue ?? .undefined
        let this = jsObject
        let _promise: JSPromise = this[Strings.createImageBitmap].function!(this: this, arguments: [_arg0, _arg1, _arg2, _arg3, _arg4, _arg5]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func structuredClone(value: JSValue, options: StructuredSerializeOptions? = nil) -> JSValue {
        let this = jsObject
        return this[Strings.structuredClone].function!(this: this, arguments: [value.jsValue, options?.jsValue ?? .undefined]).fromJSValue()!
    }

    @inlinable var performance: Performance { ReadonlyAttribute[Strings.performance, in: jsObject] }

    @inlinable var caches: CacheStorage { ReadonlyAttribute[Strings.caches, in: jsObject] }
}