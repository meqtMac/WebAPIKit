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

public class HTMLMediaElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMediaElement].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _error = ReadonlyAttribute(jsObject: jsObject, name: .error)
        _src = ReadWriteAttribute(jsObject: jsObject, name: .src)
        _srcObject = ReadWriteAttribute(jsObject: jsObject, name: .srcObject)
        _currentSrc = ReadonlyAttribute(jsObject: jsObject, name: .currentSrc)
        _crossOrigin = ReadWriteAttribute(jsObject: jsObject, name: .crossOrigin)
        _networkState = ReadonlyAttribute(jsObject: jsObject, name: .networkState)
        _preload = ReadWriteAttribute(jsObject: jsObject, name: .preload)
        _buffered = ReadonlyAttribute(jsObject: jsObject, name: .buffered)
        _readyState = ReadonlyAttribute(jsObject: jsObject, name: .readyState)
        _seeking = ReadonlyAttribute(jsObject: jsObject, name: .seeking)
        _currentTime = ReadWriteAttribute(jsObject: jsObject, name: .currentTime)
        _duration = ReadonlyAttribute(jsObject: jsObject, name: .duration)
        _paused = ReadonlyAttribute(jsObject: jsObject, name: .paused)
        _defaultPlaybackRate = ReadWriteAttribute(jsObject: jsObject, name: .defaultPlaybackRate)
        _playbackRate = ReadWriteAttribute(jsObject: jsObject, name: .playbackRate)
        _preservesPitch = ReadWriteAttribute(jsObject: jsObject, name: .preservesPitch)
        _played = ReadonlyAttribute(jsObject: jsObject, name: .played)
        _seekable = ReadonlyAttribute(jsObject: jsObject, name: .seekable)
        _ended = ReadonlyAttribute(jsObject: jsObject, name: .ended)
        _autoplay = ReadWriteAttribute(jsObject: jsObject, name: .autoplay)
        _loop = ReadWriteAttribute(jsObject: jsObject, name: .loop)
        _controls = ReadWriteAttribute(jsObject: jsObject, name: .controls)
        _volume = ReadWriteAttribute(jsObject: jsObject, name: .volume)
        _muted = ReadWriteAttribute(jsObject: jsObject, name: .muted)
        _defaultMuted = ReadWriteAttribute(jsObject: jsObject, name: .defaultMuted)
        _audioTracks = ReadonlyAttribute(jsObject: jsObject, name: .audioTracks)
        _videoTracks = ReadonlyAttribute(jsObject: jsObject, name: .videoTracks)
        _textTracks = ReadonlyAttribute(jsObject: jsObject, name: .textTracks)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @ReadonlyAttribute
    public var error: MediaError?
    
    @ReadWriteAttribute
    public var src: String
    
    @ReadWriteAttribute
    public var srcObject: MediaProvider?
    
    @ReadonlyAttribute
    public var currentSrc: String
    
    @ReadWriteAttribute
    public var crossOrigin: String?
    
    public static let NETWORK_EMPTY: UInt16 = 0
    
    public static let NETWORK_IDLE: UInt16 = 1
    
    public static let NETWORK_LOADING: UInt16 = 2
    
    public static let NETWORK_NO_SOURCE: UInt16 = 3
    
    @ReadonlyAttribute
    public var networkState: UInt16
    
    @ReadWriteAttribute
    public var preload: String
    
    @ReadonlyAttribute
    public var buffered: TimeRanges
    
    @inlinable public func load() {
        let this = jsObject
        _ = this[.load].function!(this: this, arguments: [])
    }
    
    @inlinable public func canPlayType(type: String) -> CanPlayTypeResult {
        let this = jsObject
        return this[.canPlayType].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
    
    public static let HAVE_NOTHING: UInt16 = 0
    
    public static let HAVE_METADATA: UInt16 = 1
    
    public static let HAVE_CURRENT_DATA: UInt16 = 2
    
    public static let HAVE_FUTURE_DATA: UInt16 = 3
    
    public static let HAVE_ENOUGH_DATA: UInt16 = 4
    
    @ReadonlyAttribute
    public var readyState: UInt16
    
    @ReadonlyAttribute
    public var seeking: Bool
    
    @ReadWriteAttribute
    public var currentTime: Double
    
    @inlinable public func fastSeek(time: Double) {
        let this = jsObject
        _ = this[.fastSeek].function!(this: this, arguments: [_toJSValue(time)])
    }
    
    @ReadonlyAttribute
    public var duration: Double
    
    @inlinable public func getStartDate() -> JSObject {
        let this = jsObject
        return this[.getStartDate].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @ReadonlyAttribute
    public var paused: Bool
    
    @ReadWriteAttribute
    public var defaultPlaybackRate: Double
    
    @ReadWriteAttribute
    public var playbackRate: Double
    
    @ReadWriteAttribute
    public var preservesPitch: Bool
    
    @ReadonlyAttribute
    public var played: TimeRanges
    
    @ReadonlyAttribute
    public var seekable: TimeRanges
    
    @ReadonlyAttribute
    public var ended: Bool
    
    @ReadWriteAttribute
    public var autoplay: Bool
    
    @ReadWriteAttribute
    public var loop: Bool
    
    @inlinable public func play() -> JSPromise {
        let this = jsObject
        return this[.play].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func play() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.play].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func pause() {
        let this = jsObject
        _ = this[.pause].function!(this: this, arguments: [])
    }
    
    @ReadWriteAttribute
    public var controls: Bool
    
    @ReadWriteAttribute
    public var volume: Double
    
    @ReadWriteAttribute
    public var muted: Bool
    
    @ReadWriteAttribute
    public var defaultMuted: Bool
    
    @ReadonlyAttribute
    public var audioTracks: AudioTrackList
    
    @ReadonlyAttribute
    public var videoTracks: VideoTrackList
    
    @ReadonlyAttribute
    public var textTracks: TextTrackList
    
    @inlinable public func addTextTrack(kind: TextTrackKind, label: String? = nil, language: String? = nil) -> TextTrack {
        let this = jsObject
        return this[.addTextTrack].function!(this: this, arguments: [_toJSValue(kind), _toJSValue(label), _toJSValue(language)]).fromJSValue()!
        
    }
}

public enum MediaProvider: JSValueCompatible {
    case blob(Blob)
    case mediaSource(MediaSource)
    case mediaStream(MediaStream)

    public static func construct(from value: JSValue) -> Self? {
        if let blob: Blob = value.fromJSValue() {
            return .blob(blob)
        }
        if let mediaSource: MediaSource = value.fromJSValue() {
            return .mediaSource(mediaSource)
        }
        if let mediaStream: MediaStream = value.fromJSValue() {
            return .mediaStream(mediaStream)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .blob(blob):
            return blob.jsValue
        case let .mediaSource(mediaSource):
            return mediaSource.jsValue
        case let .mediaStream(mediaStream):
            return mediaStream.jsValue
        }
    }
}