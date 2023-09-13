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

public class HTMLElement: Element, GlobalEventHandlers, ElementContentEditable, HTMLOrSVGElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _title = ReadWriteAttribute(jsObject: jsObject, name: .title)
        _lang = ReadWriteAttribute(jsObject: jsObject, name: .lang)
        _translate = ReadWriteAttribute(jsObject: jsObject, name: .translate)
        _dir = ReadWriteAttribute(jsObject: jsObject, name: .dir)
        _hidden = ReadWriteAttribute(jsObject: jsObject, name: .hidden)
        _inert = ReadWriteAttribute(jsObject: jsObject, name: .inert)
        _accessKey = ReadWriteAttribute(jsObject: jsObject, name: .accessKey)
        _accessKeyLabel = ReadonlyAttribute(jsObject: jsObject, name: .accessKeyLabel)
        _draggable = ReadWriteAttribute(jsObject: jsObject, name: .draggable)
        _spellcheck = ReadWriteAttribute(jsObject: jsObject, name: .spellcheck)
        _autocapitalize = ReadWriteAttribute(jsObject: jsObject, name: .autocapitalize)
        _innerText = ReadWriteAttribute(jsObject: jsObject, name: .innerText)
        _outerText = ReadWriteAttribute(jsObject: jsObject, name: .outerText)
        _popover = ReadWriteAttribute(jsObject: jsObject, name: .popover)
        _offsetParent = ReadonlyAttribute(jsObject: jsObject, name: .offsetParent)
        _offsetTop = ReadonlyAttribute(jsObject: jsObject, name: .offsetTop)
        _offsetLeft = ReadonlyAttribute(jsObject: jsObject, name: .offsetLeft)
        _offsetWidth = ReadonlyAttribute(jsObject: jsObject, name: .offsetWidth)
        _offsetHeight = ReadonlyAttribute(jsObject: jsObject, name: .offsetHeight)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var title: String

    @ReadWriteAttribute
    public var lang: String

    @ReadWriteAttribute
    public var translate: Bool

    @ReadWriteAttribute
    public var dir: String

    @ReadWriteAttribute
    public var hidden: Bool_or_Double_or_String?

    @ReadWriteAttribute
    public var inert: Bool

    @inlinable public func click() {
        let this = jsObject
        _ = this[.click].function!(this: this, arguments: [])
    }

    @ReadWriteAttribute
    public var accessKey: String

    @ReadonlyAttribute
    public var accessKeyLabel: String

    @ReadWriteAttribute
    public var draggable: Bool

    @ReadWriteAttribute
    public var spellcheck: Bool

    @ReadWriteAttribute
    public var autocapitalize: String

    @ReadWriteAttribute
    public var innerText: String

    @ReadWriteAttribute
    public var outerText: String

    @inlinable public func attachInternals() -> ElementInternals {
        let this = jsObject
        return this[.attachInternals].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func showPopover() {
        let this = jsObject
        _ = this[.showPopover].function!(this: this, arguments: [])
    }

    @inlinable public func hidePopover() {
        let this = jsObject
        _ = this[.hidePopover].function!(this: this, arguments: [])
    }

    @inlinable public func togglePopover(force: Bool? = nil) -> Bool {
        let this = jsObject
        return this[.togglePopover].function!(this: this, arguments: [_toJSValue(force)]).fromJSValue()!
    }

    @ReadWriteAttribute
    public var popover: String?

    @ReadonlyAttribute
    public var offsetParent: Element?

    @ReadonlyAttribute
    public var offsetTop: Int32

    @ReadonlyAttribute
    public var offsetLeft: Int32

    @ReadonlyAttribute
    public var offsetWidth: Int32

    @ReadonlyAttribute
    public var offsetHeight: Int32
}