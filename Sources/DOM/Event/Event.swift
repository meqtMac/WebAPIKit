//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

open class Event: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.Event].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _target = ReadonlyAttribute(jsObject: jsObject, name: .target)
        _srcElement = ReadonlyAttribute(jsObject: jsObject, name: .srcElement)
        _currentTarget = ReadonlyAttribute(jsObject: jsObject, name: .currentTarget)
        _eventPhase = ReadonlyAttribute(jsObject: jsObject, name: .eventPhase)
        _cancelBubble = ReadWriteAttribute(jsObject: jsObject, name: .cancelBubble)
        _bubbles = ReadonlyAttribute(jsObject: jsObject, name: .bubbles)
        _cancelable = ReadonlyAttribute(jsObject: jsObject, name: .cancelable)
        _returnValue = ReadWriteAttribute(jsObject: jsObject, name: .returnValue)
        _defaultPrevented = ReadonlyAttribute(jsObject: jsObject, name: .defaultPrevented)
        _composed = ReadonlyAttribute(jsObject: jsObject, name: .composed)
        _isTrusted = ReadonlyAttribute(jsObject: jsObject, name: .isTrusted)
        _timeStamp = ReadonlyAttribute(jsObject: jsObject, name: .timeStamp)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(type: String, eventInitDict: EventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var type: String

    @ReadonlyAttribute
    public var target: EventTarget?

    @ReadonlyAttribute
    public var srcElement: EventTarget?

    @ReadonlyAttribute
    public var currentTarget: EventTarget?

    @inlinable public func composedPath() -> [EventTarget] {
        let this = jsObject
        return this[.composedPath].function!(this: this, arguments: []).fromJSValue()!
    }

    public static let NONE: UInt16 = 0

    public static let CAPTURING_PHASE: UInt16 = 1

    public static let AT_TARGET: UInt16 = 2

    public static let BUBBLING_PHASE: UInt16 = 3

    @ReadonlyAttribute
    public var eventPhase: UInt16

    @inlinable public func stopPropagation() {
        let this = jsObject
        _ = this[.stopPropagation].function!(this: this, arguments: [])
    }

    @ReadWriteAttribute
    public var cancelBubble: Bool

    @inlinable public func stopImmediatePropagation() {
        let this = jsObject
        _ = this[.stopImmediatePropagation].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var bubbles: Bool

    @ReadonlyAttribute
    public var cancelable: Bool

    @ReadWriteAttribute
    public var returnValue: Bool

    @inlinable public func preventDefault() {
        let this = jsObject
        _ = this[.preventDefault].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var defaultPrevented: Bool

    @ReadonlyAttribute
    public var composed: Bool

    @ReadonlyAttribute
    public var isTrusted: Bool

    @ReadonlyAttribute
    public var timeStamp: DOMHighResTimeStamp

    @inlinable public func initEvent(type: String, bubbles: Bool? = nil, cancelable: Bool? = nil) {
        let this = jsObject
        _ = this[.initEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable)])
    }
}

public class EventInit: BridgedDictionary {
    public convenience init(bubbles: Bool, cancelable: Bool, composed: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.bubbles] = _toJSValue(bubbles)
        object[.cancelable] = _toJSValue(cancelable)
        object[.composed] = _toJSValue(composed)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _bubbles = ReadWriteAttribute(jsObject: object, name: .bubbles)
        _cancelable = ReadWriteAttribute(jsObject: object, name: .cancelable)
        _composed = ReadWriteAttribute(jsObject: object, name: .composed)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var bubbles: Bool

    @ReadWriteAttribute
    public var cancelable: Bool

    @ReadWriteAttribute
    public var composed: Bool
}

public typealias EventListener = (Event) -> Void
public class EventListenerOptions: BridgedDictionary {
    public convenience init(capture: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.capture] = _toJSValue(capture)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _capture = ReadWriteAttribute(jsObject: object, name: .capture)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var capture: Bool
}

