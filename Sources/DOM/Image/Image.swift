//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class ImageBitmap: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageBitmap].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _width = ReadonlyAttribute(jsObject: jsObject, name: .width)
        _height = ReadonlyAttribute(jsObject: jsObject, name: .height)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var width: UInt32

    @ReadonlyAttribute
    public var height: UInt32

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
}

public class ImageBitmapOptions: BridgedDictionary {
    public convenience init(imageOrientation: ImageOrientation, premultiplyAlpha: PremultiplyAlpha, colorSpaceConversion: ColorSpaceConversion, resizeWidth: UInt32, resizeHeight: UInt32, resizeQuality: ResizeQuality) {
        let object = JSObject.global[.Object].function!.new()
        object[.imageOrientation] = _toJSValue(imageOrientation)
        object[.premultiplyAlpha] = _toJSValue(premultiplyAlpha)
        object[.colorSpaceConversion] = _toJSValue(colorSpaceConversion)
        object[.resizeWidth] = _toJSValue(resizeWidth)
        object[.resizeHeight] = _toJSValue(resizeHeight)
        object[.resizeQuality] = _toJSValue(resizeQuality)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _imageOrientation = ReadWriteAttribute(jsObject: object, name: .imageOrientation)
        _premultiplyAlpha = ReadWriteAttribute(jsObject: object, name: .premultiplyAlpha)
        _colorSpaceConversion = ReadWriteAttribute(jsObject: object, name: .colorSpaceConversion)
        _resizeWidth = ReadWriteAttribute(jsObject: object, name: .resizeWidth)
        _resizeHeight = ReadWriteAttribute(jsObject: object, name: .resizeHeight)
        _resizeQuality = ReadWriteAttribute(jsObject: object, name: .resizeQuality)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var imageOrientation: ImageOrientation

    @ReadWriteAttribute
    public var premultiplyAlpha: PremultiplyAlpha

    @ReadWriteAttribute
    public var colorSpaceConversion: ColorSpaceConversion

    @ReadWriteAttribute
    public var resizeWidth: UInt32

    @ReadWriteAttribute
    public var resizeHeight: UInt32

    @ReadWriteAttribute
    public var resizeQuality: ResizeQuality
}

public class ImageBitmapRenderingContext: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageBitmapRenderingContext].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _canvas = ReadonlyAttribute(jsObject: jsObject, name: .canvas)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var canvas: HTMLCanvasElement_or_OffscreenCanvas

    @inlinable public func transferFromImageBitmap(bitmap: ImageBitmap?) {
        let this = jsObject
        _ = this[.transferFromImageBitmap].function!(this: this, arguments: [_toJSValue(bitmap)])
    }
}

public class ImageBitmapRenderingContextSettings: BridgedDictionary {
    public convenience init(alpha: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.alpha] = _toJSValue(alpha)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _alpha = ReadWriteAttribute(jsObject: object, name: .alpha)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var alpha: Bool
}

public class ImageData: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageData].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _width = ReadonlyAttribute(jsObject: jsObject, name: .width)
        _height = ReadonlyAttribute(jsObject: jsObject, name: .height)
        _data = ReadonlyAttribute(jsObject: jsObject, name: .data)
        _colorSpace = ReadonlyAttribute(jsObject: jsObject, name: .colorSpace)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(sw: UInt32, sh: UInt32, settings: ImageDataSettings? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(sw), _toJSValue(sh), _toJSValue(settings)]))
    }

    @inlinable public convenience init(data: Uint8ClampedArray, sw: UInt32, sh: UInt32? = nil, settings: ImageDataSettings? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(data), _toJSValue(sw), _toJSValue(sh), _toJSValue(settings)]))
    }

    @ReadonlyAttribute
    public var width: UInt32

    @ReadonlyAttribute
    public var height: UInt32

    @ReadonlyAttribute
    public var data: Uint8ClampedArray

    @ReadonlyAttribute
    public var colorSpace: PredefinedColorSpace
}

public class ImageDataSettings: BridgedDictionary {
    public convenience init(colorSpace: PredefinedColorSpace) {
        let object = JSObject.global[.Object].function!.new()
        object[.colorSpace] = _toJSValue(colorSpace)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _colorSpace = ReadWriteAttribute(jsObject: object, name: .colorSpace)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var colorSpace: PredefinedColorSpace
}

public class ImageDecodeOptions: BridgedDictionary {
    public convenience init(frameIndex: UInt32, completeFramesOnly: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.frameIndex] = _toJSValue(frameIndex)
        object[.completeFramesOnly] = _toJSValue(completeFramesOnly)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _frameIndex = ReadWriteAttribute(jsObject: object, name: .frameIndex)
        _completeFramesOnly = ReadWriteAttribute(jsObject: object, name: .completeFramesOnly)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var frameIndex: UInt32

    @ReadWriteAttribute
    public var completeFramesOnly: Bool
}

public class ImageDecodeResult: BridgedDictionary {
    public convenience init(image: VideoFrame, complete: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.image] = _toJSValue(image)
        object[.complete] = _toJSValue(complete)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _image = ReadWriteAttribute(jsObject: object, name: .image)
        _complete = ReadWriteAttribute(jsObject: object, name: .complete)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var image: VideoFrame

