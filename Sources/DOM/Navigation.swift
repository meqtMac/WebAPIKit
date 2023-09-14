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

public class Navigation: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Navigation].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _currentEntry = ReadonlyAttribute(jsObject: jsObject, name: .currentEntry)
        _transition = ReadonlyAttribute(jsObject: jsObject, name: .transition)
        _canGoBack = ReadonlyAttribute(jsObject: jsObject, name: .canGoBack)
        _canGoForward = ReadonlyAttribute(jsObject: jsObject, name: .canGoForward)
        _onnavigate = ClosureAttribute1Optional(jsObject: jsObject, name: .onnavigate)
        _onnavigatesuccess = ClosureAttribute1Optional(jsObject: jsObject, name: .onnavigatesuccess)
        _onnavigateerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onnavigateerror)
        _oncurrententrychange = ClosureAttribute1Optional(jsObject: jsObject, name: .oncurrententrychange)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public func entries() -> [NavigationHistoryEntry] {
        let this = jsObject
        return this[.entries].function!(this: this, arguments: []).fromJSValue()!
    }

    @ReadonlyAttribute
    public var currentEntry: NavigationHistoryEntry?

    @inlinable public func updateCurrentEntry(options: NavigationUpdateCurrentEntryOptions) {
        let this = jsObject
        _ = this[.updateCurrentEntry].function!(this: this, arguments: [_toJSValue(options)])
    }

    @ReadonlyAttribute
    public var transition: NavigationTransition?

    @ReadonlyAttribute
    public var canGoBack: Bool

    @ReadonlyAttribute
    public var canGoForward: Bool

    @inlinable public func navigate(url: String, options: NavigationNavigateOptions? = nil) -> NavigationResult {
        let this = jsObject
        return this[.navigate].function!(this: this, arguments: [_toJSValue(url), _toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func reload(options: NavigationReloadOptions? = nil) -> NavigationResult {
        let this = jsObject
        return this[.reload].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func traverseTo(key: String, options: NavigationOptions? = nil) -> NavigationResult {
        let this = jsObject
        return this[.traverseTo].function!(this: this, arguments: [_toJSValue(key), _toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func back(options: NavigationOptions? = nil) -> NavigationResult {
        let this = jsObject
        return this[.back].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func forward(options: NavigationOptions? = nil) -> NavigationResult {
        let this = jsObject
        return this[.forward].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @ClosureAttribute1Optional
    public var onnavigate: EventHandler

    @ClosureAttribute1Optional
    public var onnavigatesuccess: EventHandler

    @ClosureAttribute1Optional
    public var onnavigateerror: EventHandler

    @ClosureAttribute1Optional
    public var oncurrententrychange: EventHandler
}



public class NavigationDestination: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.NavigationDestination].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _url = ReadonlyAttribute(jsObject: jsObject, name: .url)
        _key = ReadonlyAttribute(jsObject: jsObject, name: .key)
        _id = ReadonlyAttribute(jsObject: jsObject, name: .id)
        _index = ReadonlyAttribute(jsObject: jsObject, name: .index)
        _sameDocument = ReadonlyAttribute(jsObject: jsObject, name: .sameDocument)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var url: String

    @ReadonlyAttribute
    public var key: String

    @ReadonlyAttribute
    public var id: String

    @ReadonlyAttribute
    public var index: Int64

    @ReadonlyAttribute
    public var sameDocument: Bool

    @inlinable public func getState() -> JSValue {
        let this = jsObject
        return this[.getState].function!(this: this, arguments: []).fromJSValue()!
    }
}

public enum NavigationFocusReset: JSString, JSValueCompatible {
    case afterTransition = "after-transition"
    case manual = "manual"

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

public enum NavigationHistoryBehavior: JSString, JSValueCompatible {
    case auto = "auto"
    case push = "push"
    case replace = "replace"

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

public class NavigationHistoryEntry: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.NavigationHistoryEntry].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _url = ReadonlyAttribute(jsObject: jsObject, name: .url)
        _key = ReadonlyAttribute(jsObject: jsObject, name: .key)
        _id = ReadonlyAttribute(jsObject: jsObject, name: .id)
        _index = ReadonlyAttribute(jsObject: jsObject, name: .index)
        _sameDocument = ReadonlyAttribute(jsObject: jsObject, name: .sameDocument)
        _ondispose = ClosureAttribute1Optional(jsObject: jsObject, name: .ondispose)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var url: String?

    @ReadonlyAttribute
    public var key: String

    @ReadonlyAttribute
    public var id: String

    @ReadonlyAttribute
    public var index: Int64

    @ReadonlyAttribute
    public var sameDocument: Bool

    @inlinable public func getState() -> JSValue {
        let this = jsObject
        return this[.getState].function!(this: this, arguments: []).fromJSValue()!
    }

    @ClosureAttribute1Optional
    public var ondispose: EventHandler
}

public class NavigationInterceptOptions: BridgedDictionary {
    public convenience init(handler: @escaping NavigationInterceptHandler, focusReset: NavigationFocusReset, scroll: NavigationScrollBehavior) {
        let object = JSObject.global[.Object].function!.new()
        ClosureAttribute0[.handler, in: object] = handler
        object[.focusReset] = _toJSValue(focusReset)
        object[.scroll] = _toJSValue(scroll)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _handler = ClosureAttribute0(jsObject: object, name: .handler)
        _focusReset = ReadWriteAttribute(jsObject: object, name: .focusReset)
        _scroll = ReadWriteAttribute(jsObject: object, name: .scroll)
        super.init(unsafelyWrapping: object)
    }

    @ClosureAttribute0
    public var handler: NavigationInterceptHandler

    @ReadWriteAttribute
    public var focusReset: NavigationFocusReset

    @ReadWriteAttribute
    public var scroll: NavigationScrollBehavior
}

public class NavigationNavigateOptions: BridgedDictionary {
    public convenience init(state: JSValue, history: NavigationHistoryBehavior) {
        let object = JSObject.global[.Object].function!.new()
        object[.state] = _toJSValue(state)
        object[.history] = _toJSValue(history)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _state = ReadWriteAttribute(jsObject: object, name: .state)
        _history = ReadWriteAttribute(jsObject: object, name: .history)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var state: JSValue

    @ReadWriteAttribute
    public var history: NavigationHistoryBehavior
}

public class NavigationOptions: BridgedDictionary {
    public convenience init(info: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.info] = _toJSValue(info)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _info = ReadWriteAttribute(jsObject: object, name: .info)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var info: JSValue
}

public class NavigationPreloadManager: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.NavigationPreloadManager].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func enable() -> JSPromise {
        let this = jsObject
        return this[.enable].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func enable() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.enable].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func disable() -> JSPromise {
        let this = jsObject
        return this[.disable].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func disable() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.disable].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func setHeaderValue(value: String) -> JSPromise {
        let this = jsObject
        return this[.setHeaderValue].function!(this: this, arguments: [_toJSValue(value)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func setHeaderValue(value: String) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.setHeaderValue].function!(this: this, arguments: [_toJSValue(value)]).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func getState() -> JSPromise {
        let this = jsObject
        return this[.getState].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func getState() async throws -> NavigationPreloadState {
        let this = jsObject
        let _promise: JSPromise = this[.getState].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class NavigationPreloadState: BridgedDictionary {
    public convenience init(enabled: Bool, headerValue: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.enabled] = _toJSValue(enabled)
        object[.headerValue] = _toJSValue(headerValue)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _enabled = ReadWriteAttribute(jsObject: object, name: .enabled)
        _headerValue = ReadWriteAttribute(jsObject: object, name: .headerValue)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var enabled: Bool

    @ReadWriteAttribute
    public var headerValue: String
}

public class NavigationReloadOptions: BridgedDictionary {
    public convenience init(state: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.state] = _toJSValue(state)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _state = ReadWriteAttribute(jsObject: object, name: .state)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var state: JSValue
}

public class NavigationResult: BridgedDictionary {
    public convenience init(committed: JSPromise, finished: JSPromise) {
        let object = JSObject.global[.Object].function!.new()
        object[.committed] = _toJSValue(committed)
        object[.finished] = _toJSValue(finished)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _committed = ReadWriteAttribute(jsObject: object, name: .committed)
        _finished = ReadWriteAttribute(jsObject: object, name: .finished)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var committed: JSPromise

    @ReadWriteAttribute
    public var finished: JSPromise
}

public enum NavigationScrollBehavior: JSString, JSValueCompatible {
    case afterTransition = "after-transition"
    case manual = "manual"

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

public class NavigationTransition: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.NavigationTransition].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _navigationType = ReadonlyAttribute(jsObject: jsObject, name: .navigationType)
        _from = ReadonlyAttribute(jsObject: jsObject, name: .from)
        _finished = ReadonlyAttribute(jsObject: jsObject, name: .finished)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var navigationType: NavigationType

    @ReadonlyAttribute
    public var from: NavigationHistoryEntry

    @ReadonlyAttribute
    public var finished: JSPromise
}

public enum NavigationType: JSString, JSValueCompatible {
    case push = "push"
    case replace = "replace"
    case reload = "reload"
    case traverse = "traverse"

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

public class NavigationUpdateCurrentEntryOptions: BridgedDictionary {
    public convenience init(state: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.state] = _toJSValue(state)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _state = ReadWriteAttribute(jsObject: object, name: .state)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var state: JSValue
}

public class Navigator: JSBridgedClass, NavigatorID, NavigatorLanguage, NavigatorOnLine, NavigatorContentUtils, NavigatorCookies, NavigatorPlugins, NavigatorConcurrentHardware {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Navigator].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _userActivation = ReadonlyAttribute(jsObject: jsObject, name: .userActivation)
        _mediaDevices = ReadonlyAttribute(jsObject: jsObject, name: .mediaDevices)
        _serviceWorker = ReadonlyAttribute(jsObject: jsObject, name: .serviceWorker)
        _permissions = ReadonlyAttribute(jsObject: jsObject, name: .permissions)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var userActivation: UserActivation

    @ReadonlyAttribute
    public var mediaDevices: MediaDevices

    @inlinable public func getUserMedia(constraints: MediaStreamConstraints, successCallback: @escaping NavigatorUserMediaSuccessCallback, errorCallback: @escaping NavigatorUserMediaErrorCallback) {
        let this = jsObject
        _ = this[.getUserMedia].function!(this: this, arguments: [_toJSValue(constraints), _toJSValue(successCallback), _toJSValue(errorCallback)])
    }

    @ReadonlyAttribute
    public var serviceWorker: ServiceWorkerContainer

    @ReadonlyAttribute
    public var permissions: Permissions
}

public protocol NavigatorConcurrentHardware: JSBridgedClass {}
public extension NavigatorConcurrentHardware {
    @inlinable var hardwareConcurrency: UInt64 { jsObject[.hardwareConcurrency].fromJSValue()! }
}

public protocol NavigatorContentUtils: JSBridgedClass {}
public extension NavigatorContentUtils {
    @inlinable func registerProtocolHandler(scheme: String, url: String) {
        let this = jsObject
        _ = this[.registerProtocolHandler].function!(this: this, arguments: [_toJSValue(scheme), _toJSValue(url)])
    }

    @inlinable func unregisterProtocolHandler(scheme: String, url: String) {
        let this = jsObject
        _ = this[.unregisterProtocolHandler].function!(this: this, arguments: [_toJSValue(scheme), _toJSValue(url)])
    }
}

public protocol NavigatorCookies: JSBridgedClass {}
public extension NavigatorCookies {
    @inlinable var cookieEnabled: Bool { jsObject[.cookieEnabled].fromJSValue()! }
}

public protocol NavigatorID: JSBridgedClass {}
public extension NavigatorID {
    @inlinable var appCodeName: String { jsObject[.appCodeName].fromJSValue()! }

    @inlinable var appName: String { jsObject[.appName].fromJSValue()! }

    @inlinable var appVersion: String { jsObject[.appVersion].fromJSValue()! }

    @inlinable var platform: String { jsObject[.platform].fromJSValue()! }

    @inlinable var product: String { jsObject[.product].fromJSValue()! }

    @inlinable var productSub: String { jsObject[.productSub].fromJSValue()! }

    @inlinable var userAgent: String { jsObject[.userAgent].fromJSValue()! }

    @inlinable var vendor: String { jsObject[.vendor].fromJSValue()! }

    @inlinable var vendorSub: String { jsObject[.vendorSub].fromJSValue()! }

    @inlinable func taintEnabled() -> Bool {
        let this = jsObject
        return this[.taintEnabled].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable var oscpu: String { jsObject[.oscpu].fromJSValue()! }
}

public protocol NavigatorLanguage: JSBridgedClass {}
public extension NavigatorLanguage {
    @inlinable var language: String { jsObject[.language].fromJSValue()! }

    @inlinable var languages: [String] { jsObject[.languages].fromJSValue()! }
}

public protocol NavigatorOnLine: JSBridgedClass {}
public extension NavigatorOnLine {
    @inlinable var onLine: Bool { jsObject[.onLine].fromJSValue()! }
}

public protocol NavigatorPlugins: JSBridgedClass {}
public extension NavigatorPlugins {
    @inlinable var plugins: PluginArray { jsObject[.plugins].fromJSValue()! }

    @inlinable var mimeTypes: MimeTypeArray { jsObject[.mimeTypes].fromJSValue()! }

    @inlinable func javaEnabled() -> Bool {
        let this = jsObject
        return this[.javaEnabled].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable var pdfViewerEnabled: Bool { jsObject[.pdfViewerEnabled].fromJSValue()! }
}


