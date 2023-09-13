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


public class HTMLAreaElement: HTMLElement, HTMLHyperlinkElementUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLAreaElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _alt = ReadWriteAttribute(jsObject: jsObject, name: .alt)
        _coords = ReadWriteAttribute(jsObject: jsObject, name: .coords)
        _shape = ReadWriteAttribute(jsObject: jsObject, name: .shape)
        _target = ReadWriteAttribute(jsObject: jsObject, name: .target)
        _download = ReadWriteAttribute(jsObject: jsObject, name: .download)
        _ping = ReadWriteAttribute(jsObject: jsObject, name: .ping)
        _rel = ReadWriteAttribute(jsObject: jsObject, name: .rel)
        _relList = ReadonlyAttribute(jsObject: jsObject, name: .relList)
        _referrerPolicy = ReadWriteAttribute(jsObject: jsObject, name: .referrerPolicy)
        _noHref = ReadWriteAttribute(jsObject: jsObject, name: .noHref)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var alt: String

    @ReadWriteAttribute
    public var coords: String

    @ReadWriteAttribute
    public var shape: String

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
    public var referrerPolicy: String

    @ReadWriteAttribute
    public var noHref: Bool
}