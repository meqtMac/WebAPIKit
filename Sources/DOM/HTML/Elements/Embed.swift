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

public class HTMLEmbedElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLEmbedElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var src: String

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var width: String

    @ReadWriteAttribute
    public var height: String

    @inlinable public func getSVGDocument() -> Document? {
        let this = jsObject
        return this[.getSVGDocument].function!(this: this, arguments: []).fromJSValue()
    }

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var name: String
}