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

public class AbstractRange: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.AbstractRange].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _startContainer = ReadonlyAttribute(jsObject: jsObject, name: .startContainer)
        _startOffset = ReadonlyAttribute(jsObject: jsObject, name: .startOffset)
        _endContainer = ReadonlyAttribute(jsObject: jsObject, name: .endContainer)
        _endOffset = ReadonlyAttribute(jsObject: jsObject, name: .endOffset)
        _collapsed = ReadonlyAttribute(jsObject: jsObject, name: .collapsed)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var startContainer: Node

    @ReadonlyAttribute
    public var startOffset: UInt32

    @ReadonlyAttribute
    public var endContainer: Node

    @ReadonlyAttribute
    public var endOffset: UInt32

    @ReadonlyAttribute
    public var collapsed: Bool
}


public class ConstrainDoubleRange: BridgedDictionary {
    public convenience init(exact: Double, ideal: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.exact] = _toJSValue(exact)
        object[.ideal] = _toJSValue(ideal)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _exact = ReadWriteAttribute(jsObject: object, name: .exact)
        _ideal = ReadWriteAttribute(jsObject: object, name: .ideal)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var exact: Double

    @ReadWriteAttribute
    public var ideal: Double
}

public class ConstrainULongRange: BridgedDictionary {
    public convenience init(exact: UInt32, ideal: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.exact] = _toJSValue(exact)
        object[.ideal] = _toJSValue(ideal)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _exact = ReadWriteAttribute(jsObject: object, name: .exact)
        _ideal = ReadWriteAttribute(jsObject: object, name: .ideal)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var exact: UInt32

    @ReadWriteAttribute
    public var ideal: UInt32
}

public class DoubleRange: BridgedDictionary {
    public convenience init(max: Double, min: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.max] = _toJSValue(max)
        object[.min] = _toJSValue(min)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _max = ReadWriteAttribute(jsObject: object, name: .max)
        _min = ReadWriteAttribute(jsObject: object, name: .min)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var max: Double

    @ReadWriteAttribute
    public var min: Double
}

