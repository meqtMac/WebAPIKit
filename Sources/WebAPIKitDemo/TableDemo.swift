//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

struct TableDemo: HTML {
    let element: HTMLButtonElement
    
    init(title: String, parent: HTMLElement ) {
        self.element = Button(title: title) {
            while let node = parent.firstChild {
                parent.removeChild(child: node)
            }
            
            let table = HTMLTableElement(from: document.createElement(localName: "table"))!
            let tr0 = HTMLTableRowElement(from: document.createElement(localName: "tr"))!
            let tds = [
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
            ]
            tds[0].innerText = "Hi, I'm your first cell."
            tds[1].innerText = "I'm your second cell."
            tds[2].innerText = "I'm your third cell."
            tds[3].innerText = "I'm your fourth cell."
            for td in tds {
                tr0.appendChild(node: td)
            }
            table.appendChild(node: tr0)
            
            let tr1 = HTMLTableRowElement(from: document.createElement(localName: "tr"))!
            table.appendChild(node: tr1)
            let td1s = [
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
                HTMLTableCellElement(from: document.createElement(localName: "td"))!,
            ]
            td1s[0].innerText = "Second row, first cell."
            td1s[1].innerText = "Cell 2."
            td1s[2].innerText = "Cell 3."
            td1s[3].innerText = "Cell 4."
            for td1 in td1s {
                tr1.appendChild(node: td1)
            }
            
            parent.appendChild(node: table)
        }.element
    }
 
}

