//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class AudioData: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.AudioData].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _format = ReadonlyAttribute(jsObject: jsObject, name: .format)
        _sampleRate = ReadonlyAttribute(jsObject: jsObject, name: .sampleRate)
        _numberOfFrames = ReadonlyAttribute(jsObject: jsObject, name: .numberOfFrames)
        _numberOfChannels = ReadonlyAttribute(jsObject: jsObject, name: .numberOfChannels)
        _duration = ReadonlyAttribute(jsObject: jsObject, name: .duration)
        _timestamp = ReadonlyAttribute(jsObject: jsObject, name: .timestamp)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(init: AudioDataInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var format: AudioSampleFormat?

    @ReadonlyAttribute
    public var sampleRate: Float

    @ReadonlyAttribute
    public var numberOfFrames: UInt32

    @ReadonlyAttribute
    public var numberOfChannels: UInt32

    @ReadonlyAttribute
    public var duration: UInt64

    @ReadonlyAttribute
    public var timestamp: Int64

    @inlinable public func allocationSize(options: AudioDataCopyToOptions) -> UInt32 {
        let this = jsObject
        return this[.allocationSize].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func copyTo(destination: AllowSharedBufferSource, options: AudioDataCopyToOptions) {
        let this = jsObject
        _ = this[.copyTo].function!(this: this, arguments: [_toJSValue(destination), _toJSValue(options)])
    }

    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
}

public class AudioDataCopyToOptions: BridgedDictionary {
    public convenience init(planeIndex: UInt32, frameOffset: UInt32, frameCount: UInt32, format: AudioSampleFormat) {
        let object = JSObject.global[.Object].function!.new()
        object[.planeIndex] = _toJSValue(planeIndex)
        object[.frameOffset] = _toJSValue(frameOffset)
        object[.frameCount] = _toJSValue(frameCount)
        object[.format] = _toJSValue(format)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _planeIndex = ReadWriteAttribute(jsObject: object, name: .planeIndex)
        _frameOffset = ReadWriteAttribute(jsObject: object, name: .frameOffset)
        _frameCount = ReadWriteAttribute(jsObject: object, name: .frameCount)
        _format = ReadWriteAttribute(jsObject: object, name: .format)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var planeIndex: UInt32

    @ReadWriteAttribute
    public var frameOffset: UInt32

    @ReadWriteAttribute
    public var frameCount: UInt32

    @ReadWriteAttribute
    public var format: AudioSampleFormat
}

public class AudioDataInit: BridgedDictionary {
    public convenience init(format: AudioSampleFormat, sampleRate: Float, numberOfFrames: UInt32, numberOfChannels: UInt32, timestamp: Int64, data: BufferSource, transfer: [ArrayBuffer]) {
        let object = JSObject.global[.Object].function!.new()
        object[.format] = _toJSValue(format)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.numberOfFrames] = _toJSValue(numberOfFrames)
        object[.numberOfChannels] = _toJSValue(numberOfChannels)
        object[.timestamp] = _toJSValue(timestamp)
        object[.data] = _toJSValue(data)
        object[.transfer] = _toJSValue(transfer)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _format = ReadWriteAttribute(jsObject: object, name: .format)
        _sampleRate = ReadWriteAttribute(jsObject: object, name: .sampleRate)
        _numberOfFrames = ReadWriteAttribute(jsObject: object, name: .numberOfFrames)
        _numberOfChannels = ReadWriteAttribute(jsObject: object, name: .numberOfChannels)
        _timestamp = ReadWriteAttribute(jsObject: object, name: .timestamp)
        _data = ReadWriteAttribute(jsObject: object, name: .data)
        _transfer = ReadWriteAttribute(jsObject: object, name: .transfer)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var format: AudioSampleFormat

    @ReadWriteAttribute
    public var sampleRate: Float

    @ReadWriteAttribute
    public var numberOfFrames: UInt32

    @ReadWriteAttribute
    public var numberOfChannels: UInt32

    @ReadWriteAttribute
    public var timestamp: Int64

    @ReadWriteAttribute
    public var data: BufferSource

    @ReadWriteAttribute
    public var transfer: [ArrayBuffer]
}

public class AudioDecoder: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.AudioDecoder].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _state = ReadonlyAttribute(jsObject: jsObject, name: .state)
        _decodeQueueSize = ReadonlyAttribute(jsObject: jsObject, name: .decodeQueueSize)
        _ondequeue = ClosureAttribute1Optional(jsObject: jsObject, name: .ondequeue)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(init: AudioDecoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var state: CodecState

    @ReadonlyAttribute
    public var decodeQueueSize: UInt32

    @ClosureAttribute1Optional
    public var ondequeue: EventHandler

    @inlinable public func configure(config: AudioDecoderConfig) {
        let this = jsObject
        _ = this[.configure].function!(this: this, arguments: [_toJSValue(config)])
    }

    @inlinable public func decode(chunk: EncodedAudioChunk) {
        let this = jsObject
        _ = this[.decode].function!(this: this, arguments: [_toJSValue(chunk)])
    }

    @inlinable public func flush() -> JSPromise {
        let this = jsObject
        return this[.flush].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func flush() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.flush].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }

    @inlinable public class func isConfigSupported(config: AudioDecoderConfig) -> JSPromise {
        let this = constructor!
        return this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isConfigSupported(config: AudioDecoderConfig) async throws -> AudioDecoderSupport {
        let this = constructor!
        let _promise: JSPromise = this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class AudioDecoderConfig: BridgedDictionary {
    public convenience init(codec: String, sampleRate: UInt32, numberOfChannels: UInt32, description: BufferSource) {
        let object = JSObject.global[.Object].function!.new()
        object[.codec] = _toJSValue(codec)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.numberOfChannels] = _toJSValue(numberOfChannels)
        object[.description] = _toJSValue(description)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _codec = ReadWriteAttribute(jsObject: object, name: .codec)
        _sampleRate = ReadWriteAttribute(jsObject: object, name: .sampleRate)
        _numberOfChannels = ReadWriteAttribute(jsObject: object, name: .numberOfChannels)
        _description = ReadWriteAttribute(jsObject: object, name: .description)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var codec: String

    @ReadWriteAttribute
    public var sampleRate: UInt32

    @ReadWriteAttribute
    public var numberOfChannels: UInt32

    @ReadWriteAttribute
    public var description: BufferSource
}

public class AudioDecoderInit: BridgedDictionary {
    public convenience init(output: @escaping AudioDataOutputCallback, error: @escaping WebCodecsErrorCallback) {
        let object = JSObject.global[.Object].function!.new()
        ClosureAttribute1Void[.output, in: object] = output
        ClosureAttribute1Void[.error, in: object] = error
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _output = ClosureAttribute1Void(jsObject: object, name: .output)
        _error = ClosureAttribute1Void(jsObject: object, name: .error)
        super.init(unsafelyWrapping: object)
    }

    @ClosureAttribute1Void
    public var output: AudioDataOutputCallback

    @ClosureAttribute1Void
    public var error: WebCodecsErrorCallback
}

public class AudioDecoderSupport: BridgedDictionary {
    public convenience init(supported: Bool, config: AudioDecoderConfig) {
        let object = JSObject.global[.Object].function!.new()
        object[.supported] = _toJSValue(supported)
        object[.config] = _toJSValue(config)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _supported = ReadWriteAttribute(jsObject: object, name: .supported)
        _config = ReadWriteAttribute(jsObject: object, name: .config)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var supported: Bool

    @ReadWriteAttribute
    public var config: AudioDecoderConfig
}

public class AudioEncoder: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.AudioEncoder].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _state = ReadonlyAttribute(jsObject: jsObject, name: .state)
        _encodeQueueSize = ReadonlyAttribute(jsObject: jsObject, name: .encodeQueueSize)
        _ondequeue = ClosureAttribute1Optional(jsObject: jsObject, name: .ondequeue)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(init: AudioEncoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var state: CodecState

    @ReadonlyAttribute
    public var encodeQueueSize: UInt32

    @ClosureAttribute1Optional
    public var ondequeue: EventHandler

    @inlinable public func configure(config: AudioEncoderConfig) {
        let this = jsObject
        _ = this[.configure].function!(this: this, arguments: [_toJSValue(config)])
    }

    @inlinable public func encode(data: AudioData) {
        let this = jsObject
        _ = this[.encode].function!(this: this, arguments: [_toJSValue(data)])
    }

    @inlinable public func flush() -> JSPromise {
        let this = jsObject
        return this[.flush].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func flush() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.flush].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }

    @inlinable public class func isConfigSupported(config: AudioEncoderConfig) -> JSPromise {
        let this = constructor!
        return this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isConfigSupported(config: AudioEncoderConfig) async throws -> AudioEncoderSupport {
        let this = constructor!
        let _promise: JSPromise = this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class AudioEncoderConfig: BridgedDictionary {
    public convenience init(codec: String, sampleRate: UInt32, numberOfChannels: UInt32, bitrate: UInt64, bitrateMode: BitrateMode) {
        let object = JSObject.global[.Object].function!.new()
        object[.codec] = _toJSValue(codec)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.numberOfChannels] = _toJSValue(numberOfChannels)
        object[.bitrate] = _toJSValue(bitrate)
        object[.bitrateMode] = _toJSValue(bitrateMode)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _codec = ReadWriteAttribute(jsObject: object, name: .codec)
        _sampleRate = ReadWriteAttribute(jsObject: object, name: .sampleRate)
        _numberOfChannels = ReadWriteAttribute(jsObject: object, name: .numberOfChannels)
        _bitrate = ReadWriteAttribute(jsObject: object, name: .bitrate)
        _bitrateMode = ReadWriteAttribute(jsObject: object, name: .bitrateMode)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var codec: String

    @ReadWriteAttribute
    public var sampleRate: UInt32

    @ReadWriteAttribute
    public var numberOfChannels: UInt32

    @ReadWriteAttribute
    public var bitrate: UInt64

    @ReadWriteAttribute
    public var bitrateMode: BitrateMode
}

public typealias EncodedAudioChunkOutputCallback = (EncodedAudioChunk, EncodedAudioChunkMetadata) -> Void

public class AudioEncoderInit: BridgedDictionary {
    public convenience init(output: @escaping EncodedAudioChunkOutputCallback, error: @escaping WebCodecsErrorCallback) {
        let object = JSObject.global[.Object].function!.new()
        ClosureAttribute2Void[.output, in: object] = output
        ClosureAttribute1Void[.error, in: object] = error
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _output = ClosureAttribute2Void(jsObject: object, name: .output)
        _error = ClosureAttribute1Void(jsObject: object, name: .error)
        super.init(unsafelyWrapping: object)
    }

    @ClosureAttribute2Void
    public var output: EncodedAudioChunkOutputCallback

    @ClosureAttribute1Void
    public var error: WebCodecsErrorCallback
}

public class AudioEncoderSupport: BridgedDictionary {
    public convenience init(supported: Bool, config: AudioEncoderConfig) {
        let object = JSObject.global[.Object].function!.new()
        object[.supported] = _toJSValue(supported)
        object[.config] = _toJSValue(config)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _supported = ReadWriteAttribute(jsObject: object, name: .supported)
        _config = ReadWriteAttribute(jsObject: object, name: .config)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var supported: Bool

    @ReadWriteAttribute
    public var config: AudioEncoderConfig
}

public enum AudioSampleFormat: JSString, JSValueCompatible {
    case u8 = "u8"
    case s16 = "s16"
    case s32 = "s32"
    case f32 = "f32"
    case u8Planar = "u8-planar"
    case s16Planar = "s16-planar"
    case s32Planar = "s32-planar"
    case f32Planar = "f32-planar"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public class AudioTrack: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.AudioTrack].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _id = ReadonlyAttribute(jsObject: jsObject, name: .id)
        _kind = ReadonlyAttribute(jsObject: jsObject, name: .kind)
        _label = ReadonlyAttribute(jsObject: jsObject, name: .label)
        _language = ReadonlyAttribute(jsObject: jsObject, name: .language)
        _enabled = ReadWriteAttribute(jsObject: jsObject, name: .enabled)
        _sourceBuffer = ReadonlyAttribute(jsObject: jsObject, name: .sourceBuffer)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var id: String

    @ReadonlyAttribute
    public var kind: String

    @ReadonlyAttribute
    public var label: String

    @ReadonlyAttribute
    public var language: String

    @ReadWriteAttribute
    public var enabled: Bool

    @ReadonlyAttribute
    public var sourceBuffer: SourceBuffer?
}

public class AudioTrackList: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.AudioTrackList].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        _onchange = ClosureAttribute1Optional(jsObject: jsObject, name: .onchange)
        _onaddtrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onaddtrack)
        _onremovetrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onremovetrack)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> AudioTrack {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func getTrackById(id: String) -> AudioTrack? {
        let this = jsObject
        return this[.getTrackById].function!(this: this, arguments: [_toJSValue(id)]).fromJSValue()
    }

    @ClosureAttribute1Optional
    public var onchange: EventHandler

    @ClosureAttribute1Optional
    public var onaddtrack: EventHandler

    @ClosureAttribute1Optional
    public var onremovetrack: EventHandler
}

public class EncodedAudioChunk: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.EncodedAudioChunk].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _timestamp = ReadonlyAttribute(jsObject: jsObject, name: .timestamp)
        _duration = ReadonlyAttribute(jsObject: jsObject, name: .duration)
        _byteLength = ReadonlyAttribute(jsObject: jsObject, name: .byteLength)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(init: EncodedAudioChunkInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var type: EncodedAudioChunkType

    @ReadonlyAttribute
    public var timestamp: Int64

    @ReadonlyAttribute
    public var duration: UInt64?

    @ReadonlyAttribute
    public var byteLength: UInt32

    @inlinable public func copyTo(destination: AllowSharedBufferSource) {
        let this = jsObject
        _ = this[.copyTo].function!(this: this, arguments: [_toJSValue(destination)])
    }
}

public class EncodedAudioChunkInit: BridgedDictionary {
    public convenience init(type: EncodedAudioChunkType, timestamp: Int64, duration: UInt64, data: BufferSource) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.timestamp] = _toJSValue(timestamp)
        object[.duration] = _toJSValue(duration)
        object[.data] = _toJSValue(data)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _type = ReadWriteAttribute(jsObject: object, name: .type)
        _timestamp = ReadWriteAttribute(jsObject: object, name: .timestamp)
        _duration = ReadWriteAttribute(jsObject: object, name: .duration)
        _data = ReadWriteAttribute(jsObject: object, name: .data)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var type: EncodedAudioChunkType

    @ReadWriteAttribute
    public var timestamp: Int64

    @ReadWriteAttribute
    public var duration: UInt64

    @ReadWriteAttribute
    public var data: BufferSource
}

public class EncodedAudioChunkMetadata: BridgedDictionary {
    public convenience init(decoderConfig: AudioDecoderConfig) {
        let object = JSObject.global[.Object].function!.new()
        object[.decoderConfig] = _toJSValue(decoderConfig)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _decoderConfig = ReadWriteAttribute(jsObject: object, name: .decoderConfig)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var decoderConfig: AudioDecoderConfig
}

public enum EncodedAudioChunkType: JSString, JSValueCompatible {
    case key = "key"
    case delta = "delta"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

