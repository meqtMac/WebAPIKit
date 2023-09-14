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

public class HTMLScriptElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLScriptElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _noModule = ReadWriteAttribute(jsObject: jsObject, name: .noModule)
        _async = ReadWriteAttribute(jsObject: jsObject, name: .async)
        _defer = ReadWriteAttribute(jsObject: jsObject, name: .defer)
        _crossOrigin = ReadWriteAttribute(jsObject: jsObject, name: .crossOrigin)
        _text = ReadWriteAttribute(jsObject: jsObject, name: .text)
        _integrity = ReadWriteAttribute(jsObject: jsObject, name: .integrity)
        _referrerPolicy = ReadWriteAttribute(jsObject: jsObject, name: .referrerPolicy)
        _blocking = ReadonlyAttribute(jsObject: jsObject, name: .blocking)
        _fetchPriority = ReadWriteAttribute(jsObject: jsObject, name: .fetchPriority)
        _charset = ReadWriteAttribute(jsObject: jsObject, name: .charset)
        _event = ReadWriteAttribute(jsObject: jsObject, name: .event)
        _htmlFor = ReadWriteAttribute(jsObject: jsObject, name: .htmlFor)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var src: String

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var noModule: Bool

    @ReadWriteAttribute
    public var async: Bool

    @ReadWriteAttribute
    public var `defer`: Bool

    @ReadWriteAttribute
    public var crossOrigin: String?

    @ReadWriteAttribute
    public var text: String

    @ReadWriteAttribute
    public var integrity: String

    @ReadWriteAttribute
    public var referrerPolicy: String

    @ReadonlyAttribute
    public var blocking: DOMTokenList

    @ReadWriteAttribute
    public var fetchPriority: String

    @inlinable public class func supports(type: String) -> Bool {
        let this = constructor!
        return this[.supports].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }

    @ReadWriteAttribute
    public var charset: String

    @ReadWriteAttribute
    public var event: String

    @ReadWriteAttribute
    public var htmlFor: String
}
