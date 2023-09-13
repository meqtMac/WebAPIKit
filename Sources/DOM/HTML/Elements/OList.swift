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

public class HTMLOListElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOListElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _reversed = ReadWriteAttribute(jsObject: jsObject, name: .reversed)
        _start = ReadWriteAttribute(jsObject: jsObject, name: .start)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _compact = ReadWriteAttribute(jsObject: jsObject, name: .compact)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var reversed: Bool

    @ReadWriteAttribute
    public var start: Int32

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var compact: Bool
}
