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


open class Node: EventTarget {
    @inlinable override open class var constructor: JSFunction? { JSObject.global[.Node].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _nodeType = ReadonlyAttribute(jsObject: jsObject, name: .nodeType)
        _nodeName = ReadonlyAttribute(jsObject: jsObject, name: .nodeName)
        _baseURI = ReadonlyAttribute(jsObject: jsObject, name: .baseURI)
        _isConnected = ReadonlyAttribute(jsObject: jsObject, name: .isConnected)
        _ownerDocument = ReadonlyAttribute(jsObject: jsObject, name: .ownerDocument)
        _parentNode = ReadonlyAttribute(jsObject: jsObject, name: .parentNode)
        _parentElement = ReadonlyAttribute(jsObject: jsObject, name: .parentElement)
        _childNodes = ReadonlyAttribute(jsObject: jsObject, name: .childNodes)
        _firstChild = ReadonlyAttribute(jsObject: jsObject, name: .firstChild)
        _lastChild = ReadonlyAttribute(jsObject: jsObject, name: .lastChild)
        _previousSibling = ReadonlyAttribute(jsObject: jsObject, name: .previousSibling)
        _nextSibling = ReadonlyAttribute(jsObject: jsObject, name: .nextSibling)
        _nodeValue = ReadWriteAttribute(jsObject: jsObject, name: .nodeValue)
        _textContent = ReadWriteAttribute(jsObject: jsObject, name: .textContent)
        super.init(unsafelyWrapping: jsObject)
    }

    public static let ELEMENT_NODE: UInt16 = 1

    public static let ATTRIBUTE_NODE: UInt16 = 2

    public static let TEXT_NODE: UInt16 = 3

    public static let CDATA_SECTION_NODE: UInt16 = 4

    public static let ENTITY_REFERENCE_NODE: UInt16 = 5

    public static let ENTITY_NODE: UInt16 = 6

    public static let PROCESSING_INSTRUCTION_NODE: UInt16 = 7

    public static let COMMENT_NODE: UInt16 = 8

    public static let DOCUMENT_NODE: UInt16 = 9

    public static let DOCUMENT_TYPE_NODE: UInt16 = 10

    public static let DOCUMENT_FRAGMENT_NODE: UInt16 = 11

    public static let NOTATION_NODE: UInt16 = 12

    @ReadonlyAttribute
    public var nodeType: UInt16

    @ReadonlyAttribute
    public var nodeName: String

    @ReadonlyAttribute
    public var baseURI: String

    @ReadonlyAttribute
    public var isConnected: Bool

    @ReadonlyAttribute
    public var ownerDocument: Document?

    @inlinable public func getRootNode(options: GetRootNodeOptions? = nil) -> Self {
        let this = jsObject
        return this[.getRootNode].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var parentNode: Node?

    @ReadonlyAttribute
    public var parentElement: Element?

    @inlinable public func hasChildNodes() -> Bool {
        let this = jsObject
        return this[.hasChildNodes].function!(this: this, arguments: []).fromJSValue()!
    }

    @ReadonlyAttribute
    public var childNodes: NodeList

    @ReadonlyAttribute
    public var firstChild: Node?

    @ReadonlyAttribute
    public var lastChild: Node?

    @ReadonlyAttribute
    public var previousSibling: Node?

    @ReadonlyAttribute
    public var nextSibling: Node?

    @ReadWriteAttribute
    public var nodeValue: String?

    @ReadWriteAttribute
    public var textContent: String?

    @inlinable public func normalize() {
        let this = jsObject
        _ = this[.normalize].function!(this: this, arguments: [])
    }

    @inlinable public func cloneNode(deep: Bool? = nil) -> Self {
        let this = jsObject
        return this[.cloneNode].function!(this: this, arguments: [_toJSValue(deep)]).fromJSValue()!
    }

    @inlinable public func isEqualNode(otherNode: Node?) -> Bool {
        let this = jsObject
        return this[.isEqualNode].function!(this: this, arguments: [_toJSValue(otherNode)]).fromJSValue()!
    }

    @inlinable public func isSameNode(otherNode: Node?) -> Bool {
        let this = jsObject
        return this[.isSameNode].function!(this: this, arguments: [_toJSValue(otherNode)]).fromJSValue()!
    }

    public static let DOCUMENT_POSITION_DISCONNECTED: UInt16 = 0x01

    public static let DOCUMENT_POSITION_PRECEDING: UInt16 = 0x02

    public static let DOCUMENT_POSITION_FOLLOWING: UInt16 = 0x04

    public static let DOCUMENT_POSITION_CONTAINS: UInt16 = 0x08

    public static let DOCUMENT_POSITION_CONTAINED_BY: UInt16 = 0x10

    public static let DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC: UInt16 = 0x20

    @inlinable public func compareDocumentPosition(other: Node) -> UInt16 {
        let this = jsObject
        return this[.compareDocumentPosition].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable public func contains(other: Node?) -> Bool {
        let this = jsObject
        return this[.contains].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }

    @inlinable public func lookupPrefix(namespace: String?) -> String? {
        let this = jsObject
        return this[.lookupPrefix].function!(this: this, arguments: [_toJSValue(namespace)]).fromJSValue()
    }

    @inlinable public func lookupNamespaceURI(prefix: String?) -> String? {
        let this = jsObject
        return this[.lookupNamespaceURI].function!(this: this, arguments: [_toJSValue(prefix)]).fromJSValue()
    }

    @inlinable public func isDefaultNamespace(namespace: String?) -> Bool {
        let this = jsObject
        return this[.isDefaultNamespace].function!(this: this, arguments: [_toJSValue(namespace)]).fromJSValue()!
    }

    @inlinable public func insertBefore(node: Node, child: Node?) -> Self {
        let this = jsObject
        return this[.insertBefore].function!(this: this, arguments: [_toJSValue(node), _toJSValue(child)]).fromJSValue()!
    }

    @inlinable public func appendChild(node: Node) {
        let this = jsObject
       _ =  this[.appendChild].function!(this: this, arguments: [_toJSValue(node)])
    }

    @inlinable public func replaceChild(node: Node, child: Node) -> Self {
        let this = jsObject
        return this[.replaceChild].function!(this: this, arguments: [_toJSValue(node), _toJSValue(child)]).fromJSValue()!
    }

    @inlinable public func removeChild(child: Node) -> Self {
        let this = jsObject
        return this[.removeChild].function!(this: this, arguments: [_toJSValue(child)]).fromJSValue()!
    }
}

public class NodeIterator: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.NodeIterator].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _root = ReadonlyAttribute(jsObject: jsObject, name: .root)
        _referenceNode = ReadonlyAttribute(jsObject: jsObject, name: .referenceNode)
        _pointerBeforeReferenceNode = ReadonlyAttribute(jsObject: jsObject, name: .pointerBeforeReferenceNode)
        _whatToShow = ReadonlyAttribute(jsObject: jsObject, name: .whatToShow)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var root: Node

