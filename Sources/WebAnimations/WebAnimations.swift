// This file was auto-generated by WebIDLToSwift. DO NOT EDIT!

import DOM
import ECMAScript
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public protocol Animatable: JSBridgedClass {}
public extension Animatable {
    @inlinable func animate(keyframes: JSObject?, options: Double_or_KeyframeAnimationOptions? = nil) -> Animation {
        return jsObject["animate"].function!(this: jsObject, arguments: [_toJSValue(keyframes), _toJSValue(options)]).fromJSValue()!
    }

    @inlinable func getAnimations(options: GetAnimationsOptions? = nil) -> [Animation] {
        return jsObject["getAnimations"].function!(this: jsObject, arguments: [_toJSValue(options)]).fromJSValue()!
    }
}

extension Element: Animatable {}

public class Animation: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global["Animation"].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
       _onfinish = ClosureAttribute1Optional(jsObject: jsObject, name: "onfinish")
        _oncancel = ClosureAttribute1Optional(jsObject: jsObject, name: "oncancel")
        _onremove = ClosureAttribute1Optional(jsObject: jsObject, name: "onremove")
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(effect: AnimationEffect? = nil, timeline: AnimationTimeline? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(effect), _toJSValue(timeline)]))
    }

    public var id: String {
        get { jsObject["id"].fromJSValue()!}
        set { jsObject["id"] = newValue.jsValue }
    }

    public var effect: AnimationEffect? {
        get { jsObject["effect"].fromJSValue()}
        set { jsObject["effect"] = newValue.jsValue }
    }

    public var timeline: AnimationTimeline? {
        get { jsObject["timeline"].fromJSValue()}
        set { jsObject["timeline"] = newValue.jsValue }
    }

    public var playbackRate: Double {
        get { jsObject["playbackRate"].fromJSValue()!}
        set { jsObject["playbackRate"] = newValue.jsValue }
    }

    public var playState: AnimationPlayState {
        jsObject["playState"].fromJSValue()!
    }
    
    public var replaceState: AnimationReplaceState {
        jsObject["replaceState"].fromJSValue()!
    }

public var pending: Bool {
jsObject["pending"].fromJSValue()!
    }

    public var ready: JSPromise {
        jsObject["ready"].fromJSValue()!
    }
    
public var finished: JSPromise {
jsObject["finished"].fromJSValue()!
    }

    @ClosureAttribute1Optional
    public var onfinish: EventHandler

    @ClosureAttribute1Optional
    public var oncancel: EventHandler

    @ClosureAttribute1Optional
    public var onremove: EventHandler

    @inlinable public func cancel() {
        _ = jsObject["cancel"].function!(this: jsObject, arguments: [])
    }

    @inlinable public func finish() {
        _ = jsObject["finish"].function!(this: jsObject, arguments: [])
    }

    @inlinable public func play() {
        _ = jsObject["play"].function!(this: jsObject, arguments: [])
    }

    @inlinable public func pause() {
        _ = jsObject["pause"].function!(this: jsObject, arguments: [])
    }

    @inlinable public func updatePlaybackRate(playbackRate: Double) {
        _ = jsObject["updatePlaybackRate"].function!(this: jsObject, arguments: [_toJSValue(playbackRate)])
    }

    @inlinable public func reverse() {
        _ = jsObject["reverse"].function!(this: jsObject, arguments: [])
    }

    @inlinable public func persist() {
        _ = jsObject["persist"].function!(this: jsObject, arguments: [])
    }

    @inlinable public func commitStyles() {
        _ = jsObject["commitStyles"].function!(this: jsObject, arguments: [])
    }
}

public class AnimationEffect: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global["AnimationEffect"].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func getTiming() -> EffectTiming {
        return jsObject["getTiming"].function!(this: jsObject, arguments: []).fromJSValue()!
    }

    @inlinable public func getComputedTiming() -> ComputedEffectTiming {
        return jsObject["getComputedTiming"].function!(this: jsObject, arguments: []).fromJSValue()!
    }

    @inlinable public func updateTiming(timing: OptionalEffectTiming? = nil) {
        _ = jsObject["updateTiming"].function!(this: jsObject, arguments: [_toJSValue(timing)])
    }
}

