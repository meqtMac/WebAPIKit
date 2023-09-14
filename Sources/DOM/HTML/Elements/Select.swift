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

public class HTMLSelectElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLSelectElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _autocomplete = ReadWriteAttribute(jsObject: jsObject, name: .autocomplete)
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _multiple = ReadWriteAttribute(jsObject: jsObject, name: .multiple)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _required = ReadWriteAttribute(jsObject: jsObject, name: .required)
        _size = ReadWriteAttribute(jsObject: jsObject, name: .size)
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _options = ReadonlyAttribute(jsObject: jsObject, name: .options)
        _length = ReadWriteAttribute(jsObject: jsObject, name: .length)
        _selectedOptions = ReadonlyAttribute(jsObject: jsObject, name: .selectedOptions)
        _selectedIndex = ReadWriteAttribute(jsObject: jsObject, name: .selectedIndex)
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
    public var autocomplete: String

    @ReadWriteAttribute
    public var disabled: Bool

    @ReadonlyAttribute
    public var form: HTMLFormElement?

    @ReadWriteAttribute
    public var multiple: Bool

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var required: Bool

    @ReadWriteAttribute
    public var size: UInt32

    @ReadonlyAttribute
    public var type: String

    @ReadonlyAttribute
    public var options: HTMLOptionsCollection

    @ReadWriteAttribute
    public var length: UInt32

    @inlinable public func item(index: UInt32) -> HTMLOptionElement? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }

    @inlinable public func namedItem(name: String) -> HTMLOptionElement? {
        let this = jsObject
        return this[.namedItem].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }

    @inlinable public func add(element: HTMLOptGroupElement, before: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    
     @inlinable public func add(element: HTMLOptGroupElement, before: Int32) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
     @inlinable public func add(element: HTMLOptionElement, before: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    
     @inlinable public func add(element: HTMLOptionElement, before: Int32) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    

    @inlinable public func remove() {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: [])
    }

    @inlinable public func remove(index: Int32) {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: [_toJSValue(index)])
    }

    @inlinable public subscript(key: Int) -> HTMLOptionElement? {
        get {
            jsObject[key].fromJSValue()
        }
        set {
            jsObject[key] = _toJSValue(newValue)
        }
    }

    @ReadonlyAttribute
    public var selectedOptions: HTMLCollection

    @ReadWriteAttribute
    public var selectedIndex: Int32

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