//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/8/29.
//

import Foundation
import DOM
import WebAPIBase

let document = globalThis.document

@resultBuilder
enum HTMLBuilder {
    public typealias Component = [any HTML]
    
    static func buildBlock(_ components: any HTML...) -> Component {
        return components
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    public static func buildExpression(_ expression: any HTML) -> Component {
        return [expression]
    }
    
    public static func buildEither(first component: Component) -> Component {
        return component
    }
    
    public static func buildEither(second component: Component) -> Component {
        return component
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        if let component {
            return component
        } else {
            return []
        }
    }
}

protocol HTML {
    associatedtype Element: HTMLElement
    var element: Element { get }
}

struct Button: HTML {
    let element: HTMLButtonElement
    
    init(title: String) {
        self.element = HTMLButtonElement(from: document.createElement(localName: "button"))!
        element.innerText = title
    }
    
    init(title: String, onClick: @escaping () -> Void ) {
        self.element = HTMLButtonElement(from: document.createElement(localName: "button"))!
        element.innerText = title
        element.onclick = { _ in
            onClick()
            return .undefined
        }
    }
}

struct Div: HTML {
    let element: HTMLDivElement
    
    init() {
        self.element = HTMLDivElement(from: document.createElement(localName: "div"))!
    }
    
    init(@HTMLBuilder content: () -> [any HTML] ) {
        element = HTMLDivElement(from: document.createElement(localName: "div"))!
        for child in content() {
            element.appendChild(node: child.element)
        }
    }
}

struct Canvas: HTML {
    internal let element: HTMLCanvasElement
    var context: CanvasRenderingContext2D {
        element.getContext(CanvasRenderingContext2D.self)!
    }
    
    init(width: UInt32, height: UInt32) {
        element = HTMLCanvasElement(from: document.createElement(localName: "canvas"))!
        element.width = width
        element.height = height
    }
}

extension HTMLElement {
    public  func removeChilds() {
        while let node = self.firstChild {
            self.removeChild(child: node)
        }
    }
}

//struct
