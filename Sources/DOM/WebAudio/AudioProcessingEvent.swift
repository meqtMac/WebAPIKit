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

public typealias AudioDataOutputCallback = (AudioData) -> Void

public class AudioProcessingEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.AudioProcessingEvent].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _playbackTime = ReadonlyAttribute(jsObject: jsObject, name: .playbackTime)
        _inputBuffer = ReadonlyAttribute(jsObject: jsObject, name: .inputBuffer)
        _outputBuffer = ReadonlyAttribute(jsObject: jsObject, name: .outputBuffer)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(type: String, eventInitDict: AudioProcessingEventInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

    @ReadonlyAttribute
    public var playbackTime: Double

    @ReadonlyAttribute
    public var inputBuffer: AudioBuffer

    @ReadonlyAttribute
    public var outputBuffer: AudioBuffer
}

public class AudioProcessingEventInit: BridgedDictionary {
    public convenience init(playbackTime: Double, inputBuffer: AudioBuffer, outputBuffer: AudioBuffer) {
        let object = JSObject.global[.Object].function!.new()
        object[.playbackTime] = _toJSValue(playbackTime)
        object[.inputBuffer] = _toJSValue(inputBuffer)
        object[.outputBuffer] = _toJSValue(outputBuffer)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _playbackTime = ReadWriteAttribute(jsObject: object, name: .playbackTime)
        _inputBuffer = ReadWriteAttribute(jsObject: object, name: .inputBuffer)
        _outputBuffer = ReadWriteAttribute(jsObject: object, name: .outputBuffer)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var playbackTime: Double

    @ReadWriteAttribute
    public var inputBuffer: AudioBuffer

    @ReadWriteAttribute
    public var outputBuffer: AudioBuffer
}
