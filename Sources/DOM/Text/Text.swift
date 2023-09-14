//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import JavaScriptKit
import WebAPIBase
import JavaScriptEventLoop

public class Text: CharacterData, Slottable, GeometryUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Text].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _wholeText = ReadonlyAttribute(jsObject: jsObject, name: .wholeText)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(data: String? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(data)]))
    }

    @inlinable public func splitText(offset: UInt32) -> Self {
        let this = jsObject
        return this[.splitText].function!(this: this, arguments: [_toJSValue(offset)]).fromJSValue()!
    }

    @ReadonlyAttribute
    public var wholeText: String
}

public class TextMetrics: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TextMetrics].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _width = ReadonlyAttribute(jsObject: jsObject, name: .width)
        _actualBoundingBoxLeft = ReadonlyAttribute(jsObject: jsObject, name: .actualBoundingBoxLeft)
        _actualBoundingBoxRight = ReadonlyAttribute(jsObject: jsObject, name: .actualBoundingBoxRight)
        _fontBoundingBoxAscent = ReadonlyAttribute(jsObject: jsObject, name: .fontBoundingBoxAscent)
        _fontBoundingBoxDescent = ReadonlyAttribute(jsObject: jsObject, name: .fontBoundingBoxDescent)
        _actualBoundingBoxAscent = ReadonlyAttribute(jsObject: jsObject, name: .actualBoundingBoxAscent)
        _actualBoundingBoxDescent = ReadonlyAttribute(jsObject: jsObject, name: .actualBoundingBoxDescent)
        _emHeightAscent = ReadonlyAttribute(jsObject: jsObject, name: .emHeightAscent)
        _emHeightDescent = ReadonlyAttribute(jsObject: jsObject, name: .emHeightDescent)
        _hangingBaseline = ReadonlyAttribute(jsObject: jsObject, name: .hangingBaseline)
        _alphabeticBaseline = ReadonlyAttribute(jsObject: jsObject, name: .alphabeticBaseline)
        _ideographicBaseline = ReadonlyAttribute(jsObject: jsObject, name: .ideographicBaseline)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var width: Double

    @ReadonlyAttribute
    public var actualBoundingBoxLeft: Double

    @ReadonlyAttribute
    public var actualBoundingBoxRight: Double

    @ReadonlyAttribute
    public var fontBoundingBoxAscent: Double

    @ReadonlyAttribute
    public var fontBoundingBoxDescent: Double

    @ReadonlyAttribute
    public var actualBoundingBoxAscent: Double

    @ReadonlyAttribute
    public var actualBoundingBoxDescent: Double

    @ReadonlyAttribute
    public var emHeightAscent: Double

    @ReadonlyAttribute
    public var emHeightDescent: Double

    @ReadonlyAttribute
    public var hangingBaseline: Double

    @ReadonlyAttribute
    public var alphabeticBaseline: Double

    @ReadonlyAttribute
    public var ideographicBaseline: Double
}

public class TextTrack: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TextTrack].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _kind = ReadonlyAttribute(jsObject: jsObject, name: .kind)
        _label = ReadonlyAttribute(jsObject: jsObject, name: .label)
        _language = ReadonlyAttribute(jsObject: jsObject, name: .language)
        _id = ReadonlyAttribute(jsObject: jsObject, name: .id)
        _inBandMetadataTrackDispatchType = ReadonlyAttribute(jsObject: jsObject, name: .inBandMetadataTrackDispatchType)
        _mode = ReadWriteAttribute(jsObject: jsObject, name: .mode)
        _cues = ReadonlyAttribute(jsObject: jsObject, name: .cues)
        _activeCues = ReadonlyAttribute(jsObject: jsObject, name: .activeCues)
        _oncuechange = ClosureAttribute1Optional(jsObject: jsObject, name: .oncuechange)
        _sourceBuffer = ReadonlyAttribute(jsObject: jsObject, name: .sourceBuffer)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var kind: TextTrackKind

    @ReadonlyAttribute
    public var label: String

    @ReadonlyAttribute
    public var language: String

    @ReadonlyAttribute
    public var id: String

    @ReadonlyAttribute
    public var inBandMetadataTrackDispatchType: String

    @ReadWriteAttribute
    public var mode: TextTrackMode

    @ReadonlyAttribute
    public var cues: TextTrackCueList?

    @ReadonlyAttribute
    public var activeCues: TextTrackCueList?

    @inlinable public func addCue(cue: TextTrackCue) {
        let this = jsObject
        _ = this[.addCue].function!(this: this, arguments: [_toJSValue(cue)])
    }

    @inlinable public func removeCue(cue: TextTrackCue) {
        let this = jsObject
        _ = this[.removeCue].function!(this: this, arguments: [_toJSValue(cue)])
    }

    @ClosureAttribute1Optional
    public var oncuechange: EventHandler

    @ReadonlyAttribute
    public var sourceBuffer: SourceBuffer?
}

public class TextTrackCue: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TextTrackCue].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _track = ReadonlyAttribute(jsObject: jsObject, name: .track)
        _id = ReadWriteAttribute(jsObject: jsObject, name: .id)
        _startTime = ReadWriteAttribute(jsObject: jsObject, name: .startTime)
        _endTime = ReadWriteAttribute(jsObject: jsObject, name: .endTime)
        _pauseOnExit = ReadWriteAttribute(jsObject: jsObject, name: .pauseOnExit)
        _onenter = ClosureAttribute1Optional(jsObject: jsObject, name: .onenter)
        _onexit = ClosureAttribute1Optional(jsObject: jsObject, name: .onexit)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var track: TextTrack?

    @ReadWriteAttribute
    public var id: String

    @ReadWriteAttribute
    public var startTime: Double

    @ReadWriteAttribute
    public var endTime: Double

    @ReadWriteAttribute
    public var pauseOnExit: Bool

    @ClosureAttribute1Optional
    public var onenter: EventHandler

    @ClosureAttribute1Optional
    public var onexit: EventHandler
}

public class TextTrackCueList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TextTrackCueList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> TextTrackCue {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func getCueById(id: String) -> TextTrackCue? {
        let this = jsObject
        return this[.getCueById].function!(this: this, arguments: [_toJSValue(id)]).fromJSValue()
    }
}

public enum TextTrackKind: JSString, JSValueCompatible {
    case subtitles = "subtitles"
    case captions = "captions"
    case descriptions = "descriptions"
    case chapters = "chapters"
    case metadata = "metadata"

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

public class TextTrackList: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TextTrackList].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _length = ReadonlyAttribute(jsObject: jsObject, name: .length)
        _onchange = ClosureAttribute1Optional(jsObject: jsObject, name: .onchange)
        _onaddtrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onaddtrack)
        _onremovetrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onremovetrack)
        super.init(unsafelyWrapping: jsObject)
    }

    @ReadonlyAttribute
    public var length: UInt32

    @inlinable public subscript(key: Int) -> TextTrack {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func getTrackById(id: String) -> TextTrack? {
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

public enum TextTrackMode: JSString, JSValueCompatible {
    case disabled = "disabled"
    case hidden = "hidden"
    case showing = "showing"

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

