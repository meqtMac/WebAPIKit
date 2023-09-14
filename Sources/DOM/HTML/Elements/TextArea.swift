//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class HTMLTextAreaElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTextAreaElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _autocomplete = ReadWriteAttribute(jsObject: jsObject, name: .autocomplete)
        _cols = ReadWriteAttribute(jsObject: jsObject, name: .cols)
        _dirName = ReadWriteAttribute(jsObject: jsObject, name: .dirName)
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _maxLength = ReadWriteAttribute(jsObject: jsObject, name: .maxLength)
        _minLength = ReadWriteAttribute(jsObject: jsObject, name: .minLength)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _placeholder = ReadWriteAttribute(jsObject: jsObject, name: .placeholder)
        _readOnly = ReadWriteAttribute(jsObject: jsObject, name: .readOnly)
        _required = ReadWriteAttribute(jsObject: jsObject, name: .required)
        _rows = ReadWriteAttribute(jsObject: jsObject, name: .rows)
        _wrap = ReadWriteAttribute(jsObject: jsObject, name: .wrap)
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _defaultValue = ReadWriteAttribute(jsObject: jsObject, name: .defaultValue)
        _value = ReadWriteAttribute(jsObject: jsObject, name: .value)
        _textLength = ReadonlyAttribute(jsObject: jsObject, name: .textLength)
        _willValidate = ReadonlyAttribute(jsObject: jsObject, name: .willValidate)
        _validity = ReadonlyAttribute(jsObject: jsObject, name: .validity)
        _validationMessage = ReadonlyAttribute(jsObject: jsObject, name: .validationMessage)
        _labels = ReadonlyAttribute(jsObject: jsObject, name: .labels)
        _selectionStart = ReadWriteAttribute(jsObject: jsObject, name: .selectionStart)
        _selectionEnd = ReadWriteAttribute(jsObject: jsObject, name: .selectionEnd)
        _selectionDirection = ReadWriteAttribute(jsObject: jsObject, name: .selectionDirection)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var autocomplete: String

    @ReadWriteAttribute
    public var cols: UInt32

    @ReadWriteAttribute
    public var dirName: String

    @ReadWriteAttribute
    public var disabled: Bool

    @ReadonlyAttribute
    public var form: HTMLFormElement?

    @ReadWriteAttribute
    public var maxLength: Int32

    @ReadWriteAttribute
    public var minLength: Int32

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var placeholder: String

    @ReadWriteAttribute
    public var readOnly: Bool

    @ReadWriteAttribute
    public var required: Bool

    @ReadWriteAttribute
    public var rows: UInt32

    @ReadWriteAttribute
    public var wrap: String

    @ReadonlyAttribute
    public var type: String

    @ReadWriteAttribute
    public var defaultValue: String

    @ReadWriteAttribute
    public var value: String

    @ReadonlyAttribute
    public var textLength: UInt32

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

    @inlinable public func select() {
        let this = jsObject
        _ = this[.select].function!(this: this, arguments: [])
    }

    @ReadWriteAttribute
    public var selectionStart: UInt32

    @ReadWriteAttribute
    public var selectionEnd: UInt32

    @ReadWriteAttribute
    public var selectionDirection: String

    @inlinable public func setRangeText(replacement: String) {
        let this = jsObject
        _ = this[.setRangeText].function!(this: this, arguments: [_toJSValue(replacement)])
    }

    @inlinable public func setRangeText(replacement: String, start: UInt32, end: UInt32, selectionMode: SelectionMode? = nil) {
        let this = jsObject
        _ = this[.setRangeText].function!(this: this, arguments: [_toJSValue(replacement), _toJSValue(start), _toJSValue(end), _toJSValue(selectionMode)])
    }

    @inlinable public func setSelectionRange(start: UInt32, end: UInt32, direction: String? = nil) {
        let this = jsObject
        _ = this[.setSelectionRange].function!(this: this, arguments: [_toJSValue(start), _toJSValue(end), _toJSValue(direction)])
    }
}