public class EventModifierInit: BridgedDictionary {
    public convenience init(ctrlKey: Bool, shiftKey: Bool, altKey: Bool, metaKey: Bool, modifierAltGraph: Bool, modifierCapsLock: Bool, modifierFn: Bool, modifierFnLock: Bool, modifierHyper: Bool, modifierNumLock: Bool, modifierScrollLock: Bool, modifierSuper: Bool, modifierSymbol: Bool, modifierSymbolLock: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.ctrlKey] = _toJSValue(ctrlKey)
        object[.shiftKey] = _toJSValue(shiftKey)
        object[.altKey] = _toJSValue(altKey)
        object[.metaKey] = _toJSValue(metaKey)
        object[.modifierAltGraph] = _toJSValue(modifierAltGraph)
        object[.modifierCapsLock] = _toJSValue(modifierCapsLock)
        object[.modifierFn] = _toJSValue(modifierFn)
        object[.modifierFnLock] = _toJSValue(modifierFnLock)
        object[.modifierHyper] = _toJSValue(modifierHyper)
        object[.modifierNumLock] = _toJSValue(modifierNumLock)
        object[.modifierScrollLock] = _toJSValue(modifierScrollLock)
        object[.modifierSuper] = _toJSValue(modifierSuper)
        object[.modifierSymbol] = _toJSValue(modifierSymbol)
        object[.modifierSymbolLock] = _toJSValue(modifierSymbolLock)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _ctrlKey = ReadWriteAttribute(jsObject: object, name: .ctrlKey)
        _shiftKey = ReadWriteAttribute(jsObject: object, name: .shiftKey)
        _altKey = ReadWriteAttribute(jsObject: object, name: .altKey)
        _metaKey = ReadWriteAttribute(jsObject: object, name: .metaKey)
        _modifierAltGraph = ReadWriteAttribute(jsObject: object, name: .modifierAltGraph)
        _modifierCapsLock = ReadWriteAttribute(jsObject: object, name: .modifierCapsLock)
        _modifierFn = ReadWriteAttribute(jsObject: object, name: .modifierFn)
        _modifierFnLock = ReadWriteAttribute(jsObject: object, name: .modifierFnLock)
        _modifierHyper = ReadWriteAttribute(jsObject: object, name: .modifierHyper)
        _modifierNumLock = ReadWriteAttribute(jsObject: object, name: .modifierNumLock)
        _modifierScrollLock = ReadWriteAttribute(jsObject: object, name: .modifierScrollLock)
        _modifierSuper = ReadWriteAttribute(jsObject: object, name: .modifierSuper)
        _modifierSymbol = ReadWriteAttribute(jsObject: object, name: .modifierSymbol)
        _modifierSymbolLock = ReadWriteAttribute(jsObject: object, name: .modifierSymbolLock)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var ctrlKey: Bool

    @ReadWriteAttribute
    public var shiftKey: Bool

    @ReadWriteAttribute
    public var altKey: Bool

    @ReadWriteAttribute
    public var metaKey: Bool

    @ReadWriteAttribute
    public var modifierAltGraph: Bool

    @ReadWriteAttribute
    public var modifierCapsLock: Bool

    @ReadWriteAttribute
    public var modifierFn: Bool

    @ReadWriteAttribute
    public var modifierFnLock: Bool

    @ReadWriteAttribute
    public var modifierHyper: Bool

    @ReadWriteAttribute
    public var modifierNumLock: Bool

    @ReadWriteAttribute
    public var modifierScrollLock: Bool

    @ReadWriteAttribute
    public var modifierSuper: Bool

    @ReadWriteAttribute
    public var modifierSymbol: Bool

    @ReadWriteAttribute
    public var modifierSymbolLock: Bool
}
public class UIEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.UIEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _view = ReadonlyAttribute(jsObject: jsObject, name: .view)
        _detail = ReadonlyAttribute(jsObject: jsObject, name: .detail)
        _which = ReadonlyAttribute(jsObject: jsObject, name: .which)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: UIEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var view: Window?

    @ReadonlyAttribute
    public var detail: Int32

    @inlinable public func initUIEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: Window? = nil, detailArg: Int32? = nil) {
        let this = jsObject
        _ = this[.initUIEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(detailArg)])
    }

    @ReadonlyAttribute
    public var which: UInt32
}

public class UIEventInit: BridgedDictionary {
    public convenience init(view: Window?, detail: Int32, which: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.view] = _toJSValue(view)
        object[.detail] = _toJSValue(detail)
        object[.which] = _toJSValue(which)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _view = ReadWriteAttribute(jsObject: object, name: .view)
        _detail = ReadWriteAttribute(jsObject: object, name: .detail)
        _which = ReadWriteAttribute(jsObject: object, name: .which)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var view: Window?

    @ReadWriteAttribute
    public var detail: Int32

    @ReadWriteAttribute
    public var which: UInt32
}
public class CompositionEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.CompositionEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _data = ReadonlyAttribute(jsObject: jsObject, name: .data)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: CompositionEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var data: String

    @inlinable public func initCompositionEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: WindowProxy? = nil, dataArg: String? = nil) {
        let this = jsObject
        _ = this[.initCompositionEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(dataArg)])
    }
}

