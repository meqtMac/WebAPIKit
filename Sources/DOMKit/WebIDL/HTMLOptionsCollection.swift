// This file was auto-generated by WebIDLToSwift. DO NOT EDIT!

import JavaScriptEventLoop
import JavaScriptKit

public class HTMLOptionsCollection: HTMLCollection {
    @inlinable override public class var constructor: JSFunction { JSObject.global[Strings.HTMLOptionsCollection].function! }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadWriteAttribute(jsObject: jsObject, name: Strings.length)
        _selectedIndex = ReadWriteAttribute(jsObject: jsObject, name: Strings.selectedIndex)
        super.init(unsafelyWrapping: jsObject)
    }

    @usableFromInline let _length: ReadWriteAttribute<UInt32>
    @inlinable override public var length: UInt32 {
        get { _length.wrappedValue }
        set { _length.wrappedValue = newValue }
    }

    // XXX: unsupported setter for keys of type UInt32

    @inlinable public func add(element: HTMLOptGroupElement_or_HTMLOptionElement, before: HTMLElement_or_Int32? = nil) {
        let this = jsObject
        _ = this[Strings.add].function!(this: this, arguments: [element.jsValue, before?.jsValue ?? .undefined])
    }

    @inlinable public func remove(index: Int32) {
        let this = jsObject
        _ = this[Strings.remove].function!(this: this, arguments: [index.jsValue])
    }

    @ReadWriteAttribute
    public var selectedIndex: Int32
}