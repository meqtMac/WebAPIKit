//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public enum VideoColorPrimaries: JSString, JSValueCompatible {
    case bt709 = "bt709"
    case bt470bg = "bt470bg"
    case smpte170m = "smpte170m"
    case bt2020 = "bt2020"
    case smpte432 = "smpte432"

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

public class VideoColorSpace: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.VideoColorSpace].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _primaries = ReadonlyAttribute(jsObject: jsObject, name: .primaries)
        _transfer = ReadonlyAttribute(jsObject: jsObject, name: .transfer)
        _matrix = ReadonlyAttribute(jsObject: jsObject, name: .matrix)
        _fullRange = ReadonlyAttribute(jsObject: jsObject, name: .fullRange)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(init: VideoColorSpaceInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var primaries: VideoColorPrimaries?

    @ReadonlyAttribute
    public var transfer: VideoTransferCharacteristics?

    @ReadonlyAttribute
    public var matrix: VideoMatrixCoefficients?

    @ReadonlyAttribute
    public var fullRange: Bool?

    @inlinable public func toJSON() -> VideoColorSpaceInit {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class VideoColorSpaceInit: BridgedDictionary {
    public convenience init(primaries: VideoColorPrimaries?, transfer: VideoTransferCharacteristics?, matrix: VideoMatrixCoefficients?, fullRange: Bool?) {
        let object = JSObject.global[.Object].function!.new()
        object[.primaries] = _toJSValue(primaries)
        object[.transfer] = _toJSValue(transfer)
        object[.matrix] = _toJSValue(matrix)
        object[.fullRange] = _toJSValue(fullRange)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _primaries = ReadWriteAttribute(jsObject: object, name: .primaries)
        _transfer = ReadWriteAttribute(jsObject: object, name: .transfer)
        _matrix = ReadWriteAttribute(jsObject: object, name: .matrix)
        _fullRange = ReadWriteAttribute(jsObject: object, name: .fullRange)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var primaries: VideoColorPrimaries?

    @ReadWriteAttribute
    public var transfer: VideoTransferCharacteristics?

    @ReadWriteAttribute
    public var matrix: VideoMatrixCoefficients?

    @ReadWriteAttribute
    public var fullRange: Bool?
}

public class VideoDecoder: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.VideoDecoder].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _state = ReadonlyAttribute(jsObject: jsObject, name: .state)
        _decodeQueueSize = ReadonlyAttribute(jsObject: jsObject, name: .decodeQueueSize)
        _ondequeue = ClosureAttribute1Optional(jsObject: jsObject, name: .ondequeue)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(init: VideoDecoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var state: CodecState

    @ReadonlyAttribute
    public var decodeQueueSize: UInt32

    @ClosureAttribute1Optional
    public var ondequeue: EventHandler

    @inlinable public func configure(config: VideoDecoderConfig) {
        let this = jsObject
        _ = this[.configure].function!(this: this, arguments: [_toJSValue(config)])
    }

    @inlinable public func decode(chunk: EncodedVideoChunk) {
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

    @inlinable public class func isConfigSupported(config: VideoDecoderConfig) -> JSPromise {
        let this = constructor!
        return this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isConfigSupported(config: VideoDecoderConfig) async throws -> VideoDecoderSupport {
        let this = constructor!
        let _promise: JSPromise = this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class VideoDecoderConfig: BridgedDictionary {
    public convenience init(codec: String, 
                            description: AllowSharedBufferSource,
                            codedWidth: UInt32,
                            codedHeight: UInt32,
                            displayAspectWidth: UInt32,
                            displayAspectHeight: UInt32,
                            colorSpace: VideoColorSpaceInit,
                            hardwareAcceleration: HardwareAcceleration, 
                            optimizeForLatency: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.codec] = _toJSValue(codec)
        object[.description] = _toJSValue(description)
        object[.codedWidth] = _toJSValue(codedWidth)
        object[.codedHeight] = _toJSValue(codedHeight)
        object[.displayAspectWidth] = _toJSValue(displayAspectWidth)
        object[.displayAspectHeight] = _toJSValue(displayAspectHeight)
        object[.colorSpace] = _toJSValue(colorSpace)
        object[.hardwareAcceleration] = _toJSValue(hardwareAcceleration)
        object[.optimizeForLatency] = _toJSValue(optimizeForLatency)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _codec = ReadWriteAttribute(jsObject: object, name: .codec)
        _description = ReadWriteAttribute(jsObject: object, name: .description)
        _codedWidth = ReadWriteAttribute(jsObject: object, name: .codedWidth)
        _codedHeight = ReadWriteAttribute(jsObject: object, name: .codedHeight)
        _displayAspectWidth = ReadWriteAttribute(jsObject: object, name: .displayAspectWidth)
        _displayAspectHeight = ReadWriteAttribute(jsObject: object, name: .displayAspectHeight)
        _colorSpace = ReadWriteAttribute(jsObject: object, name: .colorSpace)
        _hardwareAcceleration = ReadWriteAttribute(jsObject: object, name: .hardwareAcceleration)
        _optimizeForLatency = ReadWriteAttribute(jsObject: object, name: .optimizeForLatency)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var codec: String

    @ReadWriteAttribute
    public var description: AllowSharedBufferSource

    @ReadWriteAttribute
    public var codedWidth: UInt32

    @ReadWriteAttribute
    public var codedHeight: UInt32

    @ReadWriteAttribute
    public var displayAspectWidth: UInt32

    @ReadWriteAttribute
    public var displayAspectHeight: UInt32

    @ReadWriteAttribute
    public var colorSpace: VideoColorSpaceInit

    @ReadWriteAttribute
    public var hardwareAcceleration: HardwareAcceleration

    @ReadWriteAttribute
    public var optimizeForLatency: Bool
}

public enum HardwareAcceleration: JSString, JSValueCompatible {
    case noPreference = "no-preference"
    case preferHardware = "prefer-hardware"
    case preferSoftware = "prefer-software"

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

public class VideoDecoderInit: BridgedDictionary {
    public convenience init(output: @escaping VideoFrameOutputCallback, error: @escaping WebCodecsErrorCallback) {
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
    public var output: VideoFrameOutputCallback

    @ClosureAttribute1Void
    public var error: WebCodecsErrorCallback
}

public class VideoDecoderSupport: BridgedDictionary {
    public convenience init(supported: Bool, config: VideoDecoderConfig) {
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
    public var config: VideoDecoderConfig
}

public class VideoEncoder: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.VideoEncoder].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _state = ReadonlyAttribute(jsObject: jsObject, name: .state)
        _encodeQueueSize = ReadonlyAttribute(jsObject: jsObject, name: .encodeQueueSize)
        _ondequeue = ClosureAttribute1Optional(jsObject: jsObject, name: .ondequeue)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(init: VideoEncoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var state: CodecState

    @ReadonlyAttribute
    public var encodeQueueSize: UInt32

    @ClosureAttribute1Optional
    public var ondequeue: EventHandler

    @inlinable public func configure(config: VideoEncoderConfig) {
        let this = jsObject
        _ = this[.configure].function!(this: this, arguments: [_toJSValue(config)])
    }

    @inlinable public func encode(frame: VideoFrame, options: VideoEncoderEncodeOptions? = nil) {
        let this = jsObject
        _ = this[.encode].function!(this: this, arguments: [_toJSValue(frame), _toJSValue(options)])
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

    @inlinable public class func isConfigSupported(config: VideoEncoderConfig) -> JSPromise {
        let this = constructor!
        return this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isConfigSupported(config: VideoEncoderConfig) async throws -> VideoEncoderSupport {
        let this = constructor!
        let _promise: JSPromise = this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public enum VideoEncoderBitrateMode: JSString, JSValueCompatible {
    case constant = "constant"
    case variable = "variable"
    case quantizer = "quantizer"

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

public class VideoEncoderConfig: BridgedDictionary {
    public convenience init(codec: String, width: UInt32, height: UInt32, displayWidth: UInt32, displayHeight: UInt32, bitrate: UInt64, framerate: Double, hardwareAcceleration: HardwareAcceleration, alpha: AlphaOption, scalabilityMode: String, bitrateMode: VideoEncoderBitrateMode, latencyMode: LatencyMode) {
        let object = JSObject.global[.Object].function!.new()
        object[.codec] = _toJSValue(codec)
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.displayWidth] = _toJSValue(displayWidth)
        object[.displayHeight] = _toJSValue(displayHeight)
        object[.bitrate] = _toJSValue(bitrate)
        object[.framerate] = _toJSValue(framerate)
        object[.hardwareAcceleration] = _toJSValue(hardwareAcceleration)
        object[.alpha] = _toJSValue(alpha)
        object[.scalabilityMode] = _toJSValue(scalabilityMode)
        object[.bitrateMode] = _toJSValue(bitrateMode)
        object[.latencyMode] = _toJSValue(latencyMode)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _codec = ReadWriteAttribute(jsObject: object, name: .codec)
        _width = ReadWriteAttribute(jsObject: object, name: .width)
        _height = ReadWriteAttribute(jsObject: object, name: .height)
        _displayWidth = ReadWriteAttribute(jsObject: object, name: .displayWidth)
        _displayHeight = ReadWriteAttribute(jsObject: object, name: .displayHeight)
        _bitrate = ReadWriteAttribute(jsObject: object, name: .bitrate)
        _framerate = ReadWriteAttribute(jsObject: object, name: .framerate)
        _hardwareAcceleration = ReadWriteAttribute(jsObject: object, name: .hardwareAcceleration)
        _alpha = ReadWriteAttribute(jsObject: object, name: .alpha)
        _scalabilityMode = ReadWriteAttribute(jsObject: object, name: .scalabilityMode)
        _bitrateMode = ReadWriteAttribute(jsObject: object, name: .bitrateMode)
        _latencyMode = ReadWriteAttribute(jsObject: object, name: .latencyMode)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var codec: String

    @ReadWriteAttribute
    public var width: UInt32

    @ReadWriteAttribute
    public var height: UInt32

    @ReadWriteAttribute
    public var displayWidth: UInt32

    @ReadWriteAttribute
    public var displayHeight: UInt32

    @ReadWriteAttribute
    public var bitrate: UInt64

    @ReadWriteAttribute
    public var framerate: Double

    @ReadWriteAttribute
    public var hardwareAcceleration: HardwareAcceleration

    @ReadWriteAttribute
    public var alpha: AlphaOption

    @ReadWriteAttribute
    public var scalabilityMode: String

    @ReadWriteAttribute
    public var bitrateMode: VideoEncoderBitrateMode

    @ReadWriteAttribute
    public var latencyMode: LatencyMode
}

public class VideoEncoderEncodeOptions: BridgedDictionary {
    public convenience init(keyFrame: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.keyFrame] = _toJSValue(keyFrame)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _keyFrame = ReadWriteAttribute(jsObject: object, name: .keyFrame)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var keyFrame: Bool
}

public typealias EncodedVideoChunkOutputCallback = (EncodedVideoChunk, EncodedVideoChunkMetadata) -> Void

public class VideoEncoderInit: BridgedDictionary {
    public convenience init(output: @escaping EncodedVideoChunkOutputCallback, error: @escaping WebCodecsErrorCallback) {
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
    public var output: EncodedVideoChunkOutputCallback

    @ClosureAttribute1Void
    public var error: WebCodecsErrorCallback
}

public class VideoEncoderSupport: BridgedDictionary {
    public convenience init(supported: Bool, config: VideoEncoderConfig) {
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
    public var config: VideoEncoderConfig
}

public enum VideoFacingModeEnum: JSString, JSValueCompatible {
    case user = "user"
    case environment = "environment"
    case left = "left"
    case right = "right"

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

public class VideoFrame: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.VideoFrame].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _format = ReadonlyAttribute(jsObject: jsObject, name: .format)
        _codedWidth = ReadonlyAttribute(jsObject: jsObject, name: .codedWidth)
        _codedHeight = ReadonlyAttribute(jsObject: jsObject, name: .codedHeight)
        _codedRect = ReadonlyAttribute(jsObject: jsObject, name: .codedRect)
        _visibleRect = ReadonlyAttribute(jsObject: jsObject, name: .visibleRect)
        _displayWidth = ReadonlyAttribute(jsObject: jsObject, name: .displayWidth)
        _displayHeight = ReadonlyAttribute(jsObject: jsObject, name: .displayHeight)
        _duration = ReadonlyAttribute(jsObject: jsObject, name: .duration)
        _timestamp = ReadonlyAttribute(jsObject: jsObject, name: .timestamp)
        _colorSpace = ReadonlyAttribute(jsObject: jsObject, name: .colorSpace)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(image: HTMLCanvasElement, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: HTMLOrSVGImageElement, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: HTMLVideoElement, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: ImageBitmap, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: OffscreenCanvas, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: VideoFrame, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }






    @inlinable public convenience init(data: AllowSharedBufferSource, init: VideoFrameBufferInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(data), _toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var format: VideoPixelFormat?

    @ReadonlyAttribute
    public var codedWidth: UInt32

    @ReadonlyAttribute
    public var codedHeight: UInt32

    @ReadonlyAttribute
    public var codedRect: DOMRectReadOnly?

    @ReadonlyAttribute
    public var visibleRect: DOMRectReadOnly?

    @ReadonlyAttribute
    public var displayWidth: UInt32

    @ReadonlyAttribute
    public var displayHeight: UInt32

    @ReadonlyAttribute
    public var duration: UInt64?

    @ReadonlyAttribute
    public var timestamp: Int64

    @ReadonlyAttribute
    public var colorSpace: VideoColorSpace

    @inlinable public func metadata() -> VideoFrameMetadata {
        let this = jsObject
        return this[.metadata].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func allocationSize(options: VideoFrameCopyToOptions? = nil) -> UInt32 {
        let this = jsObject
        return this[.allocationSize].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func copyTo(destination: AllowSharedBufferSource, options: VideoFrameCopyToOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.copyTo].function!(this: this, arguments: [_toJSValue(destination), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func copyTo(destination: AllowSharedBufferSource, options: VideoFrameCopyToOptions? = nil) async throws -> [PlaneLayout] {
        let this = jsObject
        let _promise: JSPromise = this[.copyTo].function!(this: this, arguments: [_toJSValue(destination), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
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

public class VideoFrameBufferInit: BridgedDictionary {
    public convenience init(format: VideoPixelFormat, codedWidth: UInt32, codedHeight: UInt32, timestamp: Int64, duration: UInt64, layout: [PlaneLayout], visibleRect: DOMRectInit, displayWidth: UInt32, displayHeight: UInt32, colorSpace: VideoColorSpaceInit, transfer: [ArrayBuffer]) {
        let object = JSObject.global[.Object].function!.new()
        object[.format] = _toJSValue(format)
        object[.codedWidth] = _toJSValue(codedWidth)
        object[.codedHeight] = _toJSValue(codedHeight)
        object[.timestamp] = _toJSValue(timestamp)
        object[.duration] = _toJSValue(duration)
        object[.layout] = _toJSValue(layout)
        object[.visibleRect] = _toJSValue(visibleRect)
        object[.displayWidth] = _toJSValue(displayWidth)
        object[.displayHeight] = _toJSValue(displayHeight)
        object[.colorSpace] = _toJSValue(colorSpace)
        object[.transfer] = _toJSValue(transfer)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _format = ReadWriteAttribute(jsObject: object, name: .format)
        _codedWidth = ReadWriteAttribute(jsObject: object, name: .codedWidth)
        _codedHeight = ReadWriteAttribute(jsObject: object, name: .codedHeight)
        _timestamp = ReadWriteAttribute(jsObject: object, name: .timestamp)
        _duration = ReadWriteAttribute(jsObject: object, name: .duration)
        _layout = ReadWriteAttribute(jsObject: object, name: .layout)
        _visibleRect = ReadWriteAttribute(jsObject: object, name: .visibleRect)
        _displayWidth = ReadWriteAttribute(jsObject: object, name: .displayWidth)
        _displayHeight = ReadWriteAttribute(jsObject: object, name: .displayHeight)
        _colorSpace = ReadWriteAttribute(jsObject: object, name: .colorSpace)
        _transfer = ReadWriteAttribute(jsObject: object, name: .transfer)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var format: VideoPixelFormat

    @ReadWriteAttribute
    public var codedWidth: UInt32

    @ReadWriteAttribute
    public var codedHeight: UInt32

    @ReadWriteAttribute
    public var timestamp: Int64

    @ReadWriteAttribute
    public var duration: UInt64

    @ReadWriteAttribute
    public var layout: [PlaneLayout]

    @ReadWriteAttribute
    public var visibleRect: DOMRectInit

    @ReadWriteAttribute
    public var displayWidth: UInt32

    @ReadWriteAttribute
    public var displayHeight: UInt32

    @ReadWriteAttribute
    public var colorSpace: VideoColorSpaceInit

    @ReadWriteAttribute
    public var transfer: [ArrayBuffer]
}

public class VideoFrameCopyToOptions: BridgedDictionary {
    public convenience init(rect: DOMRectInit, layout: [PlaneLayout]) {
        let object = JSObject.global[.Object].function!.new()
        object[.rect] = _toJSValue(rect)
        object[.layout] = _toJSValue(layout)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _rect = ReadWriteAttribute(jsObject: object, name: .rect)
        _layout = ReadWriteAttribute(jsObject: object, name: .layout)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var rect: DOMRectInit

    @ReadWriteAttribute
    public var layout: [PlaneLayout]
}

public class VideoFrameInit: BridgedDictionary {
    public convenience init(duration: UInt64, timestamp: Int64, alpha: AlphaOption, visibleRect: DOMRectInit, displayWidth: UInt32, displayHeight: UInt32, metadata: VideoFrameMetadata) {
        let object = JSObject.global[.Object].function!.new()
        object[.duration] = _toJSValue(duration)
        object[.timestamp] = _toJSValue(timestamp)
        object[.alpha] = _toJSValue(alpha)
        object[.visibleRect] = _toJSValue(visibleRect)
        object[.displayWidth] = _toJSValue(displayWidth)
        object[.displayHeight] = _toJSValue(displayHeight)
        object[.metadata] = _toJSValue(metadata)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _duration = ReadWriteAttribute(jsObject: object, name: .duration)
        _timestamp = ReadWriteAttribute(jsObject: object, name: .timestamp)
        _alpha = ReadWriteAttribute(jsObject: object, name: .alpha)
        _visibleRect = ReadWriteAttribute(jsObject: object, name: .visibleRect)
        _displayWidth = ReadWriteAttribute(jsObject: object, name: .displayWidth)
        _displayHeight = ReadWriteAttribute(jsObject: object, name: .displayHeight)
        _metadata = ReadWriteAttribute(jsObject: object, name: .metadata)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var duration: UInt64

    @ReadWriteAttribute
    public var timestamp: Int64

    @ReadWriteAttribute
    public var alpha: AlphaOption

    @ReadWriteAttribute
    public var visibleRect: DOMRectInit

    @ReadWriteAttribute
    public var displayWidth: UInt32

    @ReadWriteAttribute
    public var displayHeight: UInt32

    @ReadWriteAttribute
    public var metadata: VideoFrameMetadata
}

public class VideoFrameMetadata: BridgedDictionary {
    public convenience init() {
        let object = JSObject.global[.Object].function!.new()

        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        super.init(unsafelyWrapping: object)
    }
}

public enum VideoMatrixCoefficients: JSString, JSValueCompatible {
    case rgb = "rgb"
    case bt709 = "bt709"
    case bt470bg = "bt470bg"
    case smpte170m = "smpte170m"
    case bt2020Ncl = "bt2020-ncl"

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

public enum VideoPixelFormat: JSString, JSValueCompatible {
    case i420 = "I420"
    case i420A = "I420A"
    case i422 = "I422"
    case i444 = "I444"
    case nV12 = "NV12"
    case rGBA = "RGBA"
    case rGBX = "RGBX"
    case bGRA = "BGRA"
    case bGRX = "BGRX"

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

public enum VideoResizeModeEnum: JSString, JSValueCompatible {
    case none = "none"
    case cropAndScale = "crop-and-scale"

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

public class VideoTrack: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.VideoTrack].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _id = ReadonlyAttribute(jsObject: jsObject, name: .id)
        _kind = ReadonlyAttribute(jsObject: jsObject, name: .kind)
        _label = ReadonlyAttribute(jsObject: jsObject, name: .label)
        _language = ReadonlyAttribute(jsObject: jsObject, name: .language)
        _selected = ReadWriteAttribute(jsObject: jsObject, name: .selected)
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
    public var selected: Bool

    @ReadonlyAttribute
    public var sourceBuffer: SourceBuffer?
}

public class VideoTrackList: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.VideoTrackList].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        _selectedIndex = ReadonlyAttribute(jsObject: jsObject, name: .selectedIndex)
        _onchange = ClosureAttribute1Optional(jsObject: jsObject, name: .onchange)
        _onaddtrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onaddtrack)
        _onremovetrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onremovetrack)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> VideoTrack {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func getTrackById(id: String) -> VideoTrack? {
        let this = jsObject
        return this[.getTrackById].function!(this: this, arguments: [_toJSValue(id)]).fromJSValue()
    }

    @ReadonlyAttribute
    public var selectedIndex: Int32

    @ClosureAttribute1Optional
    public var onchange: EventHandler

    @ClosureAttribute1Optional
    public var onaddtrack: EventHandler

    @ClosureAttribute1Optional
    public var onremovetrack: EventHandler
}

public enum VideoTransferCharacteristics: JSString, JSValueCompatible {
    case bt709 = "bt709"
    case smpte170m = "smpte170m"
    case iec6196621 = "iec61966-2-1"
    case linear = "linear"
    case pq = "pq"
    case hlg = "hlg"

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

public class EncodedVideoChunk: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.EncodedVideoChunk].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _timestamp = ReadonlyAttribute(jsObject: jsObject, name: .timestamp)
        _duration = ReadonlyAttribute(jsObject: jsObject, name: .duration)
        _byteLength = ReadonlyAttribute(jsObject: jsObject, name: .byteLength)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(init: EncodedVideoChunkInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var type: EncodedVideoChunkType

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

public class EncodedVideoChunkInit: BridgedDictionary {
    public convenience init(type: EncodedVideoChunkType, timestamp: Int64, duration: UInt64, data: AllowSharedBufferSource) {
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
    public var type: EncodedVideoChunkType

    @ReadWriteAttribute
    public var timestamp: Int64

    @ReadWriteAttribute
    public var duration: UInt64

    @ReadWriteAttribute
    public var data: AllowSharedBufferSource
}

public class EncodedVideoChunkMetadata: BridgedDictionary {
    public convenience init(decoderConfig: VideoDecoderConfig, svc: SvcOutputMetadata, alphaSideData: BufferSource) {
        let object = JSObject.global[.Object].function!.new()
        object[.decoderConfig] = _toJSValue(decoderConfig)
        object[.svc] = _toJSValue(svc)
        object[.alphaSideData] = _toJSValue(alphaSideData)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _decoderConfig = ReadWriteAttribute(jsObject: object, name: .decoderConfig)
        _svc = ReadWriteAttribute(jsObject: object, name: .svc)
        _alphaSideData = ReadWriteAttribute(jsObject: object, name: .alphaSideData)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var decoderConfig: VideoDecoderConfig

    @ReadWriteAttribute
    public var svc: SvcOutputMetadata

    @ReadWriteAttribute
    public var alphaSideData: BufferSource
}

public enum EncodedVideoChunkType: JSString, JSValueCompatible {
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