public enum AnimationPlayState: JSString, JSValueCompatible {
    case idle = "idle"
    case running = "running"
    case paused = "paused"
    case finished = "finished"

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

public enum AnimationReplaceState: JSString, JSValueCompatible {
    case active = "active"
    case removed = "removed"
    case persisted = "persisted"

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

public class AnimationTimeline: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global["AnimationTimeline"].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
}

public class BaseComputedKeyframe: BridgedDictionary {
    public convenience init(offset: Double?, computedOffset: Double, easing: String, composite: CompositeOperationOrAuto) {
        let object = JSObject.global["Object"].function!.new()
        object["offset"] = _toJSValue(offset)
        object["computedOffset"] = _toJSValue(computedOffset)
        object["easing"] = _toJSValue(easing)
        object["composite"] = _toJSValue(composite)
        self.init(unsafelyWrapping: object)
    }

    public var offset: Double? {
        get { jsObject["offset"].fromJSValue()}
        set { jsObject["offset"] = newValue.jsValue }
    }

    public var computedOffset: Double {
        get { jsObject["computedOffset"].fromJSValue()!}
        set { jsObject["computedOffset"] = newValue.jsValue }
    }

    public var easing: String {
        get { jsObject["easing"].fromJSValue()!}
        set { jsObject["easing"] = newValue.jsValue }
    }

    public var composite: CompositeOperationOrAuto {
        get { jsObject["composite"].fromJSValue()!}
        set { jsObject["composite"] = newValue.jsValue }
    }
}

public class BaseKeyframe: BridgedDictionary {
    public convenience init(offset: Double?, easing: String, composite: CompositeOperationOrAuto) {
        let object = JSObject.global["Object"].function!.new()
        object["offset"] = _toJSValue(offset)
        object["easing"] = _toJSValue(easing)
        object["composite"] = _toJSValue(composite)
        self.init(unsafelyWrapping: object)
    }

    public var offset: Double? {
        get { jsObject["offset"].fromJSValue()}
        set { jsObject["offset"] = newValue.jsValue }
    }

    public var easing: String {
        get { jsObject["easing"].fromJSValue()!}
        set { jsObject["easing"] = newValue.jsValue }
    }

    public var composite: CompositeOperationOrAuto {
        get { jsObject["composite"].fromJSValue()!}
        set { jsObject["composite"] = newValue.jsValue }
    }
}

public class BasePropertyIndexedKeyframe: BridgedDictionary {
    public convenience init(offset: nullable_Double_or_seq_of_nullable_Double, easing: String_or_seq_of_String, composite: CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto) {
        let object = JSObject.global["Object"].function!.new()
        object["offset"] = _toJSValue(offset)
        object["easing"] = _toJSValue(easing)
        object["composite"] = _toJSValue(composite)
        self.init(unsafelyWrapping: object)
    }

    public var offset: nullable_Double_or_seq_of_nullable_Double {
        get { jsObject["offset"].fromJSValue()!}
        set { jsObject["offset"] = newValue.jsValue }
    }

    public var easing: String_or_seq_of_String {
        get { jsObject["easing"].fromJSValue()!}
        set { jsObject["easing"] = newValue.jsValue }
    }

    public var composite: CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto {
        get { jsObject["composite"].fromJSValue()!}
        set { jsObject["composite"] = newValue.jsValue }
    }
}

public enum CompositeOperation: JSString, JSValueCompatible {
    case replace = "replace"
    case add = "add"
    case accumulate = "accumulate"

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

public enum CompositeOperationOrAuto: JSString, JSValueCompatible {
    case replace = "replace"
    case add = "add"
    case accumulate = "accumulate"
    case auto = "auto"

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

public class ComputedEffectTiming: BridgedDictionary {
    public convenience init(progress: Double?, currentIteration: Double?) {
        let object = JSObject.global["Object"].function!.new()
        object["progress"] = _toJSValue(progress)
        object["currentIteration"] = _toJSValue(currentIteration)
        self.init(unsafelyWrapping: object)
    }