    @ReadWriteAttribute
    public var complete: Bool
}

public class ImageDecoder: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageDecoder].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _type = ReadonlyAttribute(jsObject: jsObject, name: .type)
        _complete = ReadonlyAttribute(jsObject: jsObject, name: .complete)
        _completed = ReadonlyAttribute(jsObject: jsObject, name: .completed)
        _tracks = ReadonlyAttribute(jsObject: jsObject, name: .tracks)
        self.jsObject = jsObject
    }

    @inlinable public convenience init(init: ImageDecoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }

    @ReadonlyAttribute
    public var type: String

    @ReadonlyAttribute
    public var complete: Bool

    @ReadonlyAttribute
    public var completed: JSPromise

    @ReadonlyAttribute
    public var tracks: ImageTrackList

    @inlinable public func decode(options: ImageDecodeOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.decode].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func decode(options: ImageDecodeOptions? = nil) async throws -> ImageDecodeResult {
        let this = jsObject
        let _promise: JSPromise = this[.decode].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }

    @inlinable public class func isTypeSupported(type: String) -> JSPromise {
        let this = constructor!
        return this[.isTypeSupported].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isTypeSupported(type: String) async throws -> Bool {
        let this = constructor!
        let _promise: JSPromise = this[.isTypeSupported].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class ImageDecoderInit: BridgedDictionary {
    public convenience init(type: String, data: ImageBufferSource, colorSpaceConversion: ColorSpaceConversion, desiredWidth: UInt32, desiredHeight: UInt32, preferAnimation: Bool, transfer: [ArrayBuffer]) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.data] = _toJSValue(data)
        object[.colorSpaceConversion] = _toJSValue(colorSpaceConversion)
        object[.desiredWidth] = _toJSValue(desiredWidth)
        object[.desiredHeight] = _toJSValue(desiredHeight)
        object[.preferAnimation] = _toJSValue(preferAnimation)
        object[.transfer] = _toJSValue(transfer)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _type = ReadWriteAttribute(jsObject: object, name: .type)
        _data = ReadWriteAttribute(jsObject: object, name: .data)
        _colorSpaceConversion = ReadWriteAttribute(jsObject: object, name: .colorSpaceConversion)
        _desiredWidth = ReadWriteAttribute(jsObject: object, name: .desiredWidth)
        _desiredHeight = ReadWriteAttribute(jsObject: object, name: .desiredHeight)
        _preferAnimation = ReadWriteAttribute(jsObject: object, name: .preferAnimation)
        _transfer = ReadWriteAttribute(jsObject: object, name: .transfer)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var data: ImageBufferSource

    @ReadWriteAttribute
    public var colorSpaceConversion: ColorSpaceConversion

    @ReadWriteAttribute
    public var desiredWidth: UInt32

    @ReadWriteAttribute
    public var desiredHeight: UInt32

    @ReadWriteAttribute
    public var preferAnimation: Bool

    @ReadWriteAttribute
    public var transfer: [ArrayBuffer]
}

public enum ImageBufferSource: JSValueCompatible {
    case bufferSource(BufferSource)
    case readableStream(ReadableStream)

    public static func construct(from value: JSValue) -> Self? {
        if let bufferSource: BufferSource = value.fromJSValue() {
            return .bufferSource(bufferSource)
        }
        if let readableStream: ReadableStream = value.fromJSValue() {
            return .readableStream(readableStream)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .bufferSource(bufferSource):
            return bufferSource.jsValue
        case let .readableStream(readableStream):
            return readableStream.jsValue
        }
    }
}

public class ImageEncodeOptions: BridgedDictionary {
    public convenience init(type: String, quality: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.quality] = _toJSValue(quality)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _type = ReadWriteAttribute(jsObject: object, name: .type)
        _quality = ReadWriteAttribute(jsObject: object, name: .quality)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var type: String

    @ReadWriteAttribute
    public var quality: Double
}

public enum ImageOrientation: JSString, JSValueCompatible {
    case fromImage = "from-image"
    case flipY = "flipY"

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

public enum ImageSmoothingQuality: JSString, JSValueCompatible {
    case low = "low"
    case medium = "medium"
    case high = "high"

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

public class ImageTrack: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageTrack].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _animated = ReadonlyAttribute(jsObject: jsObject, name: .animated)
        _frameCount = ReadonlyAttribute(jsObject: jsObject, name: .frameCount)
        _repetitionCount = ReadonlyAttribute(jsObject: jsObject, name: .repetitionCount)
        _selected = ReadWriteAttribute(jsObject: jsObject, name: .selected)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var animated: Bool

    @ReadonlyAttribute
    public var frameCount: UInt32

    @ReadonlyAttribute
    public var repetitionCount: Float

    @ReadWriteAttribute
    public var selected: Bool
}

public class ImageTrackList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageTrackList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _ready = ReadonlyAttribute(jsObject: jsObject, name: .ready)
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        _selectedIndex = ReadonlyAttribute(jsObject: jsObject, name: .selectedIndex)
        _selectedTrack = ReadonlyAttribute(jsObject: jsObject, name: .selectedTrack)
        self.jsObject = jsObject
    }

    @inlinable public subscript(key: Int) -> ImageTrack {
        jsObject[key].fromJSValue()!
    }

    @ReadonlyAttribute
    public var ready: JSPromise

    @ReadonlyAttribute
    public var length: UInt32

    @ReadonlyAttribute
    public var selectedIndex: Int32

    @ReadonlyAttribute
    public var selectedTrack: ImageTrack?
}

