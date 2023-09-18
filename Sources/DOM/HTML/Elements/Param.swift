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

public class HTMLParamElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLParamElement].function }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var value: String {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

    public var valueType: String {
        get { jsObject[.valueType].fromJSValue()!}
        set { jsObject[.valueType] = newValue.jsValue }
    }
}
