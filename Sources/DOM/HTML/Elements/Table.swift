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

public class HTMLTableCaptionElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableCaptionElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var align: String
}

public class HTMLTableCellElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableCellElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _colSpan = ReadWriteAttribute(jsObject: jsObject, name: .colSpan)
        _rowSpan = ReadWriteAttribute(jsObject: jsObject, name: .rowSpan)
        _headers = ReadWriteAttribute(jsObject: jsObject, name: .headers)
        _cellIndex = ReadonlyAttribute(jsObject: jsObject, name: .cellIndex)
        _scope = ReadWriteAttribute(jsObject: jsObject, name: .scope)
        _abbr = ReadWriteAttribute(jsObject: jsObject, name: .abbr)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _axis = ReadWriteAttribute(jsObject: jsObject, name: .axis)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _ch = ReadWriteAttribute(jsObject: jsObject, name: .ch)
        _chOff = ReadWriteAttribute(jsObject: jsObject, name: .chOff)
        _noWrap = ReadWriteAttribute(jsObject: jsObject, name: .noWrap)
        _vAlign = ReadWriteAttribute(jsObject: jsObject, name: .vAlign)
        _bgColor = ReadWriteAttribute(jsObject: jsObject, name: .bgColor)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var colSpan: UInt32

    @ReadWriteAttribute
    public var rowSpan: UInt32

    @ReadWriteAttribute
    public var headers: String

    @ReadonlyAttribute
    public var cellIndex: Int32

    @ReadWriteAttribute
    public var scope: String

    @ReadWriteAttribute
    public var abbr: String

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var axis: String

    @ReadWriteAttribute
    public var height: String

    @ReadWriteAttribute
    public var width: String

    @ReadWriteAttribute
    public var ch: String

    @ReadWriteAttribute
    public var chOff: String

    @ReadWriteAttribute
    public var noWrap: Bool

    @ReadWriteAttribute
    public var vAlign: String

    @ReadWriteAttribute
    public var bgColor: String
}

public class HTMLTableColElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableColElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _span = ReadWriteAttribute(jsObject: jsObject, name: .span)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _ch = ReadWriteAttribute(jsObject: jsObject, name: .ch)
        _chOff = ReadWriteAttribute(jsObject: jsObject, name: .chOff)
        _vAlign = ReadWriteAttribute(jsObject: jsObject, name: .vAlign)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var span: UInt32

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var ch: String

    @ReadWriteAttribute
    public var chOff: String

    @ReadWriteAttribute
    public var vAlign: String

    @ReadWriteAttribute
    public var width: String
}

