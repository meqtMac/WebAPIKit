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

public class HTMLElement: Element, GlobalEventHandlers, ElementContentEditable, HTMLOrSVGElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLElement].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _title = ReadWriteAttribute(jsObject: jsObject, name: .title)
        _lang = ReadWriteAttribute(jsObject: jsObject, name: .lang)
        _translate = ReadWriteAttribute(jsObject: jsObject, name: .translate)
        _dir = ReadWriteAttribute(jsObject: jsObject, name: .dir)
        _hidden = ReadWriteAttribute(jsObject: jsObject, name: .hidden)
        _inert = ReadWriteAttribute(jsObject: jsObject, name: .inert)
        _accessKey = ReadWriteAttribute(jsObject: jsObject, name: .accessKey)
        _accessKeyLabel = ReadonlyAttribute(jsObject: jsObject, name: .accessKeyLabel)
        _draggable = ReadWriteAttribute(jsObject: jsObject, name: .draggable)
        _spellcheck = ReadWriteAttribute(jsObject: jsObject, name: .spellcheck)
        _autocapitalize = ReadWriteAttribute(jsObject: jsObject, name: .autocapitalize)
        _innerText = ReadWriteAttribute(jsObject: jsObject, name: .innerText)
        _outerText = ReadWriteAttribute(jsObject: jsObject, name: .outerText)
        _popover = ReadWriteAttribute(jsObject: jsObject, name: .popover)
        _offsetParent = ReadonlyAttribute(jsObject: jsObject, name: .offsetParent)
        _offsetTop = ReadonlyAttribute(jsObject: jsObject, name: .offsetTop)
        _offsetLeft = ReadonlyAttribute(jsObject: jsObject, name: .offsetLeft)
        _offsetWidth = ReadonlyAttribute(jsObject: jsObject, name: .offsetWidth)
        _offsetHeight = ReadonlyAttribute(jsObject: jsObject, name: .offsetHeight)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
    
    @ReadWriteAttribute
    public var title: String
    
    @ReadWriteAttribute
    public var lang: String
    
    @ReadWriteAttribute
    public var translate: Bool
    
    @ReadWriteAttribute
    public var dir: String
    
    @ReadWriteAttribute
    public var hidden: HiddenState?
    
    @ReadWriteAttribute
    public var inert: Bool
    
    @inlinable public func click() {
        let this = jsObject
        _ = this[.click].function!(this: this, arguments: [])
    }
    
    @ReadWriteAttribute
    public var accessKey: String
    
    @ReadonlyAttribute
    public var accessKeyLabel: String
    
    @ReadWriteAttribute
    public var draggable: Bool
    
    @ReadWriteAttribute
    public var spellcheck: Bool
    
    @ReadWriteAttribute
    public var autocapitalize: String
    
    @ReadWriteAttribute
    public var innerText: String
    
    @ReadWriteAttribute
    public var outerText: String
    
    @inlinable public func attachInternals() -> ElementInternals {
        let this = jsObject
        return this[.attachInternals].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func showPopover() {
        let this = jsObject
        _ = this[.showPopover].function!(this: this, arguments: [])
    }
    
    @inlinable public func hidePopover() {
        let this = jsObject
        _ = this[.hidePopover].function!(this: this, arguments: [])
    }
    
    @inlinable public func togglePopover(force: Bool? = nil) -> Bool {
        let this = jsObject
        return this[.togglePopover].function!(this: this, arguments: [_toJSValue(force)]).fromJSValue()!
    }
    
    @ReadWriteAttribute
    public var popover: String?
    
    @ReadonlyAttribute
    public var offsetParent: Element?
    
    @ReadonlyAttribute
    public var offsetTop: Int32
    
    @ReadonlyAttribute
    public var offsetLeft: Int32
    
    @ReadonlyAttribute
    public var offsetWidth: Int32
    
    @ReadonlyAttribute
    public var offsetHeight: Int32
}

public class ElementInternals: JSBridgedClass, ARIAMixin {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ElementInternals].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _shadowRoot = ReadonlyAttribute(jsObject: jsObject, name: .shadowRoot)
        _form = ReadonlyAttribute(jsObject: jsObject, name: .form)
        _willValidate = ReadonlyAttribute(jsObject: jsObject, name: .willValidate)
        _validity = ReadonlyAttribute(jsObject: jsObject, name: .validity)
        _validationMessage = ReadonlyAttribute(jsObject: jsObject, name: .validationMessage)
        _labels = ReadonlyAttribute(jsObject: jsObject, name: .labels)
        self.jsObject = jsObject
    }
    
    @ReadonlyAttribute
    public var shadowRoot: ShadowRoot?
    
    @inlinable public func setFormValue(value: File_or_FormData_or_String?, state: File_or_FormData_or_String? = nil) {
        let this = jsObject
        _ = this[.setFormValue].function!(this: this, arguments: [_toJSValue(value), _toJSValue(state)])
    }
    
    @ReadonlyAttribute
    public var form: HTMLFormElement?
    
    @inlinable public func setValidity(flags: ValidityStateFlags? = nil, message: String? = nil, anchor: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.setValidity].function!(this: this, arguments: [_toJSValue(flags), _toJSValue(message), _toJSValue(anchor)])
    }
    
    @ReadonlyAttribute
    public var willValidate: Bool
    
    @ReadonlyAttribute
    public var validity: ValidityState
    
    @ReadonlyAttribute
    public var validationMessage: String
    
    @inlinable public func checkValidity() -> Bool {
        let this = jsObject
        return this[.checkValidity].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func reportValidity() -> Bool {
        let this = jsObject
        return this[.reportValidity].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @ReadonlyAttribute
    public var labels: NodeList
}

extension ElementInternals {
    public enum File_or_FormData_or_String: JSValueCompatible {
        case file(File)
        case formData(FormData)
        case string(String)
        
        public static func construct(from value: JSValue) -> Self? {
            if let file: File = value.fromJSValue() {
                return .file(file)
            }
            if let formData: FormData = value.fromJSValue() {
                return .formData(formData)
            }
            if let string: String = value.fromJSValue() {
                return .string(string)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .file(file):
                return file.jsValue
            case let .formData(formData):
                return formData.jsValue
            case let .string(string):
                return string.jsValue
            }
        }
    }
}

public protocol ElementContentEditable: JSBridgedClass {}
public extension ElementContentEditable {
    @inlinable var contentEditable: String {
        get { jsObject[.contentEditable].fromJSValue()! }
        nonmutating set { jsObject[.contentEditable] = _toJSValue(newValue) }
    }

    @inlinable var enterKeyHint: String {
        get { jsObject[.enterKeyHint].fromJSValue()! }
        nonmutating set { jsObject[.enterKeyHint] = _toJSValue(newValue) }
    }

    @inlinable var isContentEditable: Bool { jsObject[.isContentEditable].fromJSValue()! }

    @inlinable var inputMode: String {
        get { jsObject[.inputMode].fromJSValue()! }
        nonmutating set { jsObject[.inputMode] = _toJSValue(newValue) }
    }
}


extension HTMLElement {
    public enum HiddenState: JSValueCompatible {
        case `true`
        case `false`
        case untilFound
        public static func construct(from value: JSValue) -> Self? {
            if let bool: Bool = value.fromJSValue() {
                return bool ? .true : .false
            }
           if let string: String = value.fromJSValue(), string == "until-found" {
               return .untilFound
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case .false:
                return false.jsValue
            case .true:
                return true.jsValue
            case .untilFound:
                return "until-found".jsValue
            }
        }

    }
}
