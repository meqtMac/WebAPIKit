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

public class HTMLMarqueeElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMarqueeElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _behavior = ReadWriteAttribute(jsObject: jsObject, name: .behavior)
        _bgColor = ReadWriteAttribute(jsObject: jsObject, name: .bgColor)
        _direction = ReadWriteAttribute(jsObject: jsObject, name: .direction)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _hspace = ReadWriteAttribute(jsObject: jsObject, name: .hspace)
        _loop = ReadWriteAttribute(jsObject: jsObject, name: .loop)
        _scrollAmount = ReadWriteAttribute(jsObject: jsObject, name: .scrollAmount)
        _scrollDelay = ReadWriteAttribute(jsObject: jsObject, name: .scrollDelay)
        _trueSpeed = ReadWriteAttribute(jsObject: jsObject, name: .trueSpeed)
        _vspace = ReadWriteAttribute(jsObject: jsObject, name: .vspace)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var behavior: String

    @ReadWriteAttribute
    public var bgColor: String

    @ReadWriteAttribute
    public var direction: String

    @ReadWriteAttribute
    public var height: String

    @ReadWriteAttribute
    public var hspace: UInt32

    @ReadWriteAttribute
    public var loop: Int32

    @ReadWriteAttribute
    public var scrollAmount: UInt32

    @ReadWriteAttribute
    public var scrollDelay: UInt32

    @ReadWriteAttribute
    public var trueSpeed: Bool

    @ReadWriteAttribute
    public var vspace: UInt32

    @ReadWriteAttribute
    public var width: String

    @inlinable public func start() {
        let this = jsObject
        _ = this[.start].function!(this: this, arguments: [])
    }

    @inlinable public func stop() {
        let this = jsObject
        _ = this[.stop].function!(this: this, arguments: [])
    }
}