    @ReadonlyAttribute
    public var referenceNode: Node

    @ReadonlyAttribute
    public var pointerBeforeReferenceNode: Bool

    @ReadonlyAttribute
    public var whatToShow: UInt32

    // XXX: member 'filter' is ignored

    @inlinable public func nextNode() -> Node? {
        let this = jsObject
        return this[.nextNode].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable public func previousNode() -> Node? {
        let this = jsObject
        return this[.previousNode].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable public func detach() {
        let this = jsObject
        _ = this[.detach].function!(this: this, arguments: [])
    }
}

public class NodeList: JSBridgedClass, Sequence {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.NodeList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @inlinable public subscript(key: Int) -> Node? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> Node? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }

    @ReadonlyAttribute
    public var length: UInt32

    public typealias Element = Node
    public func makeIterator() -> ValueIterableIterator<NodeList> {
        ValueIterableIterator(sequence: self)
    }
}

public protocol ChildNode: JSBridgedClass {}
public extension ChildNode {
    @inlinable func before(nodes: Node...) {
        _ = jsObject[.before].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }
    
    @inlinable func after(nodes: Node...) {
        _ = jsObject[.after].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }
    
    @inlinable func replaceWith(nodes: Node...) {
        _ = jsObject[.replaceWith].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }
    @inlinable func before(nodes: String...) {
        _ = jsObject[.before].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }
    
    @inlinable func after(nodes: String...) {
        _ = jsObject[.after].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }
    
    @inlinable func replaceWith(nodes: String...) {
        _ = jsObject[.replaceWith].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }
 
    
    @inlinable func remove() {
        _ = jsObject[.remove].function!(this: jsObject, arguments: [])
    }
}

public protocol ParentNode: JSBridgedClass {}
public extension ParentNode {
    @inlinable var children: HTMLCollection { jsObject[.children].fromJSValue()! }

    @inlinable var firstElementChild: Element? { jsObject[.firstElementChild].fromJSValue() }

    @inlinable var lastElementChild: Element? { jsObject[.lastElementChild].fromJSValue() }

    @inlinable var childElementCount: UInt32 { jsObject[.childElementCount].fromJSValue()! }

    @inlinable func prepend(nodes: Node...) {
        _ = jsObject[.prepend].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }

    @inlinable func append(nodes: Node...) {
        _ = jsObject[.append].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }

    @inlinable func replaceChildren(nodes: Node...) {
        _ = jsObject[.replaceChildren].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }
    @inlinable func prepend(nodes: String...) {
        _ = jsObject[.prepend].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }

    @inlinable func append(nodes: String...) {
        _ = jsObject[.append].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }

    @inlinable func replaceChildren(nodes: String...) {
        _ = jsObject[.replaceChildren].function!(this: jsObject, arguments: nodes.map(_toJSValue))
    }


    @inlinable func querySelector(selectors: String) -> Element? {
        let this = jsObject
        return this[.querySelector].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()
    }

    @inlinable func querySelectorAll(selectors: String) -> NodeList {
        let this = jsObject
        return this[.querySelectorAll].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()!
    }
}
public protocol NonDocumentTypeChildNode: JSBridgedClass {}
public extension NonDocumentTypeChildNode {
    @inlinable var previousElementSibling: Element? { jsObject[.previousElementSibling].fromJSValue() }

    @inlinable var nextElementSibling: Element? { jsObject[.nextElementSibling].fromJSValue() }
}

public protocol NonElementParentNode: JSBridgedClass {}
public extension NonElementParentNode {
    @inlinable func getElementById(elementId: String) -> Element? {
        let this = jsObject
        return this[.getElementById].function!(this: this, arguments: [_toJSValue(elementId)]).fromJSValue()
    }
}