public class CompositionEventInit: BridgedDictionary {
    public convenience init(data: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.data] = _toJSValue(data)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _data = ReadWriteAttribute(jsObject: object, name: .data)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var data: String
}
public class FocusEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.FocusEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _relatedTarget = ReadonlyAttribute(jsObject: jsObject, name: .relatedTarget)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: FocusEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var relatedTarget: EventTarget?
}

public class FocusEventInit: BridgedDictionary {
    public convenience init(relatedTarget: EventTarget?) {
        let object = JSObject.global[.Object].function!.new()
        object[.relatedTarget] = _toJSValue(relatedTarget)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _relatedTarget = ReadWriteAttribute(jsObject: object, name: .relatedTarget)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var relatedTarget: EventTarget?
}
public class InputEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.InputEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _data = ReadonlyAttribute(jsObject: jsObject, name: .data)
        _isComposing = ReadonlyAttribute(jsObject: jsObject, name: .isComposing)
        _inputType = ReadonlyAttribute(jsObject: jsObject, name: .inputType)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: InputEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var data: String?

    @ReadonlyAttribute
    public var isComposing: Bool

    @ReadonlyAttribute
    public var inputType: String
}

public class InputEventInit: BridgedDictionary {
    public convenience init(data: String?, isComposing: Bool, inputType: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.data] = _toJSValue(data)
        object[.isComposing] = _toJSValue(isComposing)
        object[.inputType] = _toJSValue(inputType)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _data = ReadWriteAttribute(jsObject: object, name: .data)
        _isComposing = ReadWriteAttribute(jsObject: object, name: .isComposing)
        _inputType = ReadWriteAttribute(jsObject: object, name: .inputType)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var data: String?

    @ReadWriteAttribute
    public var isComposing: Bool

    @ReadWriteAttribute
    public var inputType: String
}

public class KeyboardEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.KeyboardEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _key = ReadonlyAttribute(jsObject: jsObject, name: .key)
        _code = ReadonlyAttribute(jsObject: jsObject, name: .code)
        _location = ReadonlyAttribute(jsObject: jsObject, name: .location)
        _ctrlKey = ReadonlyAttribute(jsObject: jsObject, name: .ctrlKey)
        _shiftKey = ReadonlyAttribute(jsObject: jsObject, name: .shiftKey)
        _altKey = ReadonlyAttribute(jsObject: jsObject, name: .altKey)
        _metaKey = ReadonlyAttribute(jsObject: jsObject, name: .metaKey)
        _repeat = ReadonlyAttribute(jsObject: jsObject, name: .repeat)
        _isComposing = ReadonlyAttribute(jsObject: jsObject, name: .isComposing)
        _charCode = ReadonlyAttribute(jsObject: jsObject, name: .charCode)
        _keyCode = ReadonlyAttribute(jsObject: jsObject, name: .keyCode)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: KeyboardEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    public static let DOM_KEY_LOCATION_STANDARD: UInt32 = 0x00

    public static let DOM_KEY_LOCATION_LEFT: UInt32 = 0x01

    public static let DOM_KEY_LOCATION_RIGHT: UInt32 = 0x02

    public static let DOM_KEY_LOCATION_NUMPAD: UInt32 = 0x03

    @ReadonlyAttribute
    public var key: String

    @ReadonlyAttribute
    public var code: String

    @ReadonlyAttribute
    public var location: UInt32

    @ReadonlyAttribute
    public var ctrlKey: Bool

    @ReadonlyAttribute
    public var shiftKey: Bool

    @ReadonlyAttribute
    public var altKey: Bool

    @ReadonlyAttribute
    public var metaKey: Bool

    @ReadonlyAttribute
    public var `repeat`: Bool

    @ReadonlyAttribute
    public var isComposing: Bool

    @inlinable public func getModifierState(keyArg: String) -> Bool {
        let this = jsObject
        return this[.getModifierState].function!(this: this, arguments: [_toJSValue(keyArg)]).fromJSValue()!
    }

    @inlinable public func initKeyboardEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: Window? = nil, keyArg: String? = nil, locationArg: UInt32? = nil, ctrlKey: Bool? = nil, altKey: Bool? = nil, shiftKey: Bool? = nil, metaKey: Bool? = nil) {
        let this = jsObject
        _ = this[.initKeyboardEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(keyArg), _toJSValue(locationArg), _toJSValue(ctrlKey), _toJSValue(altKey), _toJSValue(shiftKey), _toJSValue(metaKey)])
    }

    @ReadonlyAttribute
    public var charCode: UInt32

    @ReadonlyAttribute
    public var keyCode: UInt32
}

