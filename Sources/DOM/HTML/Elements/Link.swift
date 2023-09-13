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

public class HTMLLinkElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLLinkElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _href = ReadWriteAttribute(jsObject: jsObject, name: .href)
        _crossOrigin = ReadWriteAttribute(jsObject: jsObject, name: .crossOrigin)
        _rel = ReadWriteAttribute(jsObject: jsObject, name: .rel)
        _as = ReadWriteAttribute(jsObject: jsObject, name: .as)
        _relList = ReadonlyAttribute(jsObject: jsObject, name: .relList)
        _media = ReadWriteAttribute(jsObject: jsObject, name: .media)
        _integrity = ReadWriteAttribute(jsObject: jsObject, name: .integrity)
        _hreflang = ReadWriteAttribute(jsObject: jsObject, name: .hreflang)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _sizes = ReadonlyAttribute(jsObject: jsObject, name: .sizes)
        _imageSrcset = ReadWriteAttribute(jsObject: jsObject, name: .imageSrcset)
        _imageSizes = ReadWriteAttribute(jsObject: jsObject, name: .imageSizes)
        _referrerPolicy = ReadWriteAttribute(jsObject: jsObject, name: .referrerPolicy)
        _blocking = ReadonlyAttribute(jsObject: jsObject, name: .blocking)
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _fetchPriority = ReadWriteAttribute(jsObject: jsObject, name: .fetchPriority)
        _charset = ReadWriteAttribute(jsObject: jsObject, name: .charset)
        _rev = ReadWriteAttribute(jsObject: jsObject, name: .rev)
        _target = ReadWriteAttribute(jsObject: jsObject, name: .target)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var href: String

    @ReadWriteAttribute
    public var crossOrigin: String?

    @ReadWriteAttribute
    public var rel: String

    @ReadWriteAttribute
    public var `as`: String

    @ReadonlyAttribute
    public var relList: DOMTokenList

    @ReadWriteAttribute
    public var media: String

    @ReadWriteAttribute
    public var integrity: String

    @ReadWriteAttribute
    public var hreflang: String

    @ReadWriteAttribute
    public var type: String

    @ReadonlyAttribute
    public var sizes: DOMTokenList

    @ReadWriteAttribute
    public var imageSrcset: String

    @ReadWriteAttribute
    public var imageSizes: String

    @ReadWriteAttribute
    public var referrerPolicy: String

    @ReadonlyAttribute
    public var blocking: DOMTokenList

    @ReadWriteAttribute
    public var disabled: Bool

    @ReadWriteAttribute
    public var fetchPriority: String

    @ReadWriteAttribute
    public var charset: String

    @ReadWriteAttribute
    public var rev: String

    @ReadWriteAttribute
    public var target: String
}
