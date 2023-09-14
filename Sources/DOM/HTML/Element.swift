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


open class Element: Node,
                        ParentNode,
                        NonDocumentTypeChildNode,
                        ChildNode,
                        Slottable,
                        ARIAMixin,
                        GeometryUtils {
    @inlinable override open class var constructor: JSFunction? { JSObject.global[.Element].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _namespaceURI = ReadonlyAttribute(jsObject: jsObject, name: .namespaceURI)
        _prefix = ReadonlyAttribute(jsObject: jsObject, name: .prefix)
        _localName = ReadonlyAttribute(jsObject: jsObject, name: .localName)
        _tagName = ReadonlyAttribute(jsObject: jsObject, name: .tagName)
        _id = ReadWriteAttribute(jsObject: jsObject, name: .id)
        _className = ReadWriteAttribute(jsObject: jsObject, name: .className)
        _classList = ReadonlyAttribute(jsObject: jsObject, name: .classList)
        _slot = ReadWriteAttribute(jsObject: jsObject, name: .slot)
        _attributes = ReadonlyAttribute(jsObject: jsObject, name: .attributes)
        _shadowRoot = ReadonlyAttribute(jsObject: jsObject, name: .shadowRoot)
        _scrollTop = ReadWriteAttribute(jsObject: jsObject, name: .scrollTop)
        _scrollLeft = ReadWriteAttribute(jsObject: jsObject, name: .scrollLeft)
        _scrollWidth = ReadonlyAttribute(jsObject: jsObject, name: .scrollWidth)
        _scrollHeight = ReadonlyAttribute(jsObject: jsObject, name: .scrollHeight)
        _clientTop = ReadonlyAttribute(jsObject: jsObject, name: .clientTop)
        _clientLeft = ReadonlyAttribute(jsObject: jsObject, name: .clientLeft)
        _clientWidth = ReadonlyAttribute(jsObject: jsObject, name: .clientWidth)
        _clientHeight = ReadonlyAttribute(jsObject: jsObject, name: .clientHeight)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var namespaceURI: String?

    @ReadonlyAttribute
    public var prefix: String?

    @ReadonlyAttribute
    public var localName: String

    @ReadonlyAttribute
    public var tagName: String

    @ReadWriteAttribute
    public var id: String

    @ReadWriteAttribute
    public var className: String

    @ReadonlyAttribute
    public var classList: DOMTokenList

    @ReadWriteAttribute
    public var slot: String

    @inlinable public func hasAttributes() -> Bool {
        let this = jsObject
        return this[.hasAttributes].function!(this: this, arguments: []).fromJSValue()!
    }

    @ReadonlyAttribute
    public var attributes: NamedNodeMap

    @inlinable public func getAttributeNames() -> [String] {
        let this = jsObject
        return this[.getAttributeNames].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getAttribute(qualifiedName: String) -> String? {
        let this = jsObject
        return this[.getAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()
    }

    @inlinable public func getAttributeNS(namespace: String?, localName: String) -> String? {
        let this = jsObject
        return this[.getAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()
    }

    @inlinable public func setAttribute(qualifiedName: String, value: String) {
        let this = jsObject
        _ = this[.setAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName), _toJSValue(value)])
    }

    @inlinable public func setAttributeNS(namespace: String?, qualifiedName: String, value: String) {
        let this = jsObject
        _ = this[.setAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName), _toJSValue(value)])
    }

    @inlinable public func removeAttribute(qualifiedName: String) {
        let this = jsObject
        _ = this[.removeAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName)])
    }

    @inlinable public func removeAttributeNS(namespace: String?, localName: String) {
        let this = jsObject
        _ = this[.removeAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)])
    }

    @inlinable public func toggleAttribute(qualifiedName: String, force: Bool? = nil) -> Bool {
        let this = jsObject
        return this[.toggleAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName), _toJSValue(force)]).fromJSValue()!
    }

    @inlinable public func hasAttribute(qualifiedName: String) -> Bool {
        let this = jsObject
        return this[.hasAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()!
    }

    @inlinable public func hasAttributeNS(namespace: String?, localName: String) -> Bool {
        let this = jsObject
        return this[.hasAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()!
    }

    @inlinable public func getAttributeNode(qualifiedName: String) -> Attr? {
        let this = jsObject
        return this[.getAttributeNode].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()
    }

    @inlinable public func getAttributeNodeNS(namespace: String?, localName: String) -> Attr? {
        let this = jsObject
        return this[.getAttributeNodeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()
    }

    @inlinable public func setAttributeNode(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setAttributeNode].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func setAttributeNodeNS(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setAttributeNodeNS].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func removeAttributeNode(attr: Attr) -> Attr {
        let this = jsObject
        return this[.removeAttributeNode].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()!
    }

    @inlinable public func attachShadow(init: ShadowRootInit) -> ShadowRoot {
        let this = jsObject
        return this[.attachShadow].function!(this: this, arguments: [_toJSValue(`init`)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var shadowRoot: ShadowRoot?

    @inlinable public func closest(selectors: String) -> Element? {
        let this = jsObject
        return this[.closest].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()
    }

    @inlinable public func matches(selectors: String) -> Bool {
        let this = jsObject
        return this[.matches].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()!
    }

    @inlinable public func webkitMatchesSelector(selectors: String) -> Bool {
        let this = jsObject
        return this[.webkitMatchesSelector].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()!
    }

    @inlinable public func getElementsByTagName(qualifiedName: String) -> HTMLCollection {
        let this = jsObject
        return this[.getElementsByTagName].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()!
    }

    @inlinable public func getElementsByTagNameNS(namespace: String?, localName: String) -> HTMLCollection {
        let this = jsObject
        return this[.getElementsByTagNameNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()!
    }

    @inlinable public func getElementsByClassName(classNames: String) -> HTMLCollection {
        let this = jsObject
        return this[.getElementsByClassName].function!(this: this, arguments: [_toJSValue(classNames)]).fromJSValue()!
    }

    @inlinable public func insertAdjacentElement(where: String, element: Element) -> Element? {
        let this = jsObject
        return this[.insertAdjacentElement].function!(this: this, arguments: [_toJSValue(`where`), _toJSValue(element)]).fromJSValue()
    }

    @inlinable public func insertAdjacentText(where: String, data: String) {
        let this = jsObject
        _ = this[.insertAdjacentText].function!(this: this, arguments: [_toJSValue(`where`), _toJSValue(data)])
    }

    @inlinable public func pseudo(type: String) -> CSSPseudoElement? {
        let this = jsObject
        return this[.pseudo].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()
    }

    @inlinable public func getClientRects() -> DOMRectList {
        let this = jsObject
        return this[.getClientRects].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getBoundingClientRect() -> DOMRect {
        let this = jsObject
        return this[.getBoundingClientRect].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func checkVisibility(options: CheckVisibilityOptions? = nil) -> Bool {
        let this = jsObject
        return this[.checkVisibility].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func scrollIntoView(arg: Bool) {
        let this = jsObject
        _ = this[.scrollIntoView].function!(this: this, arguments: [_toJSValue(arg)])
    }
    
        @inlinable public func scrollIntoView(arg: ScrollIntoViewOptions? = nil) {
        let this = jsObject
        _ = this[.scrollIntoView].function!(this: this, arguments: [_toJSValue(arg)])
    }



    @inlinable public func scroll(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scroll(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func scrollTo(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scrollTo].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scrollTo(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scrollTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func scrollBy(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scrollBy].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scrollBy(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scrollBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @ReadWriteAttribute
    public var scrollTop: Double

    @ReadWriteAttribute
    public var scrollLeft: Double

    @ReadonlyAttribute
    public var scrollWidth: Int32

    @ReadonlyAttribute
    public var scrollHeight: Int32

    @ReadonlyAttribute
    public var clientTop: Int32

    @ReadonlyAttribute
    public var clientLeft: Int32

    @ReadonlyAttribute
    public var clientWidth: Int32

    @ReadonlyAttribute
    public var clientHeight: Int32
}

public class NamedNodeMap: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.NamedNodeMap].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> Attr? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> Attr? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }

    @inlinable public subscript(key: String) -> Attr? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func getNamedItem(qualifiedName: String) -> Attr? {
        let this = jsObject
        return this[.getNamedItem].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()
    }

    @inlinable public func getNamedItemNS(namespace: String?, localName: String) -> Attr? {
        let this = jsObject
        return this[.getNamedItemNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()
    }

    @inlinable public func setNamedItem(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setNamedItem].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func setNamedItemNS(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setNamedItemNS].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func removeNamedItem(qualifiedName: String) -> Attr {
        let this = jsObject
        return this[.removeNamedItem].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()!
    }

    @inlinable public func removeNamedItemNS(namespace: String?, localName: String) -> Attr {
        let this = jsObject
        return this[.removeNamedItemNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()!
    }
}

