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

public class HTMLOptionElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOptionElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _label = ReadWriteAttribute(jsObject: jsObject, name: .label)
        _defaultSelected = ReadWriteAttribute(jsObject: jsObject, name: .defaultSelected)
        _selected = ReadWriteAttribute(jsObject: jsObject, name: .selected)
        _value = ReadWriteAttribute(jsObject: jsObject, name: .value)
        _text = ReadWriteAttribute(jsObject: jsObject, name: .text)
        _index = ReadonlyAttribute(jsObject: jsObject, name: .index)
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
    public var label: String

    @ReadWriteAttribute
    public var defaultSelected: Bool

    @ReadWriteAttribute
    public var selected: Bool

    @ReadWriteAttribute
    public var value: String

    @ReadWriteAttribute
    public var text: String

    @ReadonlyAttribute
    public var index: Int32
}
