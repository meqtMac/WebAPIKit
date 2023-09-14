//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class HTMLUListElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLUListElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _compact = ReadWriteAttribute(jsObject: jsObject, name: .compact)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var compact: Bool

    @ReadWriteAttribute
    public var type: String
}
