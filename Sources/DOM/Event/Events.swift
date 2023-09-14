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

public class BeforeUnloadEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.BeforeUnloadEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _returnValue = ReadWriteAttribute(jsObject: jsObject, name: .returnValue)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @available(*, unavailable)
    override public var returnValue: Bool {
        get { !_returnValue.wrappedValue.isEmpty }
        set {}
    }
    
    @usableFromInline let _returnValue: ReadWriteAttribute<String>
    // renamed because `String` is not compatible with `Bool`
    @inlinable public var returnValueAsString: String {
        get { _returnValue.wrappedValue }
        set { _returnValue.wrappedValue = newValue }
    }
}


public class BlobEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.BlobEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _data = ReadonlyAttribute(jsObject: jsObject, name: .data)
        _timecode = ReadonlyAttribute(jsObject: jsObject, name: .timecode)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(type: String, eventInitDict: BlobEventInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    @ReadonlyAttribute
    public var data: Blob
    
    @ReadonlyAttribute
    public var timecode: DOMHighResTimeStamp
}

public class BlobEventInit: BridgedDictionary {
    public convenience init(data: Blob, timecode: DOMHighResTimeStamp) {
        let object = JSObject.global[.Object].function!.new()
        object[.data] = _toJSValue(data)
        object[.timecode] = _toJSValue(timecode)
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        _data = ReadWriteAttribute(jsObject: object, name: .data)
        _timecode = ReadWriteAttribute(jsObject: object, name: .timecode)
        super.init(unsafelyWrapping: object)
    }
    
    @ReadWriteAttribute
    public var data: Blob
    
    @ReadWriteAttribute
    public var timecode: DOMHighResTimeStamp
}

public class CustomEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.CustomEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _detail = ReadonlyAttribute(jsObject: jsObject, name: .detail)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(type: String, eventInitDict: CustomEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    @ReadonlyAttribute
    public var detail: JSValue
    
    @inlinable public func initCustomEvent(type: String, bubbles: Bool? = nil, cancelable: Bool? = nil, detail: JSValue? = nil) {
        let this = jsObject
        _ = this[.initCustomEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable), _toJSValue(detail)])
    }
}

public class CustomEventInit: BridgedDictionary {
    public convenience init(detail: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.detail] = _toJSValue(detail)
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        _detail = ReadWriteAttribute(jsObject: object, name: .detail)
        super.init(unsafelyWrapping: object)
    }
    
    @ReadWriteAttribute
    public var detail: JSValue
}
public class ErrorEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ErrorEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _message = ReadonlyAttribute(jsObject: jsObject, name: .message)
        _filename = ReadonlyAttribute(jsObject: jsObject, name: .filename)
        _lineno = ReadonlyAttribute(jsObject: jsObject, name: .lineno)
        _colno = ReadonlyAttribute(jsObject: jsObject, name: .colno)
        _error = ReadonlyAttribute(jsObject: jsObject, name: .error)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: ErrorEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var message: String
    
    @ReadonlyAttribute
    public var filename: String
    
    @ReadonlyAttribute
    public var lineno: UInt32
    
    @ReadonlyAttribute
    public var colno: UInt32
    
    @ReadonlyAttribute
    public var error: JSValue
}

//public class ErrorEventInit: BridgedDictionary {
//    public convenience init(message: String, filename: String, lineno: UInt32, colno: UInt32, error: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.message] = _toJSValue(message)
//        object[.filename] = _toJSValue(filename)
//        object[.lineno] = _toJSValue(lineno)
//        object[.colno] = _toJSValue(colno)
//        object[.error] = _toJSValue(error)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _message = ReadWriteAttribute(jsObject: object, name: .message)
//        _filename = ReadWriteAttribute(jsObject: object, name: .filename)
//        _lineno = ReadWriteAttribute(jsObject: object, name: .lineno)
//        _colno = ReadWriteAttribute(jsObject: object, name: .colno)
//        _error = ReadWriteAttribute(jsObject: object, name: .error)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var message: String
//
//    @ReadWriteAttribute
//    public var filename: String
//
//    @ReadWriteAttribute
//    public var lineno: UInt32
//
//    @ReadWriteAttribute
//    public var colno: UInt32
//
//    @ReadWriteAttribute
//    public var error: JSValue
//}
//public class ExtendableEventInit: BridgedDictionary {
//    public convenience init() {
//        let object = JSObject.global[.Object].function!.new()
//
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        super.init(unsafelyWrapping: object)
//    }
//}



