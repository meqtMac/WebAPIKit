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


public class HTMLBaseElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLBaseElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _href = ReadWriteAttribute(jsObject: jsObject, name: .href)
        _target = ReadWriteAttribute(jsObject: jsObject, name: .target)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var href: String

    @ReadWriteAttribute
    public var target: String
}