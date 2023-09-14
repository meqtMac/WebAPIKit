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

public class MutationEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MutationEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _relatedNode = ReadonlyAttribute(jsObject: jsObject, name: .relatedNode)
        _prevValue = ReadonlyAttribute(jsObject: jsObject, name: .prevValue)
        _newValue = ReadonlyAttribute(jsObject: jsObject, name: .newValue)
        _attrName = ReadonlyAttribute(jsObject: jsObject, name: .attrName)
        _attrChange = ReadonlyAttribute(jsObject: jsObject, name: .attrChange)
        super.init(unsafelyWrapping: jsObject)
    }

    public static let MODIFICATION: UInt16 = 1

    public static let ADDITION: UInt16 = 2

    public static let REMOVAL: UInt16 = 3

    @ReadonlyAttribute
    public var relatedNode: Node?

    @ReadonlyAttribute
    public var prevValue: String

    @ReadonlyAttribute
    public var newValue: String

    @ReadonlyAttribute
    public var attrName: String

    @ReadonlyAttribute
    public var attrChange: UInt16

    @inlinable public func initMutationEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, relatedNodeArg: Node? = nil, prevValueArg: String? = nil, newValueArg: String? = nil, attrNameArg: String? = nil, attrChangeArg: UInt16? = nil) {
        let this = jsObject
        _ = this[.initMutationEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(relatedNodeArg), _toJSValue(prevValueArg), _toJSValue(newValueArg), _toJSValue(attrNameArg), _toJSValue(attrChangeArg)])
    }
}

public class MutationObserver: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MutationObserver].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init(callback: @escaping MutationCallback) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(callback)]))
    }

    @inlinable public func observe(target: Node, options: MutationObserverInit? = nil) {
        let this = jsObject
        _ = this[.observe].function!(this: this, arguments: [_toJSValue(target), _toJSValue(options)])
    }

    @inlinable public func disconnect() {
        let this = jsObject
        _ = this[.disconnect].function!(this: this, arguments: [])
    }

    @inlinable public func takeRecords() -> [MutationRecord] {
        let this = jsObject
        return this[.takeRecords].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class MutationObserverInit: BridgedDictionary {
    public convenience init(childList: Bool, attributes: Bool, characterData: Bool, subtree: Bool, attributeOldValue: Bool, characterDataOldValue: Bool, attributeFilter: [String]) {
        let object = JSObject.global[.Object].function!.new()
        object[.childList] = _toJSValue(childList)
        object[.attributes] = _toJSValue(attributes)
        object[.characterData] = _toJSValue(characterData)
        object[.subtree] = _toJSValue(subtree)
        object[.attributeOldValue] = _toJSValue(attributeOldValue)
        object[.characterDataOldValue] = _toJSValue(characterDataOldValue)
        object[.attributeFilter] = _toJSValue(attributeFilter)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _childList = ReadWriteAttribute(jsObject: object, name: .childList)
        _attributes = ReadWriteAttribute(jsObject: object, name: .attributes)
        _characterData = ReadWriteAttribute(jsObject: object, name: .characterData)
        _subtree = ReadWriteAttribute(jsObject: object, name: .subtree)
        _attributeOldValue = ReadWriteAttribute(jsObject: object, name: .attributeOldValue)
        _characterDataOldValue = ReadWriteAttribute(jsObject: object, name: .characterDataOldValue)
        _attributeFilter = ReadWriteAttribute(jsObject: object, name: .attributeFilter)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var childList: Bool

    @ReadWriteAttribute
    public var attributes: Bool

    @ReadWriteAttribute
    public var characterData: Bool

    @ReadWriteAttribute
    public var subtree: Bool

    @ReadWriteAttribute
    public var attributeOldValue: Bool

    @ReadWriteAttribute
    public var characterDataOldValue: Bool

    @ReadWriteAttribute
    public var attributeFilter: [String]
}

public class MutationRecord: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MutationRecord].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _target = ReadonlyAttribute(jsObject: jsObject, name: .target)
        _addedNodes = ReadonlyAttribute(jsObject: jsObject, name: .addedNodes)
        _removedNodes = ReadonlyAttribute(jsObject: jsObject, name: .removedNodes)
        _previousSibling = ReadonlyAttribute(jsObject: jsObject, name: .previousSibling)
        _nextSibling = ReadonlyAttribute(jsObject: jsObject, name: .nextSibling)
        _attributeName = ReadonlyAttribute(jsObject: jsObject, name: .attributeName)
        _attributeNamespace = ReadonlyAttribute(jsObject: jsObject, name: .attributeNamespace)
        _oldValue = ReadonlyAttribute(jsObject: jsObject, name: .oldValue)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var type: String

    @ReadonlyAttribute
    public var target: Node

    @ReadonlyAttribute
    public var addedNodes: NodeList

    @ReadonlyAttribute
    public var removedNodes: NodeList

    @ReadonlyAttribute
    public var previousSibling: Node?

    @ReadonlyAttribute
    public var nextSibling: Node?

    @ReadonlyAttribute
    public var attributeName: String?

    @ReadonlyAttribute
    public var attributeNamespace: String?

    @ReadonlyAttribute
    public var oldValue: String?
}


