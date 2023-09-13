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

public class HTMLLabelElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLLabelElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _htmlFor = ReadWriteAttribute(jsObject: jsObject, name: .htmlFor)
        _control = ReadonlyAttribute(jsObject: jsObject, name: .control)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadonlyAttribute
    public var form: HTMLFormElement?

    @ReadWriteAttribute
    public var htmlFor: String

    @ReadonlyAttribute
    public var control: HTMLElement?
}

