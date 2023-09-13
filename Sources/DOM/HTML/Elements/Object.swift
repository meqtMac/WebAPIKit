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

public class HTMLObjectElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLObjectElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _data = ReadWriteAttribute(jsObject: jsObject, name: .data)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _contentDocument = ReadonlyAttribute(jsObject: jsObject, name: .contentDocument)
        _contentWindow = ReadonlyAttribute(jsObject: jsObject, name: .contentWindow)
        _willValidate = ReadonlyAttribute(jsObject: jsObject, name: .willValidate)
        _validity = ReadonlyAttribute(jsObject: jsObject, name: .validity)
        _validationMessage = ReadonlyAttribute(jsObject: jsObject, name: .validationMessage)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _archive = ReadWriteAttribute(jsObject: jsObject, name: .archive)
        _code = ReadWriteAttribute(jsObject: jsObject, name: .code)
        _declare = ReadWriteAttribute(jsObject: jsObject, name: .declare)
        _hspace = ReadWriteAttribute(jsObject: jsObject, name: .hspace)
        _standby = ReadWriteAttribute(jsObject: jsObject, name: .standby)
        _vspace = ReadWriteAttribute(jsObject: jsObject, name: .vspace)
        _codeBase = ReadWriteAttribute(jsObject: jsObject, name: .codeBase)
        _codeType = ReadWriteAttribute(jsObject: jsObject, name: .codeType)
        _useMap = ReadWriteAttribute(jsObject: jsObject, name: .useMap)
        _border = ReadWriteAttribute(jsObject: jsObject, name: .border)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var data: String

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var name: String

    @ReadonlyAttribute
    public var form: HTMLFormElement?

    @ReadWriteAttribute
    public var width: String

    @ReadWriteAttribute
    public var height: String

    @ReadonlyAttribute
    public var contentDocument: Document?

    @ReadonlyAttribute
    public var contentWindow: WindowProxy?

    @inlinable public func getSVGDocument() -> Document? {
        let this = jsObject
        return this[.getSVGDocument].function!(this: this, arguments: []).fromJSValue()
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

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var archive: String

    @ReadWriteAttribute
    public var code: String

    @ReadWriteAttribute
    public var declare: Bool

    @ReadWriteAttribute
    public var hspace: UInt32

    @ReadWriteAttribute
    public var standby: String

    @ReadWriteAttribute
    public var vspace: UInt32

    @ReadWriteAttribute
    public var codeBase: String

    @ReadWriteAttribute
    public var codeType: String

    @ReadWriteAttribute
    public var useMap: String

    @ReadWriteAttribute
    public var border: String
}