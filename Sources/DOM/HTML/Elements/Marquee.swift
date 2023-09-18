//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

//import Foundation
//import ECMAScript
//import JavaScriptBigIntSupport
//import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class HTMLMarqueeElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMarqueeElement].function }

    public var behavior: String {
        get { jsObject[.behavior].fromJSValue()!}
        set { jsObject[.behavior] = newValue.jsValue }
    }

    public var bgColor: String {
        get { jsObject[.bgColor].fromJSValue()!}
        set { jsObject[.bgColor] = newValue.jsValue }
    }

    public var direction: String {
        get { jsObject[.direction].fromJSValue()!}
        set { jsObject[.direction] = newValue.jsValue }
    }

    public var height: String {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }

    public var hspace: UInt32 {
        get { jsObject[.hspace].fromJSValue()!}
        set { jsObject[.hspace] = newValue.jsValue }
    }

    public var loop: Int32 {
        get { jsObject[.loop].fromJSValue()!}
        set { jsObject[.loop] = newValue.jsValue }
    }

    public var scrollAmount: UInt32 {
        get { jsObject[.scrollAmount].fromJSValue()!}
        set { jsObject[.scrollAmount] = newValue.jsValue }
    }

    public var scrollDelay: UInt32 {
        get { jsObject[.scrollDelay].fromJSValue()!}
        set { jsObject[.scrollDelay] = newValue.jsValue }
    }

    public var trueSpeed: Bool {
        get { jsObject[.trueSpeed].fromJSValue()!}
        set { jsObject[.trueSpeed] = newValue.jsValue }
    }

    public var vspace: UInt32 {
        get { jsObject[.vspace].fromJSValue()!}
        set { jsObject[.vspace] = newValue.jsValue }
    }

    public var width: String {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }

    @inlinable public func start() {
        let this = jsObject
        _ = this[.start].function!(this: this, arguments: [])
    }

    @inlinable public func stop() {
        let this = jsObject
        _ = this[.stop].function!(this: this, arguments: [])
    }
}