public class HTMLTableElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _caption = ReadWriteAttribute(jsObject: jsObject, name: .caption)
        _tHead = ReadWriteAttribute(jsObject: jsObject, name: .tHead)
        _tFoot = ReadWriteAttribute(jsObject: jsObject, name: .tFoot)
        _tBodies = ReadonlyAttribute(jsObject: jsObject, name: .tBodies)
        _rows = ReadonlyAttribute(jsObject: jsObject, name: .rows)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _border = ReadWriteAttribute(jsObject: jsObject, name: .border)
        _frame = ReadWriteAttribute(jsObject: jsObject, name: .frame)
        _rules = ReadWriteAttribute(jsObject: jsObject, name: .rules)
        _summary = ReadWriteAttribute(jsObject: jsObject, name: .summary)
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _bgColor = ReadWriteAttribute(jsObject: jsObject, name: .bgColor)
        _cellPadding = ReadWriteAttribute(jsObject: jsObject, name: .cellPadding)
        _cellSpacing = ReadWriteAttribute(jsObject: jsObject, name: .cellSpacing)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var caption: HTMLTableCaptionElement?

    @inlinable public func createCaption() -> HTMLTableCaptionElement {
        let this = jsObject
        return this[.createCaption].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func deleteCaption() {
        let this = jsObject
        _ = this[.deleteCaption].function!(this: this, arguments: [])
    }

    @ReadWriteAttribute
    public var tHead: HTMLTableSectionElement?

    @inlinable public func createTHead() -> HTMLTableSectionElement {
        let this = jsObject
        return this[.createTHead].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func deleteTHead() {
        let this = jsObject
        _ = this[.deleteTHead].function!(this: this, arguments: [])
    }

    @ReadWriteAttribute
    public var tFoot: HTMLTableSectionElement?

    @inlinable public func createTFoot() -> HTMLTableSectionElement {
        let this = jsObject
        return this[.createTFoot].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func deleteTFoot() {
        let this = jsObject
        _ = this[.deleteTFoot].function!(this: this, arguments: [])
    }

    @ReadonlyAttribute
    public var tBodies: HTMLCollection

    @inlinable public func createTBody() -> HTMLTableSectionElement {
        let this = jsObject
        return this[.createTBody].function!(this: this, arguments: []).fromJSValue()!
    }

    @ReadonlyAttribute
    public var rows: HTMLCollection

    @inlinable public func insertRow(index: Int32? = nil) -> HTMLTableRowElement {
        let this = jsObject
        return this[.insertRow].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
    }

    @inlinable public func deleteRow(index: Int32) {
        let this = jsObject
        _ = this[.deleteRow].function!(this: this, arguments: [_toJSValue(index)])
    }

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var border: String

    @ReadWriteAttribute
    public var frame: String

    @ReadWriteAttribute
    public var rules: String

    @ReadWriteAttribute
    public var summary: String

    @ReadWriteAttribute
    public var width: String

    @ReadWriteAttribute
    public var bgColor: String

    @ReadWriteAttribute
    public var cellPadding: String

    @ReadWriteAttribute
    public var cellSpacing: String
}

public class HTMLTableRowElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableRowElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _rowIndex = ReadonlyAttribute(jsObject: jsObject, name: .rowIndex)
        _sectionRowIndex = ReadonlyAttribute(jsObject: jsObject, name: .sectionRowIndex)
        _cells = ReadonlyAttribute(jsObject: jsObject, name: .cells)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _ch = ReadWriteAttribute(jsObject: jsObject, name: .ch)
        _chOff = ReadWriteAttribute(jsObject: jsObject, name: .chOff)
        _vAlign = ReadWriteAttribute(jsObject: jsObject, name: .vAlign)
        _bgColor = ReadWriteAttribute(jsObject: jsObject, name: .bgColor)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadonlyAttribute
    public var rowIndex: Int32

    @ReadonlyAttribute
    public var sectionRowIndex: Int32

    @ReadonlyAttribute
    public var cells: HTMLCollection

    @inlinable public func insertCell(index: Int32? = nil) -> HTMLTableCellElement {
        let this = jsObject
        return this[.insertCell].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
    }

    @inlinable public func deleteCell(index: Int32) {
        let this = jsObject
        _ = this[.deleteCell].function!(this: this, arguments: [_toJSValue(index)])
    }

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var ch: String

    @ReadWriteAttribute
    public var chOff: String

    @ReadWriteAttribute
    public var vAlign: String

    @ReadWriteAttribute
    public var bgColor: String
}

public class HTMLTableSectionElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableSectionElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _rows = ReadonlyAttribute(jsObject: jsObject, name: .rows)
        _align = ReadWriteAttribute(jsObject: jsObject, name: .align)
        _ch = ReadWriteAttribute(jsObject: jsObject, name: .ch)
        _chOff = ReadWriteAttribute(jsObject: jsObject, name: .chOff)
        _vAlign = ReadWriteAttribute(jsObject: jsObject, name: .vAlign)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadonlyAttribute
    public var rows: HTMLCollection

    @inlinable public func insertRow(index: Int32? = nil) -> HTMLTableRowElement {
        let this = jsObject
        return this[.insertRow].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
    }

    @inlinable public func deleteRow(index: Int32) {
        let this = jsObject
        _ = this[.deleteRow].function!(this: this, arguments: [_toJSValue(index)])
    }

    @ReadWriteAttribute
    public var align: String

    @ReadWriteAttribute
    public var ch: String

    @ReadWriteAttribute
    public var chOff: String

    @ReadWriteAttribute
    public var vAlign: String
}
