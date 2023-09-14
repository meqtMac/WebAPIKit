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

public class HTMLBodyElement: HTMLElement, WindowEventHandlers {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLBodyElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _text = ReadWriteAttribute(jsObject: jsObject, name: .text)
        _link = ReadWriteAttribute(jsObject: jsObject, name: .link)
        _vLink = ReadWriteAttribute(jsObject: jsObject, name: .vLink)
        _aLink = ReadWriteAttribute(jsObject: jsObject, name: .aLink)
        _bgColor = ReadWriteAttribute(jsObject: jsObject, name: .bgColor)
        _background = ReadWriteAttribute(jsObject: jsObject, name: .background)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var text: String

    @ReadWriteAttribute
    public var link: String

    @ReadWriteAttribute
    public var vLink: String

    @ReadWriteAttribute
    public var aLink: String

    @ReadWriteAttribute
    public var bgColor: String

    @ReadWriteAttribute
    public var background: String
}