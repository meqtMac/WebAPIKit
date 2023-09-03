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
    @inlinable override public class var constructor: JSFunction? { JSObject.global[Strings.Window].function }

    @inlinable public static var global: Window {
        Window(unsafelyWrapping: JSObject.global)
    }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _event = ReadonlyAttribute(jsObject: jsObject, name: Strings.event)
        _window = ReadonlyAttribute(jsObject: jsObject, name: Strings.window)
        _self = ReadonlyAttribute(jsObject: jsObject, name: Strings._self)
        _document = ReadonlyAttribute(jsObject: jsObject, name: Strings.document)
        _name = ReadWriteAttribute(jsObject: jsObject, name: Strings.name)
        _location = ReadonlyAttribute(jsObject: jsObject, name: Strings.location)
        _history = ReadonlyAttribute(jsObject: jsObject, name: Strings.history)
        _navigation = ReadonlyAttribute(jsObject: jsObject, name: Strings.navigation)
        _customElements = ReadonlyAttribute(jsObject: jsObject, name: Strings.customElements)
        _locationbar = ReadonlyAttribute(jsObject: jsObject, name: Strings.locationbar)
        _menubar = ReadonlyAttribute(jsObject: jsObject, name: Strings.menubar)
        _personalbar = ReadonlyAttribute(jsObject: jsObject, name: Strings.personalbar)
        _scrollbars = ReadonlyAttribute(jsObject: jsObject, name: Strings.scrollbars)
        _statusbar = ReadonlyAttribute(jsObject: jsObject, name: Strings.statusbar)
        _toolbar = ReadonlyAttribute(jsObject: jsObject, name: Strings.toolbar)
        _status = ReadWriteAttribute(jsObject: jsObject, name: Strings.status)
        _closed = ReadonlyAttribute(jsObject: jsObject, name: Strings.closed)
        _frames = ReadonlyAttribute(jsObject: jsObject, name: Strings.frames)
        _length = ReadonlyAttribute(jsObject: jsObject, name: Strings.length)
        _top = ReadonlyAttribute(jsObject: jsObject, name: Strings.top)
        _opener = ReadWriteAttribute(jsObject: jsObject, name: Strings.opener)
        _parent = ReadonlyAttribute(jsObject: jsObject, name: Strings.parent)
        _frameElement = ReadonlyAttribute(jsObject: jsObject, name: Strings.frameElement)
        _navigator = ReadonlyAttribute(jsObject: jsObject, name: Strings.navigator)
        _clientInformation = ReadonlyAttribute(jsObject: jsObject, name: Strings.clientInformation)
        _originAgentCluster = ReadonlyAttribute(jsObject: jsObject, name: Strings.originAgentCluster)
        _external = ReadonlyAttribute(jsObject: jsObject, name: Strings.external)
        _screen = ReadonlyAttribute(jsObject: jsObject, name: Strings.screen)
        _visualViewport = ReadonlyAttribute(jsObject: jsObject, name: Strings.visualViewport)
        _innerWidth = ReadonlyAttribute(jsObject: jsObject, name: Strings.innerWidth)
        _innerHeight = ReadonlyAttribute(jsObject: jsObject, name: Strings.innerHeight)
        _scrollX = ReadonlyAttribute(jsObject: jsObject, name: Strings.scrollX)
        _pageXOffset = ReadonlyAttribute(jsObject: jsObject, name: Strings.pageXOffset)
        _scrollY = ReadonlyAttribute(jsObject: jsObject, name: Strings.scrollY)
        _pageYOffset = ReadonlyAttribute(jsObject: jsObject, name: Strings.pageYOffset)
        _screenX = ReadonlyAttribute(jsObject: jsObject, name: Strings.screenX)
        _screenLeft = ReadonlyAttribute(jsObject: jsObject, name: Strings.screenLeft)
        _screenY = ReadonlyAttribute(jsObject: jsObject, name: Strings.screenY)
        _screenTop = ReadonlyAttribute(jsObject: jsObject, name: Strings.screenTop)
        _outerWidth = ReadonlyAttribute(jsObject: jsObject, name: Strings.outerWidth)
        _outerHeight = ReadonlyAttribute(jsObject: jsObject, name: Strings.outerHeight)
        _devicePixelRatio = ReadonlyAttribute(jsObject: jsObject, name: Strings.devicePixelRatio)
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
        _ = this[Strings.close].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var closed: Bool

    @inlinable public func stop() {
        let this = jsObject
        _ = this[Strings.stop].function!(this: this, arguments: [])
    }

    @inlinable public func focus() {
        let this = jsObject
        _ = this[Strings.focus].function!(this: this, arguments: [])
    }

    @inlinable public func blur() {
        let this = jsObject
        _ = this[Strings.blur].function!(this: this, arguments: [])
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
        return this[Strings.open].function!(this: this, arguments: [_toJSValue(url), _toJSValue(target), _toJSValue(features)]).fromJSValue()
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
        _ = this[Strings.alert].function!(this: this, arguments: [])
    }

    @inlinable public func alert(message: String) {
        let this = jsObject
        _ = this[Strings.alert].function!(this: this, arguments: [_toJSValue(message)])
    }

    @inlinable public func confirm(message: String? = nil) -> Bool {
        let this = jsObject
        return this[Strings.confirm].function!(this: this, arguments: [_toJSValue(message)]).fromJSValue()!
    }

    @inlinable public func prompt(message: String? = nil, default: String? = nil) -> String? {
        let this = jsObject
        return this[Strings.prompt].function!(this: this, arguments: [_toJSValue(message), _toJSValue(`default`)]).fromJSValue()
    }

    @inlinable public func print() {
        let this = jsObject
        _ = this[Strings.print].function!(this: this, arguments: [])
    }

    @inlinable public func postMessage(message: JSValue, targetOrigin: String, transfer: [JSObject]? = nil) {
        let this = jsObject
        _ = this[Strings.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(targetOrigin), _toJSValue(transfer)])
    }

    @inlinable public func postMessage(message: JSValue, options: WindowPostMessageOptions? = nil) {
        let this = jsObject
        _ = this[Strings.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(options)])
    }

    @inlinable public func captureEvents() {
        let this = jsObject
        _ = this[Strings.captureEvents].function!(this: this, arguments: [])
    }

    @inlinable public func releaseEvents() {
        let this = jsObject
        _ = this[Strings.releaseEvents].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var external: External

    @inlinable public func matchMedia(query: String) -> MediaQueryList {
        let this = jsObject
        return this[Strings.matchMedia].function!(this: this, arguments: [_toJSValue(query)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var screen: Screen

    @ReadonlyAttribute
    public var visualViewport: VisualViewport?

    @inlinable public func moveTo(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[Strings.moveTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func moveBy(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[Strings.moveBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func resizeTo(width: Int32, height: Int32) {
        let this = jsObject
        _ = this[Strings.resizeTo].function!(this: this, arguments: [_toJSValue(width), _toJSValue(height)])
    }

    @inlinable public func resizeBy(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[Strings.resizeBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
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
        _ = this[Strings.scroll].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scroll(x: Double, y: Double) {
        let this = jsObject
        _ = this[Strings.scroll].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func scrollTo(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[Strings.scrollTo].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scrollTo(x: Double, y: Double) {
        let this = jsObject
        _ = this[Strings.scrollTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func scrollBy(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[Strings.scrollBy].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scrollBy(x: Double, y: Double) {
        let this = jsObject
        _ = this[Strings.scrollBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
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
        get { ClosureAttribute1Optional[Strings.onafterprint, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onafterprint, in: jsObject] = newValue }
    }

    @inlinable var onbeforeprint: EventHandler {
        get { ClosureAttribute1Optional[Strings.onbeforeprint, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onbeforeprint, in: jsObject] = newValue }
    }

    @inlinable var onbeforeunload: OnBeforeUnloadEventHandler {
        get { ClosureAttribute1Optional[Strings.onbeforeunload, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onbeforeunload, in: jsObject] = newValue }
    }

    @inlinable var onhashchange: EventHandler {
        get { ClosureAttribute1Optional[Strings.onhashchange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onhashchange, in: jsObject] = newValue }
    }

    @inlinable var onlanguagechange: EventHandler {
        get { ClosureAttribute1Optional[Strings.onlanguagechange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onlanguagechange, in: jsObject] = newValue }
    }

    @inlinable var onmessage: EventHandler {
        get { ClosureAttribute1Optional[Strings.onmessage, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onmessage, in: jsObject] = newValue }
    }

    @inlinable var onmessageerror: EventHandler {
        get { ClosureAttribute1Optional[Strings.onmessageerror, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onmessageerror, in: jsObject] = newValue }
    }

    @inlinable var onoffline: EventHandler {
        get { ClosureAttribute1Optional[Strings.onoffline, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onoffline, in: jsObject] = newValue }
    }

    @inlinable var ononline: EventHandler {
        get { ClosureAttribute1Optional[Strings.ononline, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.ononline, in: jsObject] = newValue }
    }

    @inlinable var onpagehide: EventHandler {
        get { ClosureAttribute1Optional[Strings.onpagehide, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onpagehide, in: jsObject] = newValue }
    }

    @inlinable var onpageshow: EventHandler {
        get { ClosureAttribute1Optional[Strings.onpageshow, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onpageshow, in: jsObject] = newValue }
    }

    @inlinable var onpopstate: EventHandler {
        get { ClosureAttribute1Optional[Strings.onpopstate, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onpopstate, in: jsObject] = newValue }
    }

    @inlinable var onrejectionhandled: EventHandler {
        get { ClosureAttribute1Optional[Strings.onrejectionhandled, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onrejectionhandled, in: jsObject] = newValue }
    }

    @inlinable var onstorage: EventHandler {
        get { ClosureAttribute1Optional[Strings.onstorage, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onstorage, in: jsObject] = newValue }
    }

    @inlinable var onunhandledrejection: EventHandler {
        get { ClosureAttribute1Optional[Strings.onunhandledrejection, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onunhandledrejection, in: jsObject] = newValue }
    }

    @inlinable var onunload: EventHandler {
        get { ClosureAttribute1Optional[Strings.onunload, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[Strings.onunload, in: jsObject] = newValue }
    }
}

public protocol WindowLocalStorage: JSBridgedClass {}
public extension WindowLocalStorage {
    @inlinable var localStorage: Storage { jsObject[Strings.localStorage].fromJSValue()! }
}

public protocol WindowOrWorkerGlobalScope: JSBridgedClass {}
public extension WindowOrWorkerGlobalScope {
    @inlinable var origin: String { jsObject[Strings.origin].fromJSValue()! }

    @inlinable var isSecureContext: Bool { jsObject[Strings.isSecureContext].fromJSValue()! }

    @inlinable var crossOriginIsolated: Bool { jsObject[Strings.crossOriginIsolated].fromJSValue()! }

    @inlinable func reportError(e: JSValue) {
        let this = jsObject
        _ = this[Strings.reportError].function!(this: this, arguments: [_toJSValue(e)])
    }

    @inlinable func btoa(data: String) -> String {
        let this = jsObject
        return this[Strings.btoa].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }

    @inlinable func atob(data: String) -> String {
        let this = jsObject
        return this[Strings.atob].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }

    @inlinable func setTimeout(handler: TimerHandler, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[Strings.setTimeout].function!(this: this, arguments: [_toJSValue(handler), _toJSValue(timeout)] + arguments.map(_toJSValue)).fromJSValue()!
    }

    @inlinable func clearTimeout(id: Int32? = nil) {
        let this = jsObject
        _ = this[Strings.clearTimeout].function!(this: this, arguments: [_toJSValue(id)])
    }

    @inlinable 
    func setInterval(handler: TimerHandler, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[Strings.setInterval].function!(this: this, arguments: [_toJSValue(handler), _toJSValue(timeout)] + arguments.map(_toJSValue)).fromJSValue()!
    }

    @inlinable 
    func clearInterval(id: Int32? = nil) {
        let this = jsObject
        _ = this[Strings.clearInterval].function!(this: this, arguments: [_toJSValue(id)])
    }

    @inlinable func queueMicrotask(callback: @escaping VoidFunction) {
        let this = jsObject
        _ = this[Strings.queueMicrotask].function!(this: this, arguments: [_toJSValue(callback)])
    }

    @inlinable func createImageBitmap(image: ImageBitmapSource, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[Strings.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmapSource, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[Strings.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func createImageBitmap(image: ImageBitmapSource, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[Strings.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmapSource, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[Strings.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func structuredClone(value: JSValue, options: StructuredSerializeOptions? = nil) -> JSValue {
        let this = jsObject
        return this[Strings.structuredClone].function!(this: this, arguments: [_toJSValue(value), _toJSValue(options)]).fromJSValue()!
    }

    @inlinable var performance: Performance { jsObject[Strings.performance].fromJSValue()! }

    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) -> JSPromise {
        let this = jsObject
        return this[Strings.fetch].function!(this: this, arguments: [_toJSValue(input), _toJSValue(`init`)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) async throws -> Response {
        let this = jsObject
        let _promise: JSPromise = this[Strings.fetch].function!(this: this, arguments: [_toJSValue(input), _toJSValue(`init`)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable var caches: CacheStorage { jsObject[Strings.caches].fromJSValue()! }
}

public class WindowPostMessageOptions: BridgedDictionary {
    public convenience init(targetOrigin: String) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.targetOrigin] = _toJSValue(targetOrigin)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _targetOrigin = ReadWriteAttribute(jsObject: object, name: Strings.targetOrigin)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var targetOrigin: String
}

public protocol WindowSessionStorage: JSBridgedClass {}
public extension WindowSessionStorage {
    @inlinable var sessionStorage: Storage { jsObject[Strings.sessionStorage].fromJSValue()! }
}

