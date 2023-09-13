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

public class XMLDocument: Document {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLDocument].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class XMLHttpRequest: XMLHttpRequestEventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLHttpRequest].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _onreadystatechange = ClosureAttribute1Optional(jsObject: jsObject, name: .onreadystatechange)
        _readyState = ReadonlyAttribute(jsObject: jsObject, name: .readyState)
        _timeout = ReadWriteAttribute(jsObject: jsObject, name: .timeout)
        _withCredentials = ReadWriteAttribute(jsObject: jsObject, name: .withCredentials)
        _upload = ReadonlyAttribute(jsObject: jsObject, name: .upload)
        _responseURL = ReadonlyAttribute(jsObject: jsObject, name: .responseURL)
        _status = ReadonlyAttribute(jsObject: jsObject, name: .status)
        _statusText = ReadonlyAttribute(jsObject: jsObject, name: .statusText)
        _responseType = ReadWriteAttribute(jsObject: jsObject, name: .responseType)
        _response = ReadonlyAttribute(jsObject: jsObject, name: .response)
        _responseText = ReadonlyAttribute(jsObject: jsObject, name: .responseText)
        _responseXML = ReadonlyAttribute(jsObject: jsObject, name: .responseXML)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ClosureAttribute1Optional
    public var onreadystatechange: EventHandler

    public static let UNSENT: UInt16 = 0

    public static let OPENED: UInt16 = 1

    public static let HEADERS_RECEIVED: UInt16 = 2

    public static let LOADING: UInt16 = 3

    public static let DONE: UInt16 = 4

    @ReadonlyAttribute
    public var readyState: UInt16

    @inlinable public func open(method: String, url: String) {
        let this = jsObject
        _ = this[.open].function!(this: this, arguments: [_toJSValue(method), _toJSValue(url)])
    }

    @inlinable public func open(method: String, url: String, async: Bool, username: String? = nil, password: String? = nil) {
        let this = jsObject
        _ = this[.open].function!(this: this, arguments: [_toJSValue(method), _toJSValue(url), _toJSValue(async), _toJSValue(username), _toJSValue(password)])
    }

    @inlinable public func setRequestHeader(name: String, value: String) {
        let this = jsObject
        _ = this[.setRequestHeader].function!(this: this, arguments: [_toJSValue(name), _toJSValue(value)])
    }

    @ReadWriteAttribute
    public var timeout: UInt32

    @ReadWriteAttribute
    public var withCredentials: Bool

    @ReadonlyAttribute
    public var upload: XMLHttpRequestUpload

    @inlinable public func send(body: Document_or_XMLHttpRequestBodyInit? = nil) {
        let this = jsObject
        _ = this[.send].function!(this: this, arguments: [_toJSValue(body)])
    }

    @inlinable public func abort() {
        let this = jsObject
        _ = this[.abort].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var responseURL: String

    @ReadonlyAttribute
    public var status: UInt16

    @ReadonlyAttribute
    public var statusText: String

    @inlinable public func getResponseHeader(name: String) -> String? {
        let this = jsObject
        return this[.getResponseHeader].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }

    @inlinable public func getAllResponseHeaders() -> String {
        let this = jsObject
        return this[.getAllResponseHeaders].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func overrideMimeType(mime: String) {
        let this = jsObject
        _ = this[.overrideMimeType].function!(this: this, arguments: [_toJSValue(mime)])
    }

    @ReadWriteAttribute
    public var responseType: XMLHttpRequestResponseType

    @ReadonlyAttribute
    public var response: JSValue

    @ReadonlyAttribute
    public var responseText: String

    @ReadonlyAttribute
    public var responseXML: Document?
}

public class XMLHttpRequestEventTarget: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLHttpRequestEventTarget].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _onloadstart = ClosureAttribute1Optional(jsObject: jsObject, name: .onloadstart)
        _onprogress = ClosureAttribute1Optional(jsObject: jsObject, name: .onprogress)
        _onabort = ClosureAttribute1Optional(jsObject: jsObject, name: .onabort)
        _onerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onerror)
        _onload = ClosureAttribute1Optional(jsObject: jsObject, name: .onload)
        _ontimeout = ClosureAttribute1Optional(jsObject: jsObject, name: .ontimeout)
        _onloadend = ClosureAttribute1Optional(jsObject: jsObject, name: .onloadend)
        super.init(unsafelyWrapping: jsObject)
    }

    @ClosureAttribute1Optional
    public var onloadstart: EventHandler

    @ClosureAttribute1Optional
    public var onprogress: EventHandler

    @ClosureAttribute1Optional
    public var onabort: EventHandler

    @ClosureAttribute1Optional
    public var onerror: EventHandler

    @ClosureAttribute1Optional
    public var onload: EventHandler

    @ClosureAttribute1Optional
    public var ontimeout: EventHandler

    @ClosureAttribute1Optional
    public var onloadend: EventHandler
}

