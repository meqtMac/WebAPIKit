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

public class HTMLInputElement: HTMLElement, PopoverInvokerElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLInputElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _accept = ReadWriteAttribute(jsObject: jsObject, name: .accept)
        _alt = ReadWriteAttribute(jsObject: jsObject, name: .alt)
        _autocomplete = ReadWriteAttribute(jsObject: jsObject, name: .autocomplete)
        _defaultChecked = ReadWriteAttribute(jsObject: jsObject, name: .defaultChecked)
        _checked = ReadWriteAttribute(jsObject: jsObject, name: .checked)
        _dirName = ReadWriteAttribute(jsObject: jsObject, name: .dirName)
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _files = ReadWriteAttribute(jsObject: jsObject, name: .files)
        _formAction = ReadWriteAttribute(jsObject: jsObject, name: .formAction)
        _formEnctype = ReadWriteAttribute(jsObject: jsObject, name: .formEnctype)
        _formMethod = ReadWriteAttribute(jsObject: jsObject, name: .formMethod)
        _formNoValidate = ReadWriteAttribute(jsObject: jsObject, name: .formNoValidate)
        _formTarget = ReadWriteAttribute(jsObject: jsObject, name: .formTarget)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _indeterminate = ReadWriteAttribute(jsObject: jsObject, name: .indeterminate)
        _list = ReadonlyAttribute(jsObject: jsObject, name: .list)
        _max = ReadWriteAttribute(jsObject: jsObject, name: .max)
        _maxLength = ReadWriteAttribute(jsObject: jsObject, name: .maxLength)
        _min = ReadWriteAttribute(jsObject: jsObject, name: .min)
        _minLength = ReadWriteAttribute(jsObject: jsObject, name: .minLength)
        _multiple = ReadWriteAttribute(jsObject: jsObject, name: .multiple)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _pattern = ReadWriteAttribute(jsObject: jsObject, name: .pattern)
        _placeholder = ReadWriteAttribute(jsObject: jsObject, name: .placeholder)
        _readOnly = ReadWriteAttribute(jsObject: jsObject, name: .readOnly)
        _required = ReadWriteAttribute(jsObject: jsObject, name: .required)
        _size = ReadWriteAttribute(jsObject: jsObject, name: .size)
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _step = ReadWriteAttribute(jsObject: jsObject, name: .step)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _defaultValue = ReadWriteAttribute(jsObject: jsObject, name: .defaultValue)
        _value = ReadWriteAttribute(jsObject: jsObject, name: .value)
        _valueAsDate = ReadWriteAttribute(jsObject: jsObject, name: .valueAsDate)
        _valueAsNumber = ReadWriteAttribute(jsObject: jsObject, name: .valueAsNumber)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _willValidate = ReadonlyAttribute(jsObject: jsObject, name: .willValidate)
        _validity = ReadonlyAttribute(jsObject: jsObject, name: .validity)
        _validationMessage = ReadonlyAttribute(jsObject: jsObject, name: .validationMessage)
        _labels = ReadonlyAttribute(jsObject: jsObject, name: .labels)
        _selectionStart = ReadWriteAttribute(jsObject: jsObject, name: .selectionStart)
        _selectionEnd = ReadWriteAttribute(jsObject: jsObject, name: .selectionEnd)
        _selectionDirection = ReadWriteAttribute(jsObject: jsObject, name: .selectionDirection)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _useMap = ReadWriteAttribute(jsObject: jsObject, name: .useMap)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var accept: String

    @ReadWriteAttribute
    public var alt: String

    @ReadWriteAttribute
    public var autocomplete: String

    @ReadWriteAttribute
    public var defaultChecked: Bool

    @ReadWriteAttribute
    public var checked: Bool

    @ReadWriteAttribute
    public var dirName: String

    @ReadWriteAttribute
    public var disabled: Bool

    @ReadonlyAttribute
    public var form: HTMLFormElement?

    @ReadWriteAttribute
    public var files: FileList?

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
    public var height: UInt32

    @ReadWriteAttribute
    public var indeterminate: Bool

    @ReadonlyAttribute
    public var list: HTMLDataListElement?

    @ReadWriteAttribute
    public var max: String

    @ReadWriteAttribute
    public var maxLength: Int32

    @ReadWriteAttribute
    public var min: String

    @ReadWriteAttribute
    public var minLength: Int32

    @ReadWriteAttribute
    public var multiple: Bool

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var pattern: String

    @ReadWriteAttribute
    public var placeholder: String

    @ReadWriteAttribute
    public var readOnly: Bool

    @ReadWriteAttribute
    public var required: Bool

    @ReadWriteAttribute
    public var size: UInt32

    @ReadWriteAttribute
    public var src: String

    @ReadWriteAttribute
    public var step: String

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var defaultValue: String

    @ReadWriteAttribute
    public var value: String

    @ReadWriteAttribute
    public var valueAsDate: JSObject?

    @ReadWriteAttribute
    public var valueAsNumber: Double

    @ReadWriteAttribute
    public var width: UInt32

    @inlinable public func stepUp(n: Int32? = nil) {
        let this = jsObject
        _ = this[.stepUp].function!(this: this, arguments: [_toJSValue(n)])
    }

    @inlinable public func stepDown(n: Int32? = nil) {
        let this = jsObject
        _ = this[.stepDown].function!(this: this, arguments: [_toJSValue(n)])
    }

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
    public var labels: NodeList?

    @inlinable public func select() {
        let this = jsObject
        _ = this[.select].function!(this: this, arguments: [])
    }

    @ReadWriteAttribute
    public var selectionStart: UInt32?

    @ReadWriteAttribute
    public var selectionEnd: UInt32?

    @ReadWriteAttribute
    public var selectionDirection: String?

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

    @inlinable public func showPicker() {
        let this = jsObject
        _ = this[.showPicker].function!(this: this, arguments: [])
    }

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var useMap: String
}
