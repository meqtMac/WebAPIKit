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

public class HTMLFrameSetElement: HTMLElement, WindowEventHandlers {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFrameSetElement].function }

    public var cols: String {
        get { jsObject[.cols].fromJSValue()!}
        set { jsObject[.cols] = newValue.jsValue }
    }

    public var rows: String {
        get { jsObject[.rows].fromJSValue()!}
        set { jsObject[.rows] = newValue.jsValue }
    }
}
