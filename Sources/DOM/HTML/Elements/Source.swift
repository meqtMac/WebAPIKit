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

public class HTMLSourceElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLSourceElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _srcset = ReadWriteAttribute(jsObject: jsObject, name: .srcset)
        _sizes = ReadWriteAttribute(jsObject: jsObject, name: .sizes)
        _media = ReadWriteAttribute(jsObject: jsObject, name: .media)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
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
    public var srcset: String

    @ReadWriteAttribute
    public var sizes: String

    @ReadWriteAttribute
    public var media: String

    @ReadWriteAttribute
    public var width: UInt32

    @ReadWriteAttribute
    public var height: UInt32
}
