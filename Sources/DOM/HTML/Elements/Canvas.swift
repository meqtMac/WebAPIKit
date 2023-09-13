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

public class HTMLCanvasElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLCanvasElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var width: UInt32

    @ReadWriteAttribute
    public var height: UInt32

    // XXX: member 'getContext' is ignored

    @inlinable public func toDataURL(type: String? = nil, quality: JSValue? = nil) -> String {
        let this = jsObject
        return this[.toDataURL].function!(this: this, arguments: [_toJSValue(type), _toJSValue(quality)]).fromJSValue()!
    }

    @inlinable public func toBlob(callback: @escaping BlobCallback, type: String? = nil, quality: JSValue? = nil) {
        let this = jsObject
        _ = this[.toBlob].function!(this: this, arguments: [_toJSValue(callback), _toJSValue(type), _toJSValue(quality)])
    }

    @inlinable public func transferControlToOffscreen() -> OffscreenCanvas {
        let this = jsObject
        return this[.transferControlToOffscreen].function!(this: this, arguments: []).fromJSValue()!
    }
}