public enum XMLHttpRequestResponseType: JSString, JSValueCompatible {
    case _empty = ""
    case arraybuffer = "arraybuffer"
    case blob = "blob"
    case document = "document"
    case json = "json"
    case text = "text"

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

public class XMLHttpRequestUpload: XMLHttpRequestEventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLHttpRequestUpload].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class XPathEvaluator: JSBridgedClass, XPathEvaluatorBase {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.XPathEvaluator].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
}

public protocol XPathEvaluatorBase: JSBridgedClass {}
public extension XPathEvaluatorBase {
    // XXX: method 'createExpression' is ignored

    // XXX: method 'createNSResolver' is ignored

    // XXX: method 'evaluate' is ignored
}

public class XPathExpression: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.XPathExpression].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func evaluate(contextNode: Node, type: UInt16? = nil, result: XPathResult? = nil) -> XPathResult {
        let this = jsObject
        return this[.evaluate].function!(this: this, arguments: [_toJSValue(contextNode), _toJSValue(type), _toJSValue(result)]).fromJSValue()!
    }
}

public class XPathResult: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.XPathResult].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _resultType = ReadonlyAttribute(jsObject: jsObject, name: .resultType)
        _numberValue = ReadonlyAttribute(jsObject: jsObject, name: .numberValue)
        _stringValue = ReadonlyAttribute(jsObject: jsObject, name: .stringValue)
        _booleanValue = ReadonlyAttribute(jsObject: jsObject, name: .booleanValue)
        _singleNodeValue = ReadonlyAttribute(jsObject: jsObject, name: .singleNodeValue)
        _invalidIteratorState = ReadonlyAttribute(jsObject: jsObject, name: .invalidIteratorState)
        _snapshotLength = ReadonlyAttribute(jsObject: jsObject, name: .snapshotLength)
        self.jsObject = jsObject
    }

    public static let ANY_TYPE: UInt16 = 0

    public static let NUMBER_TYPE: UInt16 = 1

    public static let STRING_TYPE: UInt16 = 2

    public static let BOOLEAN_TYPE: UInt16 = 3

    public static let UNORDERED_NODE_ITERATOR_TYPE: UInt16 = 4

    public static let ORDERED_NODE_ITERATOR_TYPE: UInt16 = 5

    public static let UNORDERED_NODE_SNAPSHOT_TYPE: UInt16 = 6

    public static let ORDERED_NODE_SNAPSHOT_TYPE: UInt16 = 7

    public static let ANY_UNORDERED_NODE_TYPE: UInt16 = 8

    public static let FIRST_ORDERED_NODE_TYPE: UInt16 = 9

    @ReadonlyAttribute
    public var resultType: UInt16

    @ReadonlyAttribute
    public var numberValue: Double

    @ReadonlyAttribute
    public var stringValue: String

    @ReadonlyAttribute
    public var booleanValue: Bool

    @ReadonlyAttribute
    public var singleNodeValue: Node?

    @ReadonlyAttribute
    public var invalidIteratorState: Bool

    @ReadonlyAttribute
    public var snapshotLength: UInt32

    @inlinable public func iterateNext() -> Node? {
        let this = jsObject
        return this[.iterateNext].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable public func snapshotItem(index: UInt32) -> Node? {
        let this = jsObject
        return this[.snapshotItem].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
}

