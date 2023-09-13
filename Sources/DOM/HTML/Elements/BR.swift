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

public class HTMLBRElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLBRElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _clear = ReadWriteAttribute(jsObject: jsObject, name: .clear)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var clear: String
}