public class FormDataEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.FormDataEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _formData = ReadonlyAttribute(jsObject: jsObject, name: .formData)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: FormDataEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var formData: FormData
}

//public class FormDataEventInit: BridgedDictionary {
//    public convenience init(formData: FormData) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.formData] = _toJSValue(formData)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _formData = ReadWriteAttribute(jsObject: object, name: .formData)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var formData: FormData
//}

//public class FetchEventInit: BridgedDictionary {
//    public convenience init(request: Request, preloadResponse: JSPromise, clientId: String, resultingClientId: String, replacesClientId: String, handled: JSPromise) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.request] = _toJSValue(request)
//        object[.preloadResponse] = _toJSValue(preloadResponse)
//        object[.clientId] = _toJSValue(clientId)
//        object[.resultingClientId] = _toJSValue(resultingClientId)
//        object[.replacesClientId] = _toJSValue(replacesClientId)
//        object[.handled] = _toJSValue(handled)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _request = ReadWriteAttribute(jsObject: object, name: .request)
//        _preloadResponse = ReadWriteAttribute(jsObject: object, name: .preloadResponse)
//        _clientId = ReadWriteAttribute(jsObject: object, name: .clientId)
//        _resultingClientId = ReadWriteAttribute(jsObject: object, name: .resultingClientId)
//        _replacesClientId = ReadWriteAttribute(jsObject: object, name: .replacesClientId)
//        _handled = ReadWriteAttribute(jsObject: object, name: .handled)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var request: Request
//
//    @ReadWriteAttribute
//    public var preloadResponse: JSPromise
//
//    @ReadWriteAttribute
//    public var clientId: String
//
//    @ReadWriteAttribute
//    public var resultingClientId: String
//
//    @ReadWriteAttribute
//    public var replacesClientId: String
//
//    @ReadWriteAttribute
//    public var handled: JSPromise
//}


public class HashChangeEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HashChangeEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _oldURL = ReadonlyAttribute(jsObject: jsObject, name: .oldURL)
        _newURL = ReadonlyAttribute(jsObject: jsObject, name: .newURL)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: HashChangeEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var oldURL: String
    
    @ReadonlyAttribute
    public var newURL: String
}

//public class HashChangeEventInit: BridgedDictionary {
//    public convenience init(oldURL: String, newURL: String) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.oldURL] = _toJSValue(oldURL)
//        object[.newURL] = _toJSValue(newURL)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _oldURL = ReadWriteAttribute(jsObject: object, name: .oldURL)
//        _newURL = ReadWriteAttribute(jsObject: object, name: .newURL)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var oldURL: String
//
//    @ReadWriteAttribute
//    public var newURL: String
//}

public class MessageEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MessageEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _data = ReadonlyAttribute(jsObject: jsObject, name: .data)
        _origin = ReadonlyAttribute(jsObject: jsObject, name: .origin)
        _lastEventId = ReadonlyAttribute(jsObject: jsObject, name: .lastEventId)
        _source = ReadonlyAttribute(jsObject: jsObject, name: .source)
        _ports = ReadonlyAttribute(jsObject: jsObject, name: .ports)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: MessageEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var data: JSValue
    
    @ReadonlyAttribute
    public var origin: String
    
    @ReadonlyAttribute
    public var lastEventId: String
    
    @ReadonlyAttribute
    public var source: MessageEventSource?
    
    @ReadonlyAttribute
    public var ports: [MessagePort]
    
    @inlinable public func initMessageEvent(type: String, bubbles: Bool? = nil, cancelable: Bool? = nil, data: JSValue? = nil, origin: String? = nil, lastEventId: String? = nil, source: MessageEventSource? = nil, ports: [MessagePort]? = nil) {
        let this = jsObject
        _ = this[.initMessageEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable), _toJSValue(data), _toJSValue(origin), _toJSValue(lastEventId), _toJSValue(source), _toJSValue(ports)])
    }
    
    public enum MessageEventSource: JSValueCompatible {
        case messagePort(MessagePort)
        case serviceWorker(ServiceWorker)
        case windowProxy(WindowProxy)
        
        public static func construct(from value: JSValue) -> Self? {
            if let messagePort: MessagePort = value.fromJSValue() {
                return .messagePort(messagePort)
            }
            if let serviceWorker: ServiceWorker = value.fromJSValue() {
                return .serviceWorker(serviceWorker)
            }
            if let windowProxy: WindowProxy = value.fromJSValue() {
                return .windowProxy(windowProxy)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .messagePort(messagePort):
                return messagePort.jsValue
            case let .serviceWorker(serviceWorker):
                return serviceWorker.jsValue
            case let .windowProxy(windowProxy):
                return windowProxy.jsValue
            }
        }
    }
}

