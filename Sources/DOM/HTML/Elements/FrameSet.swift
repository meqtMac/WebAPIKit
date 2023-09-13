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

public class HTMLFrameSetElement: HTMLElement, WindowEventHandlers {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFrameSetElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _cols = ReadWriteAttribute(jsObject: jsObject, name: .cols)
        _rows = ReadWriteAttribute(jsObject: jsObject, name: .rows)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var cols: String

    @ReadWriteAttribute
    public var rows: String
}