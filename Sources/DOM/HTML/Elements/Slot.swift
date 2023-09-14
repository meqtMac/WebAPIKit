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

public class HTMLSlotElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLSlotElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var name: String

    @inlinable public func assignedNodes(options: AssignedNodesOptions? = nil) -> [Node] {
        let this = jsObject
        return this[.assignedNodes].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func assignedElements(options: AssignedNodesOptions? = nil) -> [Element] {
        let this = jsObject
        return this[.assignedElements].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func assign(nodes: Element...) {
        let this = jsObject
        _ = this[.assign].function!(this: this, arguments: nodes.map(_toJSValue))
    }
     @inlinable public func assign(nodes: Text...) {
        let this = jsObject
        _ = this[.assign].function!(this: this, arguments: nodes.map(_toJSValue))
    }
    
}