    public var progress: Double? {
        get { jsObject["progress"].fromJSValue()}
        set { jsObject["progress"] = newValue.jsValue }
    }

    public var currentIteration: Double? {
        get { jsObject["currentIteration"].fromJSValue()}
        set { jsObject["currentIteration"] = newValue.jsValue }
    }
}

public extension DocumentOrShadowRoot {
    @inlinable func getAnimations() -> [Animation] {
        return jsObject["getAnimations"].function!(this: jsObject, arguments: []).fromJSValue()!
    }
}

public class DocumentTimeline: AnimationTimeline {
    @inlinable override public class var constructor: JSFunction? { JSObject.global["DocumentTimeline"].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(options: DocumentTimelineOptions? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(options)]))
    }
}

public class DocumentTimelineOptions: BridgedDictionary {
    public convenience init(originTime: DOMHighResTimeStamp) {
        let object = JSObject.global["Object"].function!.new()
        object["originTime"] = _toJSValue(originTime)
        self.init(unsafelyWrapping: object)
    }

    public var originTime: DOMHighResTimeStamp {
        get { jsObject["originTime"].fromJSValue()!}
        set { jsObject["originTime"] = newValue.jsValue }
    }
}

public class EffectTiming: BridgedDictionary {
    public convenience init(fill: FillMode, iterationStart: Double, iterations: Double, direction: PlaybackDirection, easing: String) {
        let object = JSObject.global["Object"].function!.new()
        object["fill"] = _toJSValue(fill)
        object["iterationStart"] = _toJSValue(iterationStart)
        object["iterations"] = _toJSValue(iterations)
        object["direction"] = _toJSValue(direction)
        object["easing"] = _toJSValue(easing)
        self.init(unsafelyWrapping: object)
    }

    public var fill: FillMode {
        get { jsObject["fill"].fromJSValue()!}
        set { jsObject["fill"] = newValue.jsValue }
    }

    public var iterationStart: Double {
        get { jsObject["iterationStart"].fromJSValue()!}
        set { jsObject["iterationStart"] = newValue.jsValue }
    }

    public var iterations: Double {
        get { jsObject["iterations"].fromJSValue()!}
        set { jsObject["iterations"] = newValue.jsValue }
    }

    public var direction: PlaybackDirection {
        get { jsObject["direction"].fromJSValue()!}
        set { jsObject["direction"] = newValue.jsValue }
    }

    public var easing: String {
        get { jsObject["easing"].fromJSValue()!}
        set { jsObject["easing"] = newValue.jsValue }
    }
}

public enum FillMode: JSString, JSValueCompatible {
    case none = "none"
    case forwards = "forwards"
    case backwards = "backwards"
    case both = "both"
    case auto = "auto"

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

public class GetAnimationsOptions: BridgedDictionary {
    public convenience init(subtree: Bool) {
        let object = JSObject.global["Object"].function!.new()
        object["subtree"] = _toJSValue(subtree)
        self.init(unsafelyWrapping: object)
    }

    public var subtree: Bool {
        get { jsObject["subtree"].fromJSValue()!}
        set { jsObject["subtree"] = newValue.jsValue }
    }
}

public class KeyframeAnimationOptions: BridgedDictionary {
    public convenience init(id: String, timeline: AnimationTimeline?) {
        let object = JSObject.global["Object"].function!.new()
        object["id"] = _toJSValue(id)
        object["timeline"] = _toJSValue(timeline)
        self.init(unsafelyWrapping: object)
    }

    public var id: String {
        get { jsObject["id"].fromJSValue()!}
        set { jsObject["id"] = newValue.jsValue }
    }

    public var timeline: AnimationTimeline? {
        get { jsObject["timeline"].fromJSValue()}
        set { jsObject["timeline"] = newValue.jsValue }
    }
}

public class KeyframeEffect: AnimationEffect {
    @inlinable override public class var constructor: JSFunction? { JSObject.global["KeyframeEffect"].function }

