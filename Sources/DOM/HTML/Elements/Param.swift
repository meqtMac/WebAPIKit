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

public class HTMLParamElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLParamElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _value = ReadWriteAttribute(jsObject: jsObject, name: .value)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        _valueType = ReadWriteAttribute(jsObject: jsObject, name: .valueType)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var value: String

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var valueType: String
}