public class Range: AbstractRange {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Range].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _commonAncestorContainer = ReadonlyAttribute(jsObject: jsObject, name: .commonAncestorContainer)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadonlyAttribute
    public var commonAncestorContainer: Node

    @inlinable public func setStart(node: Node, offset: UInt32) {
        let this = jsObject
        _ = this[.setStart].function!(this: this, arguments: [_toJSValue(node), _toJSValue(offset)])
    }

    @inlinable public func setEnd(node: Node, offset: UInt32) {
        let this = jsObject
        _ = this[.setEnd].function!(this: this, arguments: [_toJSValue(node), _toJSValue(offset)])
    }

    @inlinable public func setStartBefore(node: Node) {
        let this = jsObject
        _ = this[.setStartBefore].function!(this: this, arguments: [_toJSValue(node)])
    }

    @inlinable public func setStartAfter(node: Node) {
        let this = jsObject
        _ = this[.setStartAfter].function!(this: this, arguments: [_toJSValue(node)])
    }

    @inlinable public func setEndBefore(node: Node) {
        let this = jsObject
        _ = this[.setEndBefore].function!(this: this, arguments: [_toJSValue(node)])
    }

    @inlinable public func setEndAfter(node: Node) {
        let this = jsObject
        _ = this[.setEndAfter].function!(this: this, arguments: [_toJSValue(node)])
    }

    @inlinable public func collapse(toStart: Bool? = nil) {
        let this = jsObject
        _ = this[.collapse].function!(this: this, arguments: [_toJSValue(toStart)])
    }

    @inlinable public func selectNode(node: Node) {
        let this = jsObject
        _ = this[.selectNode].function!(this: this, arguments: [_toJSValue(node)])
    }

    @inlinable public func selectNodeContents(node: Node) {
        let this = jsObject
        _ = this[.selectNodeContents].function!(this: this, arguments: [_toJSValue(node)])
    }

    public static let START_TO_START: UInt16 = 0

    public static let START_TO_END: UInt16 = 1

    public static let END_TO_END: UInt16 = 2

    public static let END_TO_START: UInt16 = 3

    @inlinable public func compareBoundaryPoints(how: UInt16, sourceRange: Range) -> Int16 {
        let this = jsObject
        return this[.compareBoundaryPoints].function!(this: this, arguments: [_toJSValue(how), _toJSValue(sourceRange)]).fromJSValue()!
    }

    @inlinable public func deleteContents() {
        let this = jsObject
        _ = this[.deleteContents].function!(this: this, arguments: [])
    }

    @inlinable public func extractContents() -> DocumentFragment {
        let this = jsObject
        return this[.extractContents].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func cloneContents() -> DocumentFragment {
        let this = jsObject
        return this[.cloneContents].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func insertNode(node: Node) {
        let this = jsObject
        _ = this[.insertNode].function!(this: this, arguments: [_toJSValue(node)])
    }

    @inlinable public func surroundContents(newParent: Node) {
        let this = jsObject
        _ = this[.surroundContents].function!(this: this, arguments: [_toJSValue(newParent)])
    }

    @inlinable public func cloneRange() -> Self {
        let this = jsObject
        return this[.cloneRange].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func detach() {
        let this = jsObject
        _ = this[.detach].function!(this: this, arguments: [])
    }

    @inlinable public func isPointInRange(node: Node, offset: UInt32) -> Bool {
        let this = jsObject
        return this[.isPointInRange].function!(this: this, arguments: [_toJSValue(node), _toJSValue(offset)]).fromJSValue()!
    }

    @inlinable public func comparePoint(node: Node, offset: UInt32) -> Int16 {
        let this = jsObject
        return this[.comparePoint].function!(this: this, arguments: [_toJSValue(node), _toJSValue(offset)]).fromJSValue()!
    }

    @inlinable public func intersectsNode(node: Node) -> Bool {
        let this = jsObject
        return this[.intersectsNode].function!(this: this, arguments: [_toJSValue(node)]).fromJSValue()!
    }

    @inlinable public var description: String {
        jsObject[.toString]!().fromJSValue()!
    }

    @inlinable public func getClientRects() -> DOMRectList {
        let this = jsObject
        return this[.getClientRects].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getBoundingClientRect() -> DOMRect {
        let this = jsObject
        return this[.getBoundingClientRect].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class StaticRange: AbstractRange {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.StaticRange].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(init: StaticRangeInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
}

public class StaticRangeInit: BridgedDictionary {
    public convenience init(startContainer: Node, startOffset: UInt32, endContainer: Node, endOffset: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.startContainer] = _toJSValue(startContainer)
        object[.startOffset] = _toJSValue(startOffset)
        object[.endContainer] = _toJSValue(endContainer)
        object[.endOffset] = _toJSValue(endOffset)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _startContainer = ReadWriteAttribute(jsObject: object, name: .startContainer)
        _startOffset = ReadWriteAttribute(jsObject: object, name: .startOffset)
        _endContainer = ReadWriteAttribute(jsObject: object, name: .endContainer)
        _endOffset = ReadWriteAttribute(jsObject: object, name: .endOffset)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var startContainer: Node

    @ReadWriteAttribute
    public var startOffset: UInt32

    @ReadWriteAttribute
    public var endContainer: Node

    @ReadWriteAttribute
    public var endOffset: UInt32
}

public class TimeRanges: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TimeRanges].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public func start(index: UInt32) -> Double {
        let this = jsObject
        return this[.start].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
    }

    @inlinable public func end(index: UInt32) -> Double {
        let this = jsObject
        return this[.end].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
    }
}
public class ULongRange: BridgedDictionary {
    public convenience init(max: UInt32, min: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.max] = _toJSValue(max)
        object[.min] = _toJSValue(min)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _max = ReadWriteAttribute(jsObject: object, name: .max)
        _min = ReadWriteAttribute(jsObject: object, name: .min)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var max: UInt32

    @ReadWriteAttribute
    public var min: UInt32
}
public enum ConstrainDouble: JSValueCompatible {
    case constrainDoubleRange(ConstrainDoubleRange)
    case double(Double)

   public static func construct(from value: JSValue) -> Self? {
        if let constrainDoubleRange: ConstrainDoubleRange = value.fromJSValue() {
            return .constrainDoubleRange(constrainDoubleRange)
        }
        if let double: Double = value.fromJSValue() {
            return .double(double)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .constrainDoubleRange(constrainDoubleRange):
            return constrainDoubleRange.jsValue
        case let .double(double):
            return double.jsValue
        }
    }
}

public enum ConstrainULong: JSValueCompatible {
    case constrainULongRange(ConstrainULongRange)
    case uInt32(UInt32)

   public static func construct(from value: JSValue) -> Self? {
        if let constrainULongRange: ConstrainULongRange = value.fromJSValue() {
            return .constrainULongRange(constrainULongRange)
        }
        if let uInt32: UInt32 = value.fromJSValue() {
            return .uInt32(uInt32)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .constrainULongRange(constrainULongRange):
            return constrainULongRange.jsValue
        case let .uInt32(uInt32):
            return uInt32.jsValue
        }
    }
}