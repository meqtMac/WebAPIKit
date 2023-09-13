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


public class HTMLAnchorElement: HTMLElement, HTMLHyperlinkElementUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLAnchorElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _target = ReadWriteAttribute(jsObject: jsObject, name: .target)
        _download = ReadWriteAttribute(jsObject: jsObject, name: .download)
        _ping = ReadWriteAttribute(jsObject: jsObject, name: .ping)
        _rel = ReadWriteAttribute(jsObject: jsObject, name: .rel)
        _relList = ReadonlyAttribute(jsObject: jsObject, name: .relList)
        _hreflang = ReadWriteAttribute(jsObject: jsObject, name: .hreflang)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _text = ReadWriteAttribute(jsObject: jsObject, name: .text)
        _referrerPolicy = ReadWriteAttribute(jsObject: jsObject, name: .referrerPolicy)
        _coords = ReadWriteAttribute(jsObject: jsObject, name: .coords)
        _charset = ReadWriteAttribute(jsObject: jsObject, name: .charset)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _rev = ReadWriteAttribute(jsObject: jsObject, name: .rev)
        _shape = ReadWriteAttribute(jsObject: jsObject, name: .shape)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var target: String

    @ReadWriteAttribute
    public var download: String

    @ReadWriteAttribute
    public var ping: String

    @ReadWriteAttribute
    public var rel: String

    @ReadonlyAttribute
    public var relList: DOMTokenList

    @ReadWriteAttribute
    public var hreflang: String

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var text: String

    @ReadWriteAttribute
    public var referrerPolicy: String

    @ReadWriteAttribute
    public var coords: String

    @ReadWriteAttribute
    public var charset: String

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var rev: String

    @ReadWriteAttribute
    public var shape: String
}