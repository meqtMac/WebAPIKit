//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import Foundation
import DOM
import JavaScriptKit
import WebAPIBase
import WebGL1
import WebGL2
//import WebGPU

struct WebGLElement: HTMLProtocol {
    let element: HTMLButtonElement
    
//    private static func
    
    static let vertextShaderSource = """
    attribute vec4 aVertexPosition;
    uniform mat4 uModelViewMatrix;
    uniform mat4 uProjectionMatrix;
    void main() {
        gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
    }
    """
    
    static let fragmentShaderSource = """
    void main() {
        gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
    }
    """
    
    init(parent: HTMLElement) {
        let button = Button(title: "WebGL") {
            parent.jsObject.innerHTML = ""
            let width: UInt32 = 640
            let height: UInt32 = 480
            let canvas = Canvas(width: width, height: height)
            
            _ = parent.jsValue.appendChild(canvas.element.jsValue)
            let gl = canvas.webGLContext
            
            let program = try! gl.setupShaderProgram(vSource: Self.vertextShaderSource, fSource: Self.fragmentShaderSource)
            
            let positionAttributeLocation = GLuint(gl.getAttribLocation(program: program, name: "aVertexPosition"))
            let projectionMatrix = gl.getUniformLocation(program: program, name: "uProjectionMatrix")
            let modelViewMatrix = gl.getUniformLocation(program: program, name: "uModelViewMatrix")
                    gl.clearColor(red: 0, green: 0, blue: 0, alpha: 0)
            gl.clearDepth(depth: 1)
            gl.enable(cap: WebGLRenderingContext.DEPTH_TEST)
            gl.depthFunc(func: WebGLRenderingContext.LEQUAL)
            
            gl.clear(mask: WebGLRenderingContext.COLOR_BUFFER_BIT | WebGLRenderingContext.DEPTH_BUFFER_BIT)
            
            let fov = (45.0 * .pi) / 180
            
            let aspect = Double(canvas.element.clientWidth) / Double(canvas.element.clientHeight)
            let zNear = 0.1
            let zFar = 0.1
        
            // set position attribute
            let positionbuffer = try! gl.initPostionBuffer()
            gl.bindBuffer(target: WebGLRenderingContext.ARRAY_BUFFER, buffer: positionbuffer)
            gl.vertexAttribPointer(index: positionAttributeLocation, 
                                   size: 2,
                                   type: WebGLRenderingContext.FLOAT,
                                   normalized: false,
                                   stride: 0,
                                   offset: 0)
            gl.enableVertexAttribArray(index: positionAttributeLocation)
            
//            gl.useProgram(program: program)
//            gl.uniformMatrix4fv(location: projectionMatrix, transpose: false, value: <#T##Float32List#>)
//            gl.uniformMatrix4fv(location: modelViewMatrix, transpose: false, value: <#T##Float32List#>)
//            gl.uniformMatrix4fv(location: <#T##WebGLUniformLocation?#>, transpose: <#T##GLboolean#>, value: <#T##Float32List#>)
//            
//            gl.drawArrays(mode: WebGLRenderingContext.TRIANGLE_STRIP, first: 0, count: 4)
            
       }
        self.element = button.element
    }
    
}


extension Canvas {
    var webGLContext: WebGLRenderingContext {
        element.getContext(WebGLRenderingContext.self)!
    }
}

extension WebGLRenderingContext {
    enum WebGLExampleError: Error {
        case createShaderFailed
        case createProgramFailed
    }
}


extension WebGLRenderingContext {
    func createShader(type: GLenum, source: String) throws -> WebGLShader  {
        guard let shader = createShader(type: type) else {
            throw WebGLExampleError.createShaderFailed
        }
        shaderSource(shader: shader, source: source)
        compileShader(shader: shader)
        
        switch getShaderParameter(shader: shader, pname: Self.COMPILE_STATUS) {
        case .undefined, .boolean(false):
            if let log = getShaderInfoLog(shader: shader) {
                console.log(data: log.jsValue)
            }
            deleteShader(shader: shader)
            throw WebGLExampleError.createShaderFailed
        default:
            return shader
        }
    }
    
    func createProgram(vShader: WebGLShader, fShader: WebGLShader) throws -> WebGLProgram {
        guard let program = createProgram() else {
            throw WebGLExampleError.createProgramFailed
        }
        
        attachShader(program: program, shader: vShader)
        attachShader(program: program, shader: fShader)
        linkProgram(program: program)
        
        switch getProgramParameter(program: program, pname: Self.LINK_STATUS) {
        case .undefined, .boolean(false):
            if let log = getProgramInfoLog(program: program) {
                console.log(data: log.jsValue)
            }
            deleteProgram(program: program)
            throw WebGLExampleError.createProgramFailed
        default:
            return program
        }
    }
    
    func setupShaderProgram(vSource: String, fSource: String) throws -> WebGLProgram {
        let vertexShader = try self.createShader(type: WebGLRenderingContext.VERTEX_SHADER, source: vSource)
        let fragmentShader = try self.createShader(type: WebGLRenderingContext.FRAGMENT_SHADER, source: fSource)
        
        return try self.createProgram(vShader: vertexShader, fShader: fragmentShader)
    }
    
    func initPostionBuffer() throws -> WebGLBuffer {
        let positionBuffer = self.createBuffer()
        
        self.bindBuffer(target: Self.ARRAY_BUFFER, buffer: positionBuffer)
        
        let positions: [Float32] = [1.0, 1.0, -1.0,
                         1.0, 1.0, -1.0,
                         -1.0, -1.0]
        
        self.bufferData(target: Self.ARRAY_BUFFER, data: .arrayBuffer(Float32Array(positions).arrayBuffer), usage: Self.STATIC_DRAW)
        
        return positionBuffer!
    }
}