public class NavigateEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.NavigateEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _navigationType = ReadonlyAttribute(jsObject: jsObject, name: .navigationType)
        _destination = ReadonlyAttribute(jsObject: jsObject, name: .destination)
        _canIntercept = ReadonlyAttribute(jsObject: jsObject, name: .canIntercept)
        _userInitiated = ReadonlyAttribute(jsObject: jsObject, name: .userInitiated)
        _hashChange = ReadonlyAttribute(jsObject: jsObject, name: .hashChange)
        _signal = ReadonlyAttribute(jsObject: jsObject, name: .signal)
        _formData = ReadonlyAttribute(jsObject: jsObject, name: .formData)
        _downloadRequest = ReadonlyAttribute(jsObject: jsObject, name: .downloadRequest)
        _info = ReadonlyAttribute(jsObject: jsObject, name: .info)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: NavigateEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var navigationType: NavigationType
    
    @ReadonlyAttribute
    public var destination: NavigationDestination
    
    @ReadonlyAttribute
    public var canIntercept: Bool
    
    @ReadonlyAttribute
    public var userInitiated: Bool
    
    @ReadonlyAttribute
    public var hashChange: Bool
    
    @ReadonlyAttribute
    public var signal: AbortSignal
    
    @ReadonlyAttribute
    public var formData: FormData?
    
    @ReadonlyAttribute
    public var downloadRequest: String?
    
    @ReadonlyAttribute
    public var info: JSValue
    
    @inlinable public func intercept(options: NavigationInterceptOptions? = nil) {
        let this = jsObject
        _ = this[.intercept].function!(this: this, arguments: [_toJSValue(options)])
    }
    
    @inlinable public func scroll() {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [])
    }
}

//public class NavigateEventInit: BridgedDictionary {
//    public convenience init(navigationType: NavigationType, destination: NavigationDestination, canIntercept: Bool, userInitiated: Bool, hashChange: Bool, signal: AbortSignal, formData: FormData?, downloadRequest: String?, info: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.navigationType] = _toJSValue(navigationType)
//        object[.destination] = _toJSValue(destination)
//        object[.canIntercept] = _toJSValue(canIntercept)
//        object[.userInitiated] = _toJSValue(userInitiated)
//        object[.hashChange] = _toJSValue(hashChange)
//        object[.signal] = _toJSValue(signal)
//        object[.formData] = _toJSValue(formData)
//        object[.downloadRequest] = _toJSValue(downloadRequest)
//        object[.info] = _toJSValue(info)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _navigationType = ReadWriteAttribute(jsObject: object, name: .navigationType)
//        _destination = ReadWriteAttribute(jsObject: object, name: .destination)
//        _canIntercept = ReadWriteAttribute(jsObject: object, name: .canIntercept)
//        _userInitiated = ReadWriteAttribute(jsObject: object, name: .userInitiated)
//        _hashChange = ReadWriteAttribute(jsObject: object, name: .hashChange)
//        _signal = ReadWriteAttribute(jsObject: object, name: .signal)
//        _formData = ReadWriteAttribute(jsObject: object, name: .formData)
//        _downloadRequest = ReadWriteAttribute(jsObject: object, name: .downloadRequest)
//        _info = ReadWriteAttribute(jsObject: object, name: .info)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var navigationType: NavigationType
//
//    @ReadWriteAttribute
//    public var destination: NavigationDestination
//
//    @ReadWriteAttribute
//    public var canIntercept: Bool
//
//    @ReadWriteAttribute
//    public var userInitiated: Bool
//
//    @ReadWriteAttribute
//    public var hashChange: Bool
//
//    @ReadWriteAttribute
//    public var signal: AbortSignal
//
//    @ReadWriteAttribute
//    public var formData: FormData?
//
//    @ReadWriteAttribute
//    public var downloadRequest: String?
//
//    @ReadWriteAttribute
//    public var info: JSValue
//}

public class NavigationCurrentEntryChangeEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.NavigationCurrentEntryChangeEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _navigationType = ReadonlyAttribute(jsObject: jsObject, name: .navigationType)
        _from = ReadonlyAttribute(jsObject: jsObject, name: .from)
        super.init(unsafelyWrapping: jsObject)
    }
    //
    //    @inlinable public convenience init(type: String, eventInitDict: NavigationCurrentEntryChangeEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var navigationType: NavigationType?
    
    @ReadonlyAttribute
    public var from: NavigationHistoryEntry
}

//public class NavigationCurrentEntryChangeEventInit: BridgedDictionary {
//    public convenience init(navigationType: NavigationType?, from: NavigationHistoryEntry) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.navigationType] = _toJSValue(navigationType)
//        object[.from] = _toJSValue(from)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _navigationType = ReadWriteAttribute(jsObject: object, name: .navigationType)
//        _from = ReadWriteAttribute(jsObject: object, name: .from)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var navigationType: NavigationType?
//
//    @ReadWriteAttribute
//    public var from: NavigationHistoryEntry
//}
public class PageTransitionEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.PageTransitionEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _persisted = ReadonlyAttribute(jsObject: jsObject, name: .persisted)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: PageTransitionEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var persisted: Bool
}

//public class PageTransitionEventInit: BridgedDictionary {
//    public convenience init(persisted: Bool) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.persisted] = _toJSValue(persisted)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _persisted = ReadWriteAttribute(jsObject: object, name: .persisted)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var persisted: Bool
//}

public class PopStateEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.PopStateEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _state = ReadonlyAttribute(jsObject: jsObject, name: .state)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: PopStateEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var state: JSValue
}

//public class PopStateEventInit: BridgedDictionary {
//    public convenience init(state: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.state] = _toJSValue(state)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _state = ReadWriteAttribute(jsObject: object, name: .state)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var state: JSValue
//}

public class ProgressEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ProgressEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _lengthComputable = ReadonlyAttribute(jsObject: jsObject, name: .lengthComputable)
        _loaded = ReadonlyAttribute(jsObject: jsObject, name: .loaded)
        _total = ReadonlyAttribute(jsObject: jsObject, name: .total)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: ProgressEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var lengthComputable: Bool
    
    @ReadonlyAttribute
    public var loaded: UInt64
    
    @ReadonlyAttribute
    public var total: UInt64
}

//public class ProgressEventInit: BridgedDictionary {
//    public convenience init(lengthComputable: Bool, loaded: UInt64, total: UInt64) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.lengthComputable] = _toJSValue(lengthComputable)
//        object[.loaded] = _toJSValue(loaded)
//        object[.total] = _toJSValue(total)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _lengthComputable = ReadWriteAttribute(jsObject: object, name: .lengthComputable)
//        _loaded = ReadWriteAttribute(jsObject: object, name: .loaded)
//        _total = ReadWriteAttribute(jsObject: object, name: .total)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var lengthComputable: Bool
//
//    @ReadWriteAttribute
//    public var loaded: UInt64
//
//    @ReadWriteAttribute
//    public var total: UInt64
//}

public class PromiseRejectionEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.PromiseRejectionEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _promise = ReadonlyAttribute(jsObject: jsObject, name: .promise)
        _reason = ReadonlyAttribute(jsObject: jsObject, name: .reason)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: PromiseRejectionEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var promise: JSPromise
    
    @ReadonlyAttribute
    public var reason: JSValue
}

//public class PromiseRejectionEventInit: BridgedDictionary {
//    public convenience init(promise: JSPromise, reason: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.promise] = _toJSValue(promise)
//        object[.reason] = _toJSValue(reason)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _promise = ReadWriteAttribute(jsObject: object, name: .promise)
//        _reason = ReadWriteAttribute(jsObject: object, name: .reason)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var promise: JSPromise
//
//    @ReadWriteAttribute
//    public var reason: JSValue
//}

public class StorageEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.StorageEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _key = ReadonlyAttribute(jsObject: jsObject, name: .key)
        _oldValue = ReadonlyAttribute(jsObject: jsObject, name: .oldValue)
        _newValue = ReadonlyAttribute(jsObject: jsObject, name: .newValue)
        _url = ReadonlyAttribute(jsObject: jsObject, name: .url)
        _storageArea = ReadonlyAttribute(jsObject: jsObject, name: .storageArea)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: StorageEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var key: String?
    
    @ReadonlyAttribute
    public var oldValue: String?
    
    @ReadonlyAttribute
    public var newValue: String?
    
    @ReadonlyAttribute
    public var url: String
    
    @ReadonlyAttribute
    public var storageArea: Storage?
    
    @inlinable public func initStorageEvent(type: String, 
                                            bubbles: Bool? = nil,
                                            cancelable: Bool? = nil,
                                            key: String? = nil,
                                            oldValue: String? = nil,
                                            newValue: String? = nil,
                                            url: String? = nil,
                                            storageArea: Storage? = nil) {
        let this = jsObject
        _ = this[.initStorageEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable), _toJSValue(key), _toJSValue(oldValue), _toJSValue(newValue), _toJSValue(url), _toJSValue(storageArea)])
    }
}

