//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/8/31.
//

import Foundation
import JavaScriptKit
import WebAPIBase
import JavaScriptEventLoop

public class Window: EventTarget,
                     GlobalEventHandlers,
                     WindowEventHandlers,
                     WindowOrWorkerGlobalScope,
                     AnimationFrameProvider,
                     WindowSessionStorage,
                     WindowLocalStorage {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Window].function }

    @inlinable public static var global: Window {
        Window(unsafelyWrapping: JSObject.global)
    }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _event = ReadonlyAttribute(jsObject: jsObject, name: .event)
        _window = ReadonlyAttribute(jsObject: jsObject, name: .window)
        _self = ReadonlyAttribute(jsObject: jsObject, name: ._self)
        _document = ReadonlyAttribute(jsObject: jsObject, name: .document)
        _name = ReadWriteAttribute(jsObject: jsObject, name: .name)
        _location = ReadonlyAttribute(jsObject: jsObject, name: .location)
        _history = ReadonlyAttribute(jsObject: jsObject, name: .history)
        _navigation = ReadonlyAttribute(jsObject: jsObject, name: .navigation)
        _customElements = ReadonlyAttribute(jsObject: jsObject, name: .customElements)
        _locationbar = ReadonlyAttribute(jsObject: jsObject, name: .locationbar)
        _menubar = ReadonlyAttribute(jsObject: jsObject, name: .menubar)
        _personalbar = ReadonlyAttribute(jsObject: jsObject, name: .personalbar)
        _scrollbars = ReadonlyAttribute(jsObject: jsObject, name: .scrollbars)
        _statusbar = ReadonlyAttribute(jsObject: jsObject, name: .statusbar)
        _toolbar = ReadonlyAttribute(jsObject: jsObject, name: .toolbar)
        _status = ReadWriteAttribute(jsObject: jsObject, name: .status)
        _closed = ReadonlyAttribute(jsObject: jsObject, name: .closed)
        _frames = ReadonlyAttribute(jsObject: jsObject, name: .frames)
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        _top = ReadonlyAttribute(jsObject: jsObject, name: .top)
        _opener = ReadWriteAttribute(jsObject: jsObject, name: .opener)
        _parent = ReadonlyAttribute(jsObject: jsObject, name: .parent)
        _frameElement = ReadonlyAttribute(jsObject: jsObject, name: .frameElement)
        _navigator = ReadonlyAttribute(jsObject: jsObject, name: .navigator)
        _clientInformation = ReadonlyAttribute(jsObject: jsObject, name: .clientInformation)
        _originAgentCluster = ReadonlyAttribute(jsObject: jsObject, name: .originAgentCluster)
        _external = ReadonlyAttribute(jsObject: jsObject, name: .external)
        _screen = ReadonlyAttribute(jsObject: jsObject, name: .screen)
        _visualViewport = ReadonlyAttribute(jsObject: jsObject, name: .visualViewport)
        _innerWidth = ReadonlyAttribute(jsObject: jsObject, name: .innerWidth)
        _innerHeight = ReadonlyAttribute(jsObject: jsObject, name: .innerHeight)
        _scrollX = ReadonlyAttribute(jsObject: jsObject, name: .scrollX)
        _pageXOffset = ReadonlyAttribute(jsObject: jsObject, name: .pageXOffset)
        _scrollY = ReadonlyAttribute(jsObject: jsObject, name: .scrollY)
        _pageYOffset = ReadonlyAttribute(jsObject: jsObject, name: .pageYOffset)
        _screenX = ReadonlyAttribute(jsObject: jsObject, name: .screenX)
        _screenLeft = ReadonlyAttribute(jsObject: jsObject, name: .screenLeft)
        _screenY = ReadonlyAttribute(jsObject: jsObject, name: .screenY)
        _screenTop = ReadonlyAttribute(jsObject: jsObject, name: .screenTop)
        _outerWidth = ReadonlyAttribute(jsObject: jsObject, name: .outerWidth)
        _outerHeight = ReadonlyAttribute(jsObject: jsObject, name: .outerHeight)
        _devicePixelRatio = ReadonlyAttribute(jsObject: jsObject, name: .devicePixelRatio)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var event: Event?

    @ReadonlyAttribute
    public var window: WindowProxy

    @ReadonlyAttribute
    public var `self`: WindowProxy

    @ReadonlyAttribute
    public var document: Document

    @ReadWriteAttribute
    public var name: String

    @ReadonlyAttribute
    public var location: Location

    @ReadonlyAttribute
    public var history: History

    @ReadonlyAttribute
    public var navigation: Navigation

    @ReadonlyAttribute
    public var customElements: CustomElementRegistry

    @ReadonlyAttribute
    public var locationbar: BarProp

    @ReadonlyAttribute
    public var menubar: BarProp

    @ReadonlyAttribute
    public var personalbar: BarProp

    @ReadonlyAttribute
    public var scrollbars: BarProp

    @ReadonlyAttribute
    public var statusbar: BarProp

    @ReadonlyAttribute
    public var toolbar: BarProp

    @ReadWriteAttribute
    public var status: String

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var closed: Bool

    @inlinable public func stop() {
        let this = jsObject
        _ = this[.stop].function!(this: this, arguments: [])
    }

    @inlinable public func focus() {
        let this = jsObject
        _ = this[.focus].function!(this: this, arguments: [])
    }

    @inlinable public func blur() {
        let this = jsObject
        _ = this[.blur].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var frames: WindowProxy

    @ReadonlyAttribute
    public var length: UInt32

    @ReadonlyAttribute
    public var top: WindowProxy?

    @ReadWriteAttribute
    public var opener: JSValue

    @ReadonlyAttribute
    public var parent: WindowProxy?

    @ReadonlyAttribute
    public var frameElement: Element?

    @inlinable public func open(url: String? = nil, target: String? = nil, features: String? = nil) -> WindowProxy? {
        let this = jsObject
        return this[.open].function!(this: this, arguments: [_toJSValue(url), _toJSValue(target), _toJSValue(features)]).fromJSValue()
    }

    @inlinable public subscript(key: String) -> JSObject {
        jsObject[key].fromJSValue()!
    }

    @ReadonlyAttribute
    public var navigator: Navigator

    @ReadonlyAttribute
    public var clientInformation: Navigator

    @ReadonlyAttribute
    public var originAgentCluster: Bool

    @inlinable public func alert() {
        let this = jsObject
        _ = this[.alert].function!(this: this, arguments: [])
    }

    @inlinable public func alert(message: String) {
        let this = jsObject
        _ = this[.alert].function!(this: this, arguments: [_toJSValue(message)])
    }

    @inlinable public func confirm(message: String? = nil) -> Bool {
        let this = jsObject
        return this[.confirm].function!(this: this, arguments: [_toJSValue(message)]).fromJSValue()!
    }

    @inlinable public func prompt(message: String? = nil, default: String? = nil) -> String? {
        let this = jsObject
        return this[.prompt].function!(this: this, arguments: [_toJSValue(message), _toJSValue(`default`)]).fromJSValue()
    }

    @inlinable public func print() {
        let this = jsObject
        _ = this[.print].function!(this: this, arguments: [])
    }

    @inlinable public func postMessage(message: JSValue, targetOrigin: String, transfer: [JSObject]? = nil) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(targetOrigin), _toJSValue(transfer)])
    }

    @inlinable public func postMessage(message: JSValue, options: WindowPostMessageOptions? = nil) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(options)])
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
    public var external: External

    @inlinable public func matchMedia(query: String) -> MediaQueryList {
        let this = jsObject
        return this[.matchMedia].function!(this: this, arguments: [_toJSValue(query)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var screen: Screen

    @ReadonlyAttribute
    public var visualViewport: VisualViewport?

    @inlinable public func moveTo(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.moveTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func moveBy(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.moveBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func resizeTo(width: Int32, height: Int32) {
        let this = jsObject
        _ = this[.resizeTo].function!(this: this, arguments: [_toJSValue(width), _toJSValue(height)])
    }

    @inlinable public func resizeBy(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.resizeBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @ReadonlyAttribute
    public var innerWidth: Int32

    @ReadonlyAttribute
    public var innerHeight: Int32

    @ReadonlyAttribute
    public var scrollX: Double

    @ReadonlyAttribute
    public var pageXOffset: Double

    @ReadonlyAttribute
    public var scrollY: Double

    @ReadonlyAttribute
    public var pageYOffset: Double

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

    @ReadonlyAttribute
    public var screenX: Int32

    @ReadonlyAttribute
    public var screenLeft: Int32

    @ReadonlyAttribute
    public var screenY: Int32

    @ReadonlyAttribute
    public var screenTop: Int32

    @ReadonlyAttribute
    public var outerWidth: Int32

    @ReadonlyAttribute
    public var outerHeight: Int32

    @ReadonlyAttribute
    public var devicePixelRatio: Double
}

public protocol WindowEventHandlers: JSBridgedClass {}
public extension WindowEventHandlers {
    @inlinable var onafterprint: EventHandler {
        get { ClosureAttribute1Optional[.onafterprint, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onafterprint, in: jsObject] = newValue }
    }

    @inlinable var onbeforeprint: EventHandler {
        get { ClosureAttribute1Optional[.onbeforeprint, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onbeforeprint, in: jsObject] = newValue }
    }

    @inlinable var onbeforeunload: OnBeforeUnloadEventHandler {
        get { ClosureAttribute1Optional[.onbeforeunload, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onbeforeunload, in: jsObject] = newValue }
    }

    @inlinable var onhashchange: EventHandler {
        get { ClosureAttribute1Optional[.onhashchange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onhashchange, in: jsObject] = newValue }
    }

    @inlinable var onlanguagechange: EventHandler {
        get { ClosureAttribute1Optional[.onlanguagechange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onlanguagechange, in: jsObject] = newValue }
    }

    @inlinable var onmessage: EventHandler {
        get { ClosureAttribute1Optional[.onmessage, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmessage, in: jsObject] = newValue }
    }

    @inlinable var onmessageerror: EventHandler {
        get { ClosureAttribute1Optional[.onmessageerror, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmessageerror, in: jsObject] = newValue }
    }

    @inlinable var onoffline: EventHandler {
        get { ClosureAttribute1Optional[.onoffline, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onoffline, in: jsObject] = newValue }
    }

    @inlinable var ononline: EventHandler {
        get { ClosureAttribute1Optional[.ononline, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ononline, in: jsObject] = newValue }
    }

    @inlinable var onpagehide: EventHandler {
        get { ClosureAttribute1Optional[.onpagehide, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpagehide, in: jsObject] = newValue }
    }

    @inlinable var onpageshow: EventHandler {
        get { ClosureAttribute1Optional[.onpageshow, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpageshow, in: jsObject] = newValue }
    }

    @inlinable var onpopstate: EventHandler {
        get { ClosureAttribute1Optional[.onpopstate, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpopstate, in: jsObject] = newValue }
    }

    @inlinable var onrejectionhandled: EventHandler {
        get { ClosureAttribute1Optional[.onrejectionhandled, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onrejectionhandled, in: jsObject] = newValue }
    }

    @inlinable var onstorage: EventHandler {
        get { ClosureAttribute1Optional[.onstorage, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onstorage, in: jsObject] = newValue }
    }

    @inlinable var onunhandledrejection: EventHandler {
        get { ClosureAttribute1Optional[.onunhandledrejection, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onunhandledrejection, in: jsObject] = newValue }
    }

    @inlinable var onunload: EventHandler {
        get { ClosureAttribute1Optional[.onunload, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onunload, in: jsObject] = newValue }
    }
}

public protocol WindowLocalStorage: JSBridgedClass {}
public extension WindowLocalStorage {
    @inlinable var localStorage: Storage { jsObject[.localStorage].fromJSValue()! }
}

public protocol WindowOrWorkerGlobalScope: JSBridgedClass {}
public extension WindowOrWorkerGlobalScope {
    @inlinable var origin: String { jsObject[.origin].fromJSValue()! }

    @inlinable var isSecureContext: Bool { jsObject[.isSecureContext].fromJSValue()! }

    @inlinable var crossOriginIsolated: Bool { jsObject[.crossOriginIsolated].fromJSValue()! }

    @inlinable func reportError(e: JSValue) {
        let this = jsObject
        _ = this[.reportError].function!(this: this, arguments: [_toJSValue(e)])
    }

    @inlinable func btoa(data: String) -> String {
        let this = jsObject
        return this[.btoa].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }

    @inlinable func atob(data: String) -> String {
        let this = jsObject
        return this[.atob].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }

    @inlinable func setTimeout(handler: TimerHandler, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[.setTimeout].function!(this: this, arguments: [_toJSValue(handler), _toJSValue(timeout)] + arguments.map(_toJSValue)).fromJSValue()!
    }

    @inlinable func clearTimeout(id: Int32? = nil) {
        let this = jsObject
        _ = this[.clearTimeout].function!(this: this, arguments: [_toJSValue(id)])
    }

    @inlinable 
    func setInterval(handler: TimerHandler, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[.setInterval].function!(this: this, arguments: [_toJSValue(handler), _toJSValue(timeout)] + arguments.map(_toJSValue)).fromJSValue()!
    }

    @inlinable 
    func clearInterval(id: Int32? = nil) {
        let this = jsObject
        _ = this[.clearInterval].function!(this: this, arguments: [_toJSValue(id)])
    }

    @inlinable func queueMicrotask(callback: @escaping VoidFunction) {
        let this = jsObject
        _ = this[.queueMicrotask].function!(this: this, arguments: [_toJSValue(callback)])
    }

    @inlinable func createImageBitmap(image: ImageBitmapSource, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmapSource, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func createImageBitmap(image: ImageBitmapSource, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmapSource, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func structuredClone(value: JSValue, options: StructuredSerializeOptions? = nil) -> JSValue {
        let this = jsObject
        return this[.structuredClone].function!(this: this, arguments: [_toJSValue(value), _toJSValue(options)]).fromJSValue()!
    }

    @inlinable var performance: Performance { jsObject[.performance].fromJSValue()! }

    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) -> JSPromise {
        let this = jsObject
        return this[.fetch].function!(this: this, arguments: [_toJSValue(input), _toJSValue(`init`)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) async throws -> Response {
        let this = jsObject
        let _promise: JSPromise = this[.fetch].function!(this: this, arguments: [_toJSValue(input), _toJSValue(`init`)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable var caches: CacheStorage { jsObject[.caches].fromJSValue()! }
}

public class WindowPostMessageOptions: BridgedDictionary {
    public convenience init(targetOrigin: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.targetOrigin] = _toJSValue(targetOrigin)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _targetOrigin = ReadWriteAttribute(jsObject: object, name: .targetOrigin)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var targetOrigin: String
}

public protocol WindowSessionStorage: JSBridgedClass {}
public extension WindowSessionStorage {
    @inlinable var sessionStorage: Storage { jsObject[.sessionStorage].fromJSValue()! }
}

