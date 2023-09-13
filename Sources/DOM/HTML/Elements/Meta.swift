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

public class HTMLMetaElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMetaElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _httpEquiv = ReadWriteAttribute(jsObject: jsObject, name: .httpEquiv)
        _content = ReadWriteAttribute(jsObject: jsObject, name: .content)
        _media = ReadWriteAttribute(jsObject: jsObject, name: .media)
        _scheme = ReadWriteAttribute(jsObject: jsObject, name: .scheme)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var name: String

    @ReadWriteAttribute
    public var httpEquiv: String

    @ReadWriteAttribute
    public var content: String

    @ReadWriteAttribute
    public var media: String

    @ReadWriteAttribute
    public var scheme: String
}
