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

public class HTMLFrameElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFrameElement].function }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var scrolling: String {
        get { jsObject[.scrolling].fromJSValue()!}
        set { jsObject[.scrolling] = newValue.jsValue }
    }

    public var src: String {
        get { jsObject[.src].fromJSValue()!}
        set { jsObject[.src] = newValue.jsValue }
    }

    public var frameBorder: String {
        get { jsObject[.frameBorder].fromJSValue()!}
        set { jsObject[.frameBorder] = newValue.jsValue }
    }

    public var longDesc: String {
        get { jsObject[.longDesc].fromJSValue()!}
        set { jsObject[.longDesc] = newValue.jsValue }
    }

    public var noResize: Bool {
        get { jsObject[.noResize].fromJSValue()!}
        set { jsObject[.noResize] = newValue.jsValue }
    }

public var contentDocument: Document? {
jsObject[.contentDocument].fromJSValue()
    }

public var contentWindow: WindowProxy? {
jsObject[.contentWindow].fromJSValue()
    }

    public var marginHeight: String {
        get { jsObject[.marginHeight].fromJSValue()!}
        set { jsObject[.marginHeight] = newValue.jsValue }
    }

    public var marginWidth: String {
        get { jsObject[.marginWidth].fromJSValue()!}
        set { jsObject[.marginWidth] = newValue.jsValue }
    }
}