public class KeyboardEventInit: BridgedDictionary {
    public convenience init(key: String, code: String, location: UInt32, repeat: Bool, isComposing: Bool, charCode: UInt32, keyCode: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.key] = _toJSValue(key)
        object[.code] = _toJSValue(code)
        object[.location] = _toJSValue(location)
        object[.repeat] = _toJSValue(`repeat`)
        object[.isComposing] = _toJSValue(isComposing)
        object[.charCode] = _toJSValue(charCode)
        object[.keyCode] = _toJSValue(keyCode)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _key = ReadWriteAttribute(jsObject: object, name: .key)
        _code = ReadWriteAttribute(jsObject: object, name: .code)
        _location = ReadWriteAttribute(jsObject: object, name: .location)
        _repeat = ReadWriteAttribute(jsObject: object, name: .repeat)
        _isComposing = ReadWriteAttribute(jsObject: object, name: .isComposing)
        _charCode = ReadWriteAttribute(jsObject: object, name: .charCode)
        _keyCode = ReadWriteAttribute(jsObject: object, name: .keyCode)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var key: String

    @ReadWriteAttribute
    public var code: String

    @ReadWriteAttribute
    public var location: UInt32

    @ReadWriteAttribute
    public var `repeat`: Bool

    @ReadWriteAttribute
    public var isComposing: Bool

    @ReadWriteAttribute
    public var charCode: UInt32

    @ReadWriteAttribute
    public var keyCode: UInt32
}
public class MouseEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MouseEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _screenX = ReadonlyAttribute(jsObject: jsObject, name: .screenX)
        _screenY = ReadonlyAttribute(jsObject: jsObject, name: .screenY)
        _clientX = ReadonlyAttribute(jsObject: jsObject, name: .clientX)
        _clientY = ReadonlyAttribute(jsObject: jsObject, name: .clientY)
        _ctrlKey = ReadonlyAttribute(jsObject: jsObject, name: .ctrlKey)
        _shiftKey = ReadonlyAttribute(jsObject: jsObject, name: .shiftKey)
        _altKey = ReadonlyAttribute(jsObject: jsObject, name: .altKey)
        _metaKey = ReadonlyAttribute(jsObject: jsObject, name: .metaKey)
        _button = ReadonlyAttribute(jsObject: jsObject, name: .button)
        _buttons = ReadonlyAttribute(jsObject: jsObject, name: .buttons)
        _relatedTarget = ReadonlyAttribute(jsObject: jsObject, name: .relatedTarget)
        _pageX = ReadonlyAttribute(jsObject: jsObject, name: .pageX)
        _pageY = ReadonlyAttribute(jsObject: jsObject, name: .pageY)
        _x = ReadonlyAttribute(jsObject: jsObject, name: .x)
        _y = ReadonlyAttribute(jsObject: jsObject, name: .y)
        _offsetX = ReadonlyAttribute(jsObject: jsObject, name: .offsetX)
        _offsetY = ReadonlyAttribute(jsObject: jsObject, name: .offsetY)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: MouseEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var screenX: Int32

    @ReadonlyAttribute
    public var screenY: Int32

    @ReadonlyAttribute
    public var clientX: Int32

    @ReadonlyAttribute
    public var clientY: Int32

    @ReadonlyAttribute
    public var ctrlKey: Bool

    @ReadonlyAttribute
    public var shiftKey: Bool

    @ReadonlyAttribute
    public var altKey: Bool

    @ReadonlyAttribute
    public var metaKey: Bool

    @ReadonlyAttribute
    public var button: Int16

    @ReadonlyAttribute
    public var buttons: UInt16

    @ReadonlyAttribute
    public var relatedTarget: EventTarget?

    @inlinable public func getModifierState(keyArg: String) -> Bool {
        let this = jsObject
        return this[.getModifierState].function!(this: this, arguments: [_toJSValue(keyArg)]).fromJSValue()!
    }

    @inlinable public func initMouseEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: Window? = nil, detailArg: Int32? = nil, screenXArg: Int32? = nil, screenYArg: Int32? = nil, clientXArg: Int32? = nil, clientYArg: Int32? = nil, ctrlKeyArg: Bool? = nil, altKeyArg: Bool? = nil, shiftKeyArg: Bool? = nil, metaKeyArg: Bool? = nil, buttonArg: Int16? = nil, relatedTargetArg: EventTarget? = nil) {
        let this = jsObject
        _ = this[.initMouseEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(detailArg), _toJSValue(screenXArg), _toJSValue(screenYArg), _toJSValue(clientXArg), _toJSValue(clientYArg), _toJSValue(ctrlKeyArg), _toJSValue(altKeyArg), _toJSValue(shiftKeyArg), _toJSValue(metaKeyArg), _toJSValue(buttonArg), _toJSValue(relatedTargetArg)])
    }

    @ReadonlyAttribute
    public var pageX: Double

    @ReadonlyAttribute
    public var pageY: Double

    @ReadonlyAttribute
    public var x: Double

    @ReadonlyAttribute
    public var y: Double

    @ReadonlyAttribute
    public var offsetX: Double

    @ReadonlyAttribute
    public var offsetY: Double
}

