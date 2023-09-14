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

public class HTMLTrackElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTrackElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _kind = ReadWriteAttribute(jsObject: jsObject, name: .kind)
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _srclang = ReadWriteAttribute(jsObject: jsObject, name: .srclang)
        _label = ReadWriteAttribute(jsObject: jsObject, name: .label)
        _default = ReadWriteAttribute(jsObject: jsObject, name: .default)
        _readyState = ReadonlyAttribute(jsObject: jsObject, name: .readyState)
        _track = ReadonlyAttribute(jsObject: jsObject, name: .track)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var kind: String

    @ReadWriteAttribute
    public var src: String

    @ReadWriteAttribute
    public var srclang: String

    @ReadWriteAttribute
    public var label: String

    @ReadWriteAttribute
    public var `default`: Bool

    public static let NONE: UInt16 = 0

    public static let LOADING: UInt16 = 1

    public static let LOADED: UInt16 = 2

    public static let ERROR: UInt16 = 3

    @ReadonlyAttribute
    public var readyState: UInt16

    @ReadonlyAttribute
    public var track: TextTrack
}