//public class StorageEventInit: BridgedDictionary {
//    public convenience init(key: String?, oldValue: String?, newValue: String?, url: String, storageArea: Storage?) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.key] = _toJSValue(key)
//        object[.oldValue] = _toJSValue(oldValue)
//        object[.newValue] = _toJSValue(newValue)
//        object[.url] = _toJSValue(url)
//        object[.storageArea] = _toJSValue(storageArea)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _key = ReadWriteAttribute(jsObject: object, name: .key)
//        _oldValue = ReadWriteAttribute(jsObject: object, name: .oldValue)
//        _newValue = ReadWriteAttribute(jsObject: object, name: .newValue)
//        _url = ReadWriteAttribute(jsObject: object, name: .url)
//        _storageArea = ReadWriteAttribute(jsObject: object, name: .storageArea)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var key: String?
//
//    @ReadWriteAttribute
//    public var oldValue: String?
//
//    @ReadWriteAttribute
//    public var newValue: String?
//
//    @ReadWriteAttribute
//    public var url: String
//
//    @ReadWriteAttribute
//    public var storageArea: Storage?
//}

public class SubmitEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.SubmitEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _submitter = ReadonlyAttribute(jsObject: jsObject, name: .submitter)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: SubmitEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var submitter: HTMLElement?
}

//public class SubmitEventInit: BridgedDictionary {
//    public convenience init(submitter: HTMLElement?) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.submitter] = _toJSValue(submitter)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _submitter = ReadWriteAttribute(jsObject: object, name: .submitter)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var submitter: HTMLElement?
//}
public class ToggleEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ToggleEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _oldState = ReadonlyAttribute(jsObject: jsObject, name: .oldState)
        _newState = ReadonlyAttribute(jsObject: jsObject, name: .newState)
        super.init(unsafelyWrapping: jsObject)
    }
    
    //    @inlinable public convenience init(type: String, eventInitDict: ToggleEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
    @ReadonlyAttribute
    public var oldState: String
    
    @ReadonlyAttribute
    public var newState: String
}

//public class ToggleEventInit: BridgedDictionary {
//    public convenience init(oldState: String, newState: String) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.oldState] = _toJSValue(oldState)
//        object[.newState] = _toJSValue(newState)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _oldState = ReadWriteAttribute(jsObject: object, name: .oldState)
//        _newState = ReadWriteAttribute(jsObject: object, name: .newState)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var oldState: String
//
//    @ReadWriteAttribute
//    public var newState: String
//}



public class TrackEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TrackEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _track = ReadonlyAttribute(jsObject: jsObject, name: .track)
        super.init(unsafelyWrapping: jsObject)
    }
   
    @ReadonlyAttribute
    public var track: AudioTrack_or_TextTrack_or_VideoTrack?
}

public enum AudioTrack_or_TextTrack_or_VideoTrack: JSValueCompatible  {
    case audioTrack(AudioTrack)
    case textTrack(TextTrack)
    case videoTrack(VideoTrack)

    public static func construct(from value: JSValue) -> Self? {
        if let audioTrack: AudioTrack = value.fromJSValue() {
            return .audioTrack(audioTrack)
        }
        if let textTrack: TextTrack = value.fromJSValue() {
            return .textTrack(textTrack)
        }
        if let videoTrack: VideoTrack = value.fromJSValue() {
            return .videoTrack(videoTrack)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .audioTrack(audioTrack):
            return audioTrack.jsValue
        case let .textTrack(textTrack):
            return textTrack.jsValue
        case let .videoTrack(videoTrack):
            return videoTrack.jsValue
        }
    }
}
//public class TrackEventInit: BridgedDictionary {
//    public convenience init(track: AudioTrack_or_TextTrack_or_VideoTrack?) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.track] = _toJSValue(track)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _track = ReadWriteAttribute(jsObject: object, name: .track)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var track: AudioTrack_or_TextTrack_or_VideoTrack?
//}