public class MouseEventInit: BridgedDictionary {
    public convenience init(screenX: Int32, screenY: Int32, clientX: Int32, clientY: Int32, button: Int16, buttons: UInt16, relatedTarget: EventTarget?) {
        let object = JSObject.global[.Object].function!.new()
        object[.screenX] = _toJSValue(screenX)
        object[.screenY] = _toJSValue(screenY)
        object[.clientX] = _toJSValue(clientX)
        object[.clientY] = _toJSValue(clientY)
        object[.button] = _toJSValue(button)
        object[.buttons] = _toJSValue(buttons)
        object[.relatedTarget] = _toJSValue(relatedTarget)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _screenX = ReadWriteAttribute(jsObject: object, name: .screenX)
        _screenY = ReadWriteAttribute(jsObject: object, name: .screenY)
        _clientX = ReadWriteAttribute(jsObject: object, name: .clientX)
        _clientY = ReadWriteAttribute(jsObject: object, name: .clientY)
        _button = ReadWriteAttribute(jsObject: object, name: .button)
        _buttons = ReadWriteAttribute(jsObject: object, name: .buttons)
        _relatedTarget = ReadWriteAttribute(jsObject: object, name: .relatedTarget)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var screenX: Int32

    @ReadWriteAttribute
    public var screenY: Int32

    @ReadWriteAttribute
    public var clientX: Int32

    @ReadWriteAttribute
    public var clientY: Int32

    @ReadWriteAttribute
    public var button: Int16

    @ReadWriteAttribute
    public var buttons: UInt16

    @ReadWriteAttribute
    public var relatedTarget: EventTarget?
}

public class DragEvent: MouseEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DragEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _dataTransfer = ReadonlyAttribute(jsObject: jsObject, name: .dataTransfer)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: DragEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var dataTransfer: DataTransfer?
}

public class DragEventInit: BridgedDictionary {
    public convenience init(dataTransfer: DataTransfer?) {
        let object = JSObject.global[.Object].function!.new()
        object[.dataTransfer] = _toJSValue(dataTransfer)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _dataTransfer = ReadWriteAttribute(jsObject: object, name: .dataTransfer)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var dataTransfer: DataTransfer?
}
public class WheelEvent: MouseEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WheelEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _deltaX = ReadonlyAttribute(jsObject: jsObject, name: .deltaX)
        _deltaY = ReadonlyAttribute(jsObject: jsObject, name: .deltaY)
        _deltaZ = ReadonlyAttribute(jsObject: jsObject, name: .deltaZ)
        _deltaMode = ReadonlyAttribute(jsObject: jsObject, name: .deltaMode)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: WheelEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    public static let DOM_DELTA_PIXEL: UInt32 = 0x00

    public static let DOM_DELTA_LINE: UInt32 = 0x01

    public static let DOM_DELTA_PAGE: UInt32 = 0x02

    @ReadonlyAttribute
    public var deltaX: Double

    @ReadonlyAttribute
    public var deltaY: Double

    @ReadonlyAttribute
    public var deltaZ: Double

    @ReadonlyAttribute
    public var deltaMode: UInt32
}

public class WheelEventInit: BridgedDictionary {
    public convenience init(deltaX: Double, deltaY: Double, deltaZ: Double, deltaMode: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.deltaX] = _toJSValue(deltaX)
        object[.deltaY] = _toJSValue(deltaY)
        object[.deltaZ] = _toJSValue(deltaZ)
        object[.deltaMode] = _toJSValue(deltaMode)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _deltaX = ReadWriteAttribute(jsObject: object, name: .deltaX)
        _deltaY = ReadWriteAttribute(jsObject: object, name: .deltaY)
        _deltaZ = ReadWriteAttribute(jsObject: object, name: .deltaZ)
        _deltaMode = ReadWriteAttribute(jsObject: object, name: .deltaMode)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var deltaX: Double

    @ReadWriteAttribute
    public var deltaY: Double

    @ReadWriteAttribute
    public var deltaZ: Double

    @ReadWriteAttribute
    public var deltaMode: UInt32
}
