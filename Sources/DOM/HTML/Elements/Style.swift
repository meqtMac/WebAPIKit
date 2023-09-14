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

public class HTMLStyleElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLStyleElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _disabled = ReadWriteAttribute(jsObject: jsObject, name: .disabled)
        _media = ReadWriteAttribute(jsObject: jsObject, name: .media)
        _blocking = ReadonlyAttribute(jsObject: jsObject, name: .blocking)
        _type = ReadWriteAttribute(jsObject: jsObject, name: .type)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var disabled: Bool

    @ReadWriteAttribute
    public var media: String

    @ReadonlyAttribute
    public var blocking: DOMTokenList

    @ReadWriteAttribute
    public var type: String
}

