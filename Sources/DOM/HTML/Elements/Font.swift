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

public class HTMLFontElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFontElement].function }

   public var color: String {
        get { jsObject[.color].fromJSValue()!}
        set { jsObject[.color] = newValue.jsValue }
    }

    public var face: String {
        get { jsObject[.face].fromJSValue()!}
        set { jsObject[.face] = newValue.jsValue }
 
    }

    public var size: String {
        get { jsObject[.size].fromJSValue()!}
        set { jsObject[.size] = newValue.jsValue }
    }
}