    @inlinable public convenience init(target: Element?, keyframes: JSObject?, options: Double_or_KeyframeEffectOptions? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(target), _toJSValue(keyframes), _toJSValue(options)]))
    }

    @inlinable public convenience init(source: KeyframeEffect) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(source)]))
    }

    public var target: Element? {
        get { jsObject["target"].fromJSValue()}
        set { jsObject["target"] = newValue.jsValue }
    }

    public var pseudoElement: String? {
        get { jsObject["pseudoElement"].fromJSValue()}
        set { jsObject["pseudoElement"] = newValue.jsValue }
    }

    public var composite: CompositeOperation {
        get { jsObject["composite"].fromJSValue()!}
        set { jsObject["composite"] = newValue.jsValue }
    }

    @inlinable public func getKeyframes() -> [JSObject] {
        return jsObject["getKeyframes"].function!(this: jsObject, arguments: []).fromJSValue()!
    }

    @inlinable public func setKeyframes(keyframes: JSObject?) {
        _ = jsObject["setKeyframes"].function!(this: jsObject, arguments: [_toJSValue(keyframes)])
    }
}

public class KeyframeEffectOptions: BridgedDictionary {
    public convenience init(composite: CompositeOperation, pseudoElement: String?) {
        let object = JSObject.global["Object"].function!.new()
        object["composite"] = _toJSValue(composite)
        object["pseudoElement"] = _toJSValue(pseudoElement)
        self.init(unsafelyWrapping: object)
    }

    public var composite: CompositeOperation {
        get { jsObject["composite"].fromJSValue()!}
        set { jsObject["composite"] = newValue.jsValue }
    }

    public var pseudoElement: String? {
        get { jsObject["pseudoElement"].fromJSValue()}
        set { jsObject["pseudoElement"] = newValue.jsValue }
    }
}

public class OptionalEffectTiming: BridgedDictionary {
    public convenience init(delay: Double, endDelay: Double, fill: FillMode, iterationStart: Double, iterations: Double, duration: Double_or_String, direction: PlaybackDirection, easing: String) {
        let object = JSObject.global["Object"].function!.new()
        object["delay"] = _toJSValue(delay)
        object["endDelay"] = _toJSValue(endDelay)
        object["fill"] = _toJSValue(fill)
        object["iterationStart"] = _toJSValue(iterationStart)
        object["iterations"] = _toJSValue(iterations)
        object["duration"] = _toJSValue(duration)
        object["direction"] = _toJSValue(direction)
        object["easing"] = _toJSValue(easing)
        self.init(unsafelyWrapping: object)
    }

    public var delay: Double {
        get { jsObject["delay"].fromJSValue()!}
        set { jsObject["delay"] = newValue.jsValue }
    }

    public var endDelay: Double {
        get { jsObject["endDelay"].fromJSValue()!}
        set { jsObject["endDelay"] = newValue.jsValue }
    }

    public var fill: FillMode {
        get { jsObject["fill"].fromJSValue()!}
        set { jsObject["fill"] = newValue.jsValue }
    }

    public var iterationStart: Double {
        get { jsObject["iterationStart"].fromJSValue()!}
        set { jsObject["iterationStart"] = newValue.jsValue }
    }

    public var iterations: Double {
        get { jsObject["iterations"].fromJSValue()!}
        set { jsObject["iterations"] = newValue.jsValue }
    }

    public var duration: Double_or_String {
        get { jsObject["duration"].fromJSValue()!}
        set { jsObject["duration"] = newValue.jsValue }
    }

    public var direction: PlaybackDirection {
        get { jsObject["direction"].fromJSValue()!}
        set { jsObject["direction"] = newValue.jsValue }
    }

    public var easing: String {
        get { jsObject["easing"].fromJSValue()!}
        set { jsObject["easing"] = newValue.jsValue }
    }
}

