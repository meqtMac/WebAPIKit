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


public class HTMLCollection: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.HTMLCollection].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> Element? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> Element? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }

    @inlinable public subscript(key: String) -> Element? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func namedItem(name: String) -> Element? {
        let this = jsObject
        return this[.namedItem].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }
}