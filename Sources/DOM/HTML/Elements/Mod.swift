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

public class HTMLModElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLModElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _cite = ReadWriteAttribute(jsObject: jsObject, name: .cite)
        _dateTime = ReadWriteAttribute(jsObject: jsObject, name: .dateTime)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var cite: String

    @ReadWriteAttribute
    public var dateTime: String
}
