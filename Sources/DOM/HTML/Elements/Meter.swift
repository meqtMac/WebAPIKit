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

public class HTMLMeterElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMeterElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _value = ReadWriteAttribute(jsObject: jsObject, name: .value)
        _min = ReadWriteAttribute(jsObject: jsObject, name: .min)
        _max = ReadWriteAttribute(jsObject: jsObject, name: .max)
        _low = ReadWriteAttribute(jsObject: jsObject, name: .low)
        _high = ReadWriteAttribute(jsObject: jsObject, name: .high)
        _optimum = ReadWriteAttribute(jsObject: jsObject, name: .optimum)
        _labels = ReadonlyAttribute(jsObject: jsObject, name: .labels)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var value: Double

    @ReadWriteAttribute
    public var min: Double

    @ReadWriteAttribute
    public var max: Double

    @ReadWriteAttribute
    public var low: Double

    @ReadWriteAttribute
    public var high: Double

    @ReadWriteAttribute
    public var optimum: Double

    @ReadonlyAttribute
    public var labels: NodeList
}