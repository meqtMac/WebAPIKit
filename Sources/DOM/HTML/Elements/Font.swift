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

public class HTMLFontElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFontElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _color = ReadWriteAttribute(jsObject: jsObject, name: .color)
        _face = ReadWriteAttribute(jsObject: jsObject, name: .face)
        _size = ReadWriteAttribute(jsObject: jsObject, name: .size)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var color: String

    @ReadWriteAttribute
    public var face: String

    @ReadWriteAttribute
    public var size: String
}