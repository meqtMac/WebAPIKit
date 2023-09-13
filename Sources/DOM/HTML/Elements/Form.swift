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

public class HTMLFormElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFormElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _acceptCharset = ReadWriteAttribute(jsObject: jsObject, name: .acceptCharset)
        _action = ReadWriteAttribute(jsObject: jsObject, name: .action)
        _autocomplete = ReadWriteAttribute(jsObject: jsObject, name: .autocomplete)
        _enctype = ReadWriteAttribute(jsObject: jsObject, name: .enctype)
        _encoding = ReadWriteAttribute(jsObject: jsObject, name: .encoding)
        _method = ReadWriteAttribute(jsObject: jsObject, name: .method)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _noValidate = ReadWriteAttribute(jsObject: jsObject, name: .noValidate)
        _target = ReadWriteAttribute(jsObject: jsObject, name: .target)
        _rel = ReadWriteAttribute(jsObject: jsObject, name: .rel)
        _relList = ReadonlyAttribute(jsObject: jsObject, name: .relList)
        _elements = ReadonlyAttribute(jsObject: jsObject, name: .elements)
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var acceptCharset: String

    @ReadWriteAttribute
    public var action: String

    @ReadWriteAttribute
    public var autocomplete: String

    @ReadWriteAttribute
    public var enctype: String

    @ReadWriteAttribute
    public var encoding: String

    @ReadWriteAttribute
    public var method: String

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var noValidate: Bool

    @ReadWriteAttribute
    public var target: String

    @ReadWriteAttribute
    public var rel: String

    @ReadonlyAttribute
    public var relList: DOMTokenList

    @ReadonlyAttribute
    public var elements: HTMLFormControlsCollection

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> Element {
        jsObject[key].fromJSValue()!
    }

    @inlinable public subscript(key: String) -> Element_or_RadioNodeList {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func submit() {
        let this = jsObject
        _ = this[.submit].function!(this: this, arguments: [])
    }

    @inlinable public func requestSubmit(submitter: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.requestSubmit].function!(this: this, arguments: [_toJSValue(submitter)])
    }

    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }

    @inlinable public func checkValidity() -> Bool {
        let this = jsObject
        return this[.checkValidity].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func reportValidity() -> Bool {
        let this = jsObject
        return this[.reportValidity].function!(this: this, arguments: []).fromJSValue()!
    }
}