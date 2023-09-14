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

public class HTMLVideoElement: HTMLMediaElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLVideoElement].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _width = ReadWriteAttribute(jsObject: jsObject, name: .width)
        _height = ReadWriteAttribute(jsObject: jsObject, name: .height)
        _videoWidth = ReadonlyAttribute(jsObject: jsObject, name: .videoWidth)
        _videoHeight = ReadonlyAttribute(jsObject: jsObject, name: .videoHeight)
        _poster = ReadWriteAttribute(jsObject: jsObject, name: .poster)
        _playsInline = ReadWriteAttribute(jsObject: jsObject, name: .playsInline)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ReadWriteAttribute
    public var width: UInt32

    @ReadWriteAttribute
    public var height: UInt32

    @ReadonlyAttribute
    public var videoWidth: UInt32

    @ReadonlyAttribute
    public var videoHeight: UInt32

    @ReadWriteAttribute
    public var poster: String

    @ReadWriteAttribute
    public var playsInline: Bool
}