public enum PlaybackDirection: JSString, JSValueCompatible {
    case normal = "normal"
    case reverse = "reverse"
    case alternate = "alternate"
    case alternateReverse = "alternate-reverse"

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

public enum CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto: JSValueCompatible {
    case compositeOperationOrAuto(CompositeOperationOrAuto)
    case seq_of_CompositeOperationOrAuto([CompositeOperationOrAuto])

    public static func construct(from value: JSValue) -> Self? {
        if let compositeOperationOrAuto: CompositeOperationOrAuto = value.fromJSValue() {
            return .compositeOperationOrAuto(compositeOperationOrAuto)
        }
        if let seq_of_CompositeOperationOrAuto: [CompositeOperationOrAuto] = value.fromJSValue() {
            return .seq_of_CompositeOperationOrAuto(seq_of_CompositeOperationOrAuto)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .compositeOperationOrAuto(compositeOperationOrAuto):
            return compositeOperationOrAuto.jsValue
        case let .seq_of_CompositeOperationOrAuto(seq_of_CompositeOperationOrAuto):
            return seq_of_CompositeOperationOrAuto.jsValue
        }
    }
}

public enum Double_or_KeyframeAnimationOptions: JSValueCompatible {
    case double(Double)
    case keyframeAnimationOptions(KeyframeAnimationOptions)

    public static func construct(from value: JSValue) -> Self? {
        if let double: Double = value.fromJSValue() {
            return .double(double)
        }
        if let keyframeAnimationOptions: KeyframeAnimationOptions = value.fromJSValue() {
            return .keyframeAnimationOptions(keyframeAnimationOptions)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .double(double):
            return double.jsValue
        case let .keyframeAnimationOptions(keyframeAnimationOptions):
            return keyframeAnimationOptions.jsValue
        }
    }
}

public enum Double_or_KeyframeEffectOptions: JSValueCompatible {
    case double(Double)
    case keyframeEffectOptions(KeyframeEffectOptions)

    public static func construct(from value: JSValue) -> Self? {
        if let double: Double = value.fromJSValue() {
            return .double(double)
        }
        if let keyframeEffectOptions: KeyframeEffectOptions = value.fromJSValue() {
            return .keyframeEffectOptions(keyframeEffectOptions)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .double(double):
            return double.jsValue
        case let .keyframeEffectOptions(keyframeEffectOptions):
            return keyframeEffectOptions.jsValue
        }
    }
}

public enum Double_or_String: JSValueCompatible {
    case double(Double)
    case string(String)

    public static func construct(from value: JSValue) -> Self? {
        if let double: Double = value.fromJSValue() {
            return .double(double)
        }
        if let string: String = value.fromJSValue() {
            return .string(string)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .double(double):
            return double.jsValue
        case let .string(string):
            return string.jsValue
        }
    }
}

public enum String_or_seq_of_String: JSValueCompatible {
    case string(String)
    case seq_of_String([String])

    public static func construct(from value: JSValue) -> Self? {
        if let string: String = value.fromJSValue() {
            return .string(string)
        }
        if let seq_of_String: [String] = value.fromJSValue() {
            return .seq_of_String(seq_of_String)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .string(string):
            return string.jsValue
        case let .seq_of_String(seq_of_String):
            return seq_of_String.jsValue
        }
    }
}

public enum nullable_Double_or_seq_of_nullable_Double: JSValueCompatible  {
    case nullable_Double(Double?)
    case seq_of_nullable_Double([Double?])

    public static func construct(from value: JSValue) -> Self? {
        if let nullable_Double: Double? = value.fromJSValue() {
            return .nullable_Double(nullable_Double)
        }
        if let seq_of_nullable_Double: [Double?] = value.fromJSValue() {
            return .seq_of_nullable_Double(seq_of_nullable_Double)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .nullable_Double(nullable_Double):
            return nullable_Double.jsValue
        case let .seq_of_nullable_Double(seq_of_nullable_Double):
            return seq_of_nullable_Double.jsValue
        }
    }
}
