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

public class HTMLDialogElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLDialogElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _open = ReadWriteAttribute(jsObject: jsObject, name: .open)
        _returnValue = ReadWriteAttribute(jsObject: jsObject, name: .returnValue)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var open: Bool

    @ReadWriteAttribute
    public var returnValue: String

    @inlinable public func show() {
        let this = jsObject
        _ = this[.show].function!(this: this, arguments: [])
    }

    @inlinable public func showModal() {
        let this = jsObject
        _ = this[.showModal].function!(this: this, arguments: [])
    }

    @inlinable public func close(returnValue: String? = nil) {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [_toJSValue(returnValue)])
    }
}