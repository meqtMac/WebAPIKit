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


public class HTMLQuoteElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLQuoteElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _cite = ReadWriteAttribute(jsObject: jsObject, name: .cite)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var cite: String
}