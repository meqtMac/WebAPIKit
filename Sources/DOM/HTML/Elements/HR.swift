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

public class HTMLHRElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLHRElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _color = ReadWriteAttribute(jsObject: jsObject, name: .color)
        _noShade = ReadWriteAttribute(jsObject: jsObject, name: .noShade)
        _size = ReadWriteAttribute(jsObject: jsObject, name: .size)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var color: String

    @ReadWriteAttribute
    public var noShade: Bool

    @ReadWriteAttribute
    public var size: String

    @ReadWriteAttribute
    public var width: String
}