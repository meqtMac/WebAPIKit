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

public class HTMLImageElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLImageElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _alt = ReadWriteAttribute(jsObject: jsObject, name: .alt)
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _srcset = ReadWriteAttribute(jsObject: jsObject, name: .srcset)
        _sizes = ReadWriteAttribute(jsObject: jsObject, name: .sizes)
        _crossOrigin = ReadWriteAttribute(jsObject: jsObject, name: .crossOrigin)
        _useMap = ReadWriteAttribute(jsObject: jsObject, name: .useMap)
        _isMap = ReadWriteAttribute(jsObject: jsObject, name: .isMap)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _naturalWidth = ReadonlyAttribute(jsObject: jsObject, name: .naturalWidth)
        _naturalHeight = ReadonlyAttribute(jsObject: jsObject, name: .naturalHeight)
        _complete = ReadonlyAttribute(jsObject: jsObject, name: .complete)
        _currentSrc = ReadonlyAttribute(jsObject: jsObject, name: .currentSrc)
        _referrerPolicy = ReadWriteAttribute(jsObject: jsObject, name: .referrerPolicy)
        _decoding = ReadWriteAttribute(jsObject: jsObject, name: .decoding)
        _loading = ReadWriteAttribute(jsObject: jsObject, name: .loading)
        _fetchPriority = ReadWriteAttribute(jsObject: jsObject, name: .fetchPriority)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _lowsrc = ReadWriteAttribute(jsObject: jsObject, name: .lowsrc)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _hspace = ReadWriteAttribute(jsObject: jsObject, name: .hspace)
        _vspace = ReadWriteAttribute(jsObject: jsObject, name: .vspace)
        _longDesc = ReadWriteAttribute(jsObject: jsObject, name: .longDesc)
        _border = ReadWriteAttribute(jsObject: jsObject, name: .border)
        _x = ReadonlyAttribute(jsObject: jsObject, name: .x)
        _y = ReadonlyAttribute(jsObject: jsObject, name: .y)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var alt: String

    @ReadWriteAttribute
    public var src: String

    @ReadWriteAttribute
    public var srcset: String

    @ReadWriteAttribute
    public var sizes: String

    @ReadWriteAttribute
    public var crossOrigin: String?

    @ReadWriteAttribute
    public var useMap: String

    @ReadWriteAttribute
    public var isMap: Bool

    @ReadWriteAttribute
    public var width: UInt32

    @ReadWriteAttribute
    public var height: UInt32

    @ReadonlyAttribute
    public var naturalWidth: UInt32

    @ReadonlyAttribute
    public var naturalHeight: UInt32

    @ReadonlyAttribute
    public var complete: Bool

    @ReadonlyAttribute
    public var currentSrc: String

    @ReadWriteAttribute
    public var referrerPolicy: String

    @ReadWriteAttribute
    public var decoding: String

    @ReadWriteAttribute
    public var loading: String

    @ReadWriteAttribute
    public var fetchPriority: String

    @inlinable public func decode() -> JSPromise {
        let this = jsObject
        return this[.decode].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func decode() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.decode].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var lowsrc: String

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var hspace: UInt32

    @ReadWriteAttribute
    public var vspace: UInt32

    @ReadWriteAttribute
    public var longDesc: String

    @ReadWriteAttribute
    public var border: String

    @ReadonlyAttribute
    public var x: Int32

    @ReadonlyAttribute
    public var y: Int32
}