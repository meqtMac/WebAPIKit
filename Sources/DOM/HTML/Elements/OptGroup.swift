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

public class HTMLOptGroupElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOptGroupElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _label = ReadWriteAttribute(jsObject: jsObject, name: .label)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var disabled: Bool

    @ReadWriteAttribute
    public var label: String
}