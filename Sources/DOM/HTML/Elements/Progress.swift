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

public class HTMLProgressElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLProgressElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _value = ReadWriteAttribute(jsObject: jsObject, name: .value)
        _max = ReadWriteAttribute(jsObject: jsObject, name: .max)
        _position = ReadonlyAttribute(jsObject: jsObject, name: .position)
        _labels = ReadonlyAttribute(jsObject: jsObject, name: .labels)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var value: Double

    @ReadWriteAttribute
    public var max: Double

    @ReadonlyAttribute
    public var position: Double

    @ReadonlyAttribute
    public var labels: NodeList
}