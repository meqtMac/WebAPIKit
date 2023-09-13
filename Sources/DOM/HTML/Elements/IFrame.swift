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

public class HTMLIFrameElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLIFrameElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _srcdoc = ReadWriteAttribute(jsObject: jsObject, name: .srcdoc)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _sandbox = ReadonlyAttribute(jsObject: jsObject, name: .sandbox)
        _allow = ReadWriteAttribute(jsObject: jsObject, name: .allow)
        _allowFullscreen = ReadWriteAttribute(jsObject: jsObject, name: .allowFullscreen)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _referrerPolicy = ReadWriteAttribute(jsObject: jsObject, name: .referrerPolicy)
        _loading = ReadWriteAttribute(jsObject: jsObject, name: .loading)
        _contentDocument = ReadonlyAttribute(jsObject: jsObject, name: .contentDocument)
        _contentWindow = ReadonlyAttribute(jsObject: jsObject, name: .contentWindow)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _scrolling = ReadWriteAttribute(jsObject: jsObject, name: .scrolling)
        _frameBorder = ReadWriteAttribute(jsObject: jsObject, name: .frameBorder)
        _longDesc = ReadWriteAttribute(jsObject: jsObject, name: .longDesc)
        _marginHeight = ReadWriteAttribute(jsObject: jsObject, name: .marginHeight)
        _marginWidth = ReadWriteAttribute(jsObject: jsObject, name: .marginWidth)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var src: String

    @ReadWriteAttribute
    public var srcdoc: String

    @ReadWriteAttribute
    public var name: String

    @ReadonlyAttribute
    public var sandbox: DOMTokenList

    @ReadWriteAttribute
    public var allow: String

    @ReadWriteAttribute
    public var allowFullscreen: Bool

    @ReadWriteAttribute
    public var width: String

    @ReadWriteAttribute
    public var height: String

    @ReadWriteAttribute
    public var referrerPolicy: String

    @ReadWriteAttribute
    public var loading: String

    @ReadonlyAttribute
    public var contentDocument: Document?

    @ReadonlyAttribute
    public var contentWindow: WindowProxy?

    @inlinable public func getSVGDocument() -> Document? {
        let this = jsObject
        return this[.getSVGDocument].function!(this: this, arguments: []).fromJSValue()
    }

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var scrolling: String

    @ReadWriteAttribute
    public var frameBorder: String

    @ReadWriteAttribute
    public var longDesc: String

    @ReadWriteAttribute
    public var marginHeight: String

    @ReadWriteAttribute
    public var marginWidth: String
}