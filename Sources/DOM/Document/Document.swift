//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class Document: Node, 
                        NonElementParentNode,
                        DocumentOrShadowRoot,
                        ParentNode,
                        XPathEvaluatorBase,
                        GlobalEventHandlers,
                        GeometryUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Document].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _implementation = ReadonlyAttribute(jsObject: jsObject, name: .implementation)
        _URL = ReadonlyAttribute(jsObject: jsObject, name: .URL)
        _documentURI = ReadonlyAttribute(jsObject: jsObject, name: .documentURI)
        _compatMode = ReadonlyAttribute(jsObject: jsObject, name: .compatMode)
        _characterSet = ReadonlyAttribute(jsObject: jsObject, name: .characterSet)
        _charset = ReadonlyAttribute(jsObject: jsObject, name: .charset)
        _inputEncoding = ReadonlyAttribute(jsObject: jsObject, name: .inputEncoding)
        _contentType = ReadonlyAttribute(jsObject: jsObject, name: .contentType)
        _doctype = ReadonlyAttribute(jsObject: jsObject, name: .doctype)
        _documentElement = ReadonlyAttribute(jsObject: jsObject, name: .documentElement)
        _location = ReadonlyAttribute(jsObject: jsObject, name: .location)
        _domain = ReadWriteAttribute(jsObject: jsObject, name: .domain)
        _referrer = ReadonlyAttribute(jsObject: jsObject, name: .referrer)
        _cookie = ReadWriteAttribute(jsObject: jsObject, name: .cookie)
        _lastModified = ReadonlyAttribute(jsObject: jsObject, name: .lastModified)
        _readyState = ReadonlyAttribute(jsObject: jsObject, name: .readyState)
        _title = ReadWriteAttribute(jsObject: jsObject, name: .title)
        _dir = ReadWriteAttribute(jsObject: jsObject, name: .dir)
        _body = ReadWriteAttribute(jsObject: jsObject, name: .body)
        _head = ReadonlyAttribute(jsObject: jsObject, name: .head)
        _images = ReadonlyAttribute(jsObject: jsObject, name: .images)
        _embeds = ReadonlyAttribute(jsObject: jsObject, name: .embeds)
        _plugins = ReadonlyAttribute(jsObject: jsObject, name: .plugins)
        _links = ReadonlyAttribute(jsObject: jsObject, name: .links)
        _forms = ReadonlyAttribute(jsObject: jsObject, name: .forms)
        _scripts = ReadonlyAttribute(jsObject: jsObject, name: .scripts)
        _currentScript = ReadonlyAttribute(jsObject: jsObject, name: .currentScript)
        _defaultView = ReadonlyAttribute(jsObject: jsObject, name: .defaultView)
        _designMode = ReadWriteAttribute(jsObject: jsObject, name: .designMode)
        _hidden = ReadonlyAttribute(jsObject: jsObject, name: .hidden)
        _visibilityState = ReadonlyAttribute(jsObject: jsObject, name: .visibilityState)
        _onreadystatechange = ClosureAttribute1Optional(jsObject: jsObject, name: .onreadystatechange)
        _onvisibilitychange = ClosureAttribute1Optional(jsObject: jsObject, name: .onvisibilitychange)
        _fgColor = ReadWriteAttribute(jsObject: jsObject, name: .fgColor)
        _linkColor = ReadWriteAttribute(jsObject: jsObject, name: .linkColor)
        _vlinkColor = ReadWriteAttribute(jsObject: jsObject, name: .vlinkColor)
        _alinkColor = ReadWriteAttribute(jsObject: jsObject, name: .alinkColor)
        _bgColor = ReadWriteAttribute(jsObject: jsObject, name: .bgColor)
        _anchors = ReadonlyAttribute(jsObject: jsObject, name: .anchors)
        _applets = ReadonlyAttribute(jsObject: jsObject, name: .applets)
        _all = ReadonlyAttribute(jsObject: jsObject, name: .all)
        _scrollingElement = ReadonlyAttribute(jsObject: jsObject, name: .scrollingElement)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadonlyAttribute
    public var implementation: DOMImplementation

    @ReadonlyAttribute
    public var URL: String

    @ReadonlyAttribute
    public var documentURI: String

    @ReadonlyAttribute
    public var compatMode: String

    @ReadonlyAttribute
    public var characterSet: String

    @ReadonlyAttribute
    public var charset: String

    @ReadonlyAttribute
    public var inputEncoding: String

    @ReadonlyAttribute
    public var contentType: String

    @ReadonlyAttribute
    public var doctype: DocumentType?

    @ReadonlyAttribute
    public var documentElement: Element?

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

    @inlinable public func createElement(localName: String, options: ElementCreationOptions_or_String? = nil) -> Element {
        let this = jsObject
        return this[.createElement].function!(this: this, arguments: [_toJSValue(localName), _toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func createElementNS(namespace: String?, qualifiedName: String, options: ElementCreationOptions_or_String? = nil) -> Element {
        let this = jsObject
        return this[.createElementNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName), _toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func createDocumentFragment() -> DocumentFragment {
        let this = jsObject
        return this[.createDocumentFragment].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func createTextNode(data: String) -> Text {
        let this = jsObject
        return this[.createTextNode].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }

    @inlinable public func createCDATASection(data: String) -> CDATASection {
        let this = jsObject
        return this[.createCDATASection].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }

    @inlinable public func createComment(data: String) -> Comment {
        let this = jsObject
        return this[.createComment].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }

    @inlinable public func createProcessingInstruction(target: String, data: String) -> ProcessingInstruction {
        let this = jsObject
        return this[.createProcessingInstruction].function!(this: this, arguments: [_toJSValue(target), _toJSValue(data)]).fromJSValue()!
    }

    @inlinable public func importNode(node: Node, deep: Bool? = nil) -> Node {
        let this = jsObject
        return this[.importNode].function!(this: this, arguments: [_toJSValue(node), _toJSValue(deep)]).fromJSValue()!
    }

    @inlinable public func adoptNode(node: Node) -> Node {
        let this = jsObject
        return this[.adoptNode].function!(this: this, arguments: [_toJSValue(node)]).fromJSValue()!
    }

    @inlinable public func createAttribute(localName: String) -> Attr {
        let this = jsObject
        return this[.createAttribute].function!(this: this, arguments: [_toJSValue(localName)]).fromJSValue()!
    }

    @inlinable public func createAttributeNS(namespace: String?, qualifiedName: String) -> Attr {
        let this = jsObject
        return this[.createAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName)]).fromJSValue()!
    }

    @inlinable public func createEvent(interface: String) -> Event {
        let this = jsObject
        return this[.createEvent].function!(this: this, arguments: [_toJSValue(interface)]).fromJSValue()!
    }

    @inlinable public func createRange() -> Range {
        let this = jsObject
        return this[.createRange].function!(this: this, arguments: []).fromJSValue()!
    }

    // XXX: member 'createNodeIterator' is ignored

    // XXX: member 'createTreeWalker' is ignored

    @ReadonlyAttribute
    public var location: Location?

    @ReadWriteAttribute
    public var domain: String

    @ReadonlyAttribute
    public var referrer: String

    @ReadWriteAttribute
    public var cookie: String

    @ReadonlyAttribute
    public var lastModified: String

    @ReadonlyAttribute
    public var readyState: DocumentReadyState

    @inlinable public subscript(key: String) -> JSObject {
        jsObject[key].fromJSValue()!
    }

    @ReadWriteAttribute
    public var title: String

    @ReadWriteAttribute
    public var dir: String

    @ReadWriteAttribute
    public var body: HTMLElement?

    @ReadonlyAttribute
    public var head: HTMLHeadElement?

    @ReadonlyAttribute
    public var images: HTMLCollection

    @ReadonlyAttribute
    public var embeds: HTMLCollection

    @ReadonlyAttribute
    public var plugins: HTMLCollection

    @ReadonlyAttribute
    public var links: HTMLCollection

    @ReadonlyAttribute
    public var forms: HTMLCollection

    @ReadonlyAttribute
    public var scripts: HTMLCollection

    @inlinable public func getElementsByName(elementName: String) -> NodeList {
        let this = jsObject
        return this[.getElementsByName].function!(this: this, arguments: [_toJSValue(elementName)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var currentScript: HTMLOrSVGScriptElement?

    @inlinable public func open(unused1: String? = nil, unused2: String? = nil) -> Self {
        let this = jsObject
        return this[.open].function!(this: this, arguments: [_toJSValue(unused1), _toJSValue(unused2)]).fromJSValue()!
    }

    @inlinable public func open(url: String, name: String, features: String) -> WindowProxy? {
        let this = jsObject
        return this[.open].function!(this: this, arguments: [_toJSValue(url), _toJSValue(name), _toJSValue(features)]).fromJSValue()
    }

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }

    @inlinable public func write(text: String...) {
        let this = jsObject
        _ = this[.write].function!(this: this, arguments: text.map(_toJSValue))
    }

    @inlinable public func writeln(text: String...) {
        let this = jsObject
        _ = this[.writeln].function!(this: this, arguments: text.map(_toJSValue))
    }

    @ReadonlyAttribute
    public var defaultView: WindowProxy?

    @inlinable public func hasFocus() -> Bool {
        let this = jsObject
        return this[.hasFocus].function!(this: this, arguments: []).fromJSValue()!
    }

    @ReadWriteAttribute
    public var designMode: String

    @inlinable public func execCommand(commandId: String, showUI: Bool? = nil, value: String? = nil) -> Bool {
        let this = jsObject
        return this[.execCommand].function!(this: this, arguments: [_toJSValue(commandId), _toJSValue(showUI), _toJSValue(value)]).fromJSValue()!
    }

    @inlinable public func queryCommandEnabled(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandEnabled].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }

    @inlinable public func queryCommandIndeterm(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandIndeterm].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }

    @inlinable public func queryCommandState(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandState].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }

    @inlinable public func queryCommandSupported(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandSupported].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }

    @inlinable public func queryCommandValue(commandId: String) -> String {
        let this = jsObject
        return this[.queryCommandValue].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var hidden: Bool

    @ReadonlyAttribute
    public var visibilityState: DocumentVisibilityState

    @ClosureAttribute1Optional
    public var onreadystatechange: EventHandler

    @ClosureAttribute1Optional
    public var onvisibilitychange: EventHandler

    @ReadWriteAttribute
    public var fgColor: String

    @ReadWriteAttribute
    public var linkColor: String

    @ReadWriteAttribute
    public var vlinkColor: String

    @ReadWriteAttribute
    public var alinkColor: String

    @ReadWriteAttribute
    public var bgColor: String

    @ReadonlyAttribute
    public var anchors: HTMLCollection

    @ReadonlyAttribute
    public var applets: HTMLCollection

    @inlinable public func clear() {
        let this = jsObject
        _ = this[.clear].function!(this: this, arguments: [])
    }

    @inlinable public func captureEvents() {
        let this = jsObject
        _ = this[.captureEvents].function!(this: this, arguments: [])
    }

    @inlinable public func releaseEvents() {
        let this = jsObject
        _ = this[.releaseEvents].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var all: HTMLAllCollection

    @inlinable public func elementFromPoint(x: Double, y: Double) -> Element? {
        let this = jsObject
        return this[.elementFromPoint].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()
    }

    @inlinable public func elementsFromPoint(x: Double, y: Double) -> [Element] {
        let this = jsObject
        return this[.elementsFromPoint].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }

    @inlinable public func caretPositionFromPoint(x: Double, y: Double) -> CaretPosition? {
        let this = jsObject
        return this[.caretPositionFromPoint].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()
    }

    @ReadonlyAttribute
    public var scrollingElement: Element?
}

open class DocumentFragment: Node, NonElementParentNode, ParentNode {
    @inlinable override open class var constructor: JSFunction? { JSObject.global[.DocumentFragment].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
}

public protocol DocumentOrShadowRoot: JSBridgedClass {}
public extension DocumentOrShadowRoot {
    @inlinable var activeElement: Element? { jsObject[.activeElement].fromJSValue() }
}

public enum DocumentReadyState: JSString, JSValueCompatible {
    case loading = "loading"
    case interactive = "interactive"
    case complete = "complete"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public class DocumentType: Node, ChildNode {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DocumentType].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _name = ReadonlyAttribute(jsObject: jsObject, name: .name)
        _publicId = ReadonlyAttribute(jsObject: jsObject, name: .publicId)
        _systemId = ReadonlyAttribute(jsObject: jsObject, name: .systemId)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var name: String

    @ReadonlyAttribute
    public var publicId: String

    @ReadonlyAttribute
    public var systemId: String
}

public enum DocumentVisibilityState: JSString, JSValueCompatible {
    case visible = "visible"
    case hidden = "hidden"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public class DOMImplementation: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMImplementation].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func createDocumentType(qualifiedName: String, publicId: String, systemId: String) -> DocumentType {
        let this = jsObject
        return this[.createDocumentType].function!(this: this, arguments: [_toJSValue(qualifiedName), _toJSValue(publicId), _toJSValue(systemId)]).fromJSValue()!
    }

    @inlinable public func createDocument(namespace: String?, qualifiedName: String, doctype: DocumentType? = nil) -> XMLDocument {
        let this = jsObject
        return this[.createDocument].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName), _toJSValue(doctype)]).fromJSValue()!
    }

    @inlinable public func createHTMLDocument(title: String? = nil) -> Document {
        let this = jsObject
        return this[.createHTMLDocument].function!(this: this, arguments: [_toJSValue(title)]).fromJSValue()!
    }

    @inlinable public func hasFeature() -> Bool {
        let this = jsObject
        return this[.hasFeature].function!(this: this, arguments: []).fromJSValue()!
    }
}

extension Document {
    public enum ElementCreationOptions_or_String: JSValueCompatible {
        public class ElementCreationOptions: BridgedDictionary {
            public convenience init(is: String) {
                let object = JSObject.global[.Object].function!.new()
                object[.is] = _toJSValue(`is`)
                self.init(unsafelyWrapping: object)
            }
            
            public required init(unsafelyWrapping object: JSObject) {
                _is = ReadWriteAttribute(jsObject: object, name: .is)
                super.init(unsafelyWrapping: object)
            }
            
            @ReadWriteAttribute
            public var `is`: String
        }
        case elementCreationOptions(ElementCreationOptions)
        case string(String)
        
        public static func construct(from value: JSValue) -> Self? {
            if let elementCreationOptions: ElementCreationOptions = value.fromJSValue() {
                return .elementCreationOptions(elementCreationOptions)
            }
            if let string: String = value.fromJSValue() {
                return .string(string)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .elementCreationOptions(elementCreationOptions):
                return elementCreationOptions.jsValue
            case let .string(string):
                return string.jsValue
            }
        }
    }
}
