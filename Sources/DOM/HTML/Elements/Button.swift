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

public class HTMLButtonElement: HTMLElement, PopoverInvokerElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLButtonElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _formAction = ReadWriteAttribute(jsObject: jsObject, name: .formAction)
        _formEnctype = ReadWriteAttribute(jsObject: jsObject, name: .formEnctype)
        _formMethod = ReadWriteAttribute(jsObject: jsObject, name: .formMethod)
        _formNoValidate = ReadWriteAttribute(jsObject: jsObject, name: .formNoValidate)
        _formTarget = ReadWriteAttribute(jsObject: jsObject, name: .formTarget)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
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

    @ReadWriteAttribute
    public var disabled: Bool

    @ReadonlyAttribute
    public var form: HTMLFormElement?

    @ReadWriteAttribute
    public var formAction: String

    @ReadWriteAttribute
    public var formEnctype: String

    @ReadWriteAttribute
    public var formMethod: String

    @ReadWriteAttribute
    public var formNoValidate: Bool

    @ReadWriteAttribute
    public var formTarget: String

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var type: String

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