//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase

public class DataTransfer: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DataTransfer].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _dropEffect = ReadWriteAttribute(jsObject: jsObject, name: .dropEffect)
        _effectAllowed = ReadWriteAttribute(jsObject: jsObject, name: .effectAllowed)
        _items = ReadonlyAttribute(jsObject: jsObject, name: .items)
        _types = ReadonlyAttribute(jsObject: jsObject, name: .types)
        _files = ReadonlyAttribute(jsObject: jsObject, name: .files)
        self.jsObject = jsObject
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var dropEffect: String

    @ReadWriteAttribute
    public var effectAllowed: String

    @ReadonlyAttribute
    public var items: DataTransferItemList

    @inlinable public func setDragImage(image: Element, x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.setDragImage].function!(this: this, arguments: [_toJSValue(image), _toJSValue(x), _toJSValue(y)])
    }

    @ReadonlyAttribute
    public var types: [String]

    @inlinable public func getData(format: String) -> String {
        let this = jsObject
        return this[.getData].function!(this: this, arguments: [_toJSValue(format)]).fromJSValue()!
    }

    @inlinable public func setData(format: String, data: String) {
        let this = jsObject
        _ = this[.setData].function!(this: this, arguments: [_toJSValue(format), _toJSValue(data)])
    }

    @inlinable public func clearData(format: String? = nil) {
        let this = jsObject
        _ = this[.clearData].function!(this: this, arguments: [_toJSValue(format)])
    }

    @ReadonlyAttribute
    public var files: FileList
}

public class DataTransferItem: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DataTransferItem].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _kind = ReadonlyAttribute(jsObject: jsObject, name: .kind)
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var kind: String

    @ReadonlyAttribute
    public var type: String

    @inlinable public func getAsString(callback: FunctionStringCallback?) {
        let this = jsObject
        _ = this[.getAsString].function!(this: this, arguments: [_toJSValue(callback)])
    }

    @inlinable public func getAsFile() -> File? {
        let this = jsObject
        return this[.getAsFile].function!(this: this, arguments: []).fromJSValue()
    }
}

public class DataTransferItemList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DataTransferItemList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> DataTransferItem {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func add(data: String, type: String) -> DataTransferItem? {
        let this = jsObject
        return this[.add].function!(this: this, arguments: [_toJSValue(data), _toJSValue(type)]).fromJSValue()
    }

    @inlinable public func add(data: File) -> DataTransferItem? {
        let this = jsObject
        return this[.add].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()
    }

    @inlinable public func remove(index: UInt32) {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: [_toJSValue(index)])
    }

    @inlinable public func clear() {
        let this = jsObject
        _ = this[.clear].function!(this: this, arguments: [])
    }
}

