//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import JavaScriptKit
import JavaScriptEventLoop
import JavaScriptBigIntSupport
import WebAPIBase
import ECMAScript

public class TransformStream: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TransformStream].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _readable = ReadonlyAttribute(jsObject: jsObject, name: .readable)
        _writable = ReadonlyAttribute(jsObject: jsObject, name: .writable)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(transformer: JSObject? = nil, writableStrategy: QueuingStrategy? = nil, readableStrategy: QueuingStrategy? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(transformer), _toJSValue(writableStrategy), _toJSValue(readableStrategy)]))
    }

    @ReadonlyAttribute
    public var readable: ReadableStream

    @ReadonlyAttribute
    public var writable: WritableStream
}

public class TransformStreamDefaultController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TransformStreamDefaultController].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _desiredSize = ReadonlyAttribute(jsObject: jsObject, name: .desiredSize)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var desiredSize: Double?

    @inlinable public func enqueue(chunk: JSValue? = nil) {
        let this = jsObject
        _ = this[.enqueue].function!(this: this, arguments: [_toJSValue(chunk)])
    }

    @inlinable public func error(reason: JSValue? = nil) {
        let this = jsObject
        _ = this[.error].function!(this: this, arguments: [_toJSValue(reason)])
    }

    @inlinable public func terminate() {
        let this = jsObject
        _ = this[.terminate].function!(this: this, arguments: [])
    }
}

public class Transformer: BridgedDictionary {
    public convenience init(start: @escaping TransformerStartCallback, transform: @escaping TransformerTransformCallback, flush: @escaping TransformerFlushCallback, readableType: JSValue, writableType: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        ClosureAttribute1[.start, in: object] = start
        ClosureAttribute2[.transform, in: object] = transform
        ClosureAttribute1[.flush, in: object] = flush
        object[.readableType] = _toJSValue(readableType)
        object[.writableType] = _toJSValue(writableType)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _start = ClosureAttribute1(jsObject: object, name: .start)
        _transform = ClosureAttribute2(jsObject: object, name: .transform)
        _flush = ClosureAttribute1(jsObject: object, name: .flush)
        _readableType = ReadWriteAttribute(jsObject: object, name: .readableType)
        _writableType = ReadWriteAttribute(jsObject: object, name: .writableType)
        super.init(unsafelyWrapping: object)
    }

    @ClosureAttribute1
    public var start: TransformerStartCallback

    @ClosureAttribute2
    public var transform: TransformerTransformCallback

    @ClosureAttribute1
    public var flush: TransformerFlushCallback

    @ReadWriteAttribute
    public var readableType: JSValue

    @ReadWriteAttribute
    public var writableType: JSValue
}

