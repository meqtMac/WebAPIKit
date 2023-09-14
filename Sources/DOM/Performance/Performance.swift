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


public class Performance: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Performance].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _timeOrigin = ReadonlyAttribute(jsObject: jsObject, name: .timeOrigin)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public func now() -> DOMHighResTimeStamp {
        let this = jsObject
        return this[.now].function!(this: this, arguments: []).fromJSValue()!
    }

    @ReadonlyAttribute
    public var timeOrigin: DOMHighResTimeStamp

    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getEntries() -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntries].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getEntriesByType(type: String) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByType].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }

    @inlinable public func getEntriesByName(name: String, type: String? = nil) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByName].function!(this: this, arguments: [_toJSValue(name), _toJSValue(type)]).fromJSValue()!
    }
}

public class PerformanceEntry: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.PerformanceEntry].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _name = ReadonlyAttribute(jsObject: jsObject, name: .name)
        _entryType = ReadonlyAttribute(jsObject: jsObject, name: .entryType)
        _startTime = ReadonlyAttribute(jsObject: jsObject, name: .startTime)
        _duration = ReadonlyAttribute(jsObject: jsObject, name: .duration)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var name: String

    @ReadonlyAttribute
    public var entryType: String

    @ReadonlyAttribute
    public var startTime: DOMHighResTimeStamp

    @ReadonlyAttribute
    public var duration: DOMHighResTimeStamp

    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class PerformanceObserver: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.PerformanceObserver].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _supportedEntryTypes = ReadonlyAttribute(jsObject: jsObject, name: .supportedEntryTypes)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(callback: @escaping PerformanceObserverCallback) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(callback)]))
    }

    @inlinable public func observe(options: PerformanceObserverInit? = nil) {
        let this = jsObject
        _ = this[.observe].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func disconnect() {
        let this = jsObject
        _ = this[.disconnect].function!(this: this, arguments: [])
    }

    @inlinable public func takeRecords() -> PerformanceEntryList {
        let this = jsObject
        return this[.takeRecords].function!(this: this, arguments: []).fromJSValue()!
    }

    @ReadonlyAttribute
    public var supportedEntryTypes: [String]
}

public class PerformanceObserverCallbackOptions: BridgedDictionary {
    public convenience init(droppedEntriesCount: UInt64) {
        let object = JSObject.global[.Object].function!.new()
        object[.droppedEntriesCount] = _toJSValue(droppedEntriesCount)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _droppedEntriesCount = ReadWriteAttribute(jsObject: object, name: .droppedEntriesCount)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var droppedEntriesCount: UInt64
}

public class PerformanceObserverEntryList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.PerformanceObserverEntryList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func getEntries() -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntries].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getEntriesByType(type: String) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByType].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }

    @inlinable public func getEntriesByName(name: String, type: String? = nil) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByName].function!(this: this, arguments: [_toJSValue(name), _toJSValue(type)]).fromJSValue()!
    }
}

public class PerformanceObserverInit: BridgedDictionary {
    public convenience init(entryTypes: [String], type: String, buffered: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.entryTypes] = _toJSValue(entryTypes)
        object[.type] = _toJSValue(type)
        object[.buffered] = _toJSValue(buffered)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _entryTypes = ReadWriteAttribute(jsObject: object, name: .entryTypes)
        _type = ReadWriteAttribute(jsObject: object, name: .type)
        _buffered = ReadWriteAttribute(jsObject: object, name: .buffered)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var entryTypes: [String]

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var buffered: Bool
}


