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

public class HTMLOutputElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOutputElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _htmlFor = ReadonlyAttribute(jsObject: jsObject, name: .htmlFor)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _defaultValue = ReadWriteAttribute(jsObject: jsObject, name: .defaultValue)
        _value = ReadWriteAttribute(jsObject: jsObject, name: .value)
        _willValidate = ReadonlyAttribute(jsObject: jsObject, name: .willValidate)
        _validity = ReadonlyAttribute(jsObject: jsObject, name: .validity)
        _validationMessage = ReadonlyAttribute(jsObject: jsObject, name: .validationMessage)
        _labels = ReadonlyAttribute(jsObject: jsObject, name: .labels)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadonlyAttribute
    public var htmlFor: DOMTokenList

    @ReadonlyAttribute
    public var form: HTMLFormElement?

    @ReadWriteAttribute
    public var name: String

    @ReadonlyAttribute
    public var type: String

    @ReadWriteAttribute
    public var defaultValue: String

    @ReadWriteAttribute
    public var value: String

    @ReadonlyAttribute
    public var willValidate: Bool

    @ReadonlyAttribute
    public var validity: ValidityState

    @ReadonlyAttribute
    public var validationMessage: String

    @inlinable public func checkValidity() -> Bool {
        let this = jsObject
        return this[.checkValidity].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func reportValidity() -> Bool {
        let this = jsObject
        return this[.reportValidity].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func setCustomValidity(error: String) {
        let this = jsObject
        _ = this[.setCustomValidity].function!(this: this, arguments: [_toJSValue(error)])
    }

    @ReadonlyAttribute
    public var labels: NodeList
}