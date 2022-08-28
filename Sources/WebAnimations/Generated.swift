// This file was auto-generated by WebIDLToSwift. DO NOT EDIT!

import DOM
import ECMAScript
import JavaScriptKit
import WebAPIBase
import WebAudio

public protocol Animatable: JSBridgedClass {}
public extension Animatable {
    @inlinable func animate(keyframes: JSObject?, options: Double_or_KeyframeAnimationOptions? = nil) -> Animation {
        let this = jsObject
        return this[Strings.animate].function!(this: this, arguments: [keyframes.jsValue, options?.jsValue ?? .undefined]).fromJSValue()!
    }

    @inlinable func getAnimations(options: GetAnimationsOptions? = nil) -> [Animation] {
        let this = jsObject
        return this[Strings.getAnimations].function!(this: this, arguments: [options?.jsValue ?? .undefined]).fromJSValue()!
    }
}

public class Animation: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[Strings.Animation].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _id = ReadWriteAttribute(jsObject: jsObject, name: Strings.id)
        _effect = ReadWriteAttribute(jsObject: jsObject, name: Strings.effect)
        _timeline = ReadWriteAttribute(jsObject: jsObject, name: Strings.timeline)
        _playbackRate = ReadWriteAttribute(jsObject: jsObject, name: Strings.playbackRate)
        _playState = ReadonlyAttribute(jsObject: jsObject, name: Strings.playState)
        _replaceState = ReadonlyAttribute(jsObject: jsObject, name: Strings.replaceState)
        _pending = ReadonlyAttribute(jsObject: jsObject, name: Strings.pending)
        _ready = ReadonlyAttribute(jsObject: jsObject, name: Strings.ready)
        _finished = ReadonlyAttribute(jsObject: jsObject, name: Strings.finished)
        _onfinish = ClosureAttribute1Optional(jsObject: jsObject, name: Strings.onfinish)
        _oncancel = ClosureAttribute1Optional(jsObject: jsObject, name: Strings.oncancel)
        _onremove = ClosureAttribute1Optional(jsObject: jsObject, name: Strings.onremove)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(effect: AnimationEffect? = nil, timeline: AnimationTimeline? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [effect?.jsValue ?? .undefined, timeline?.jsValue ?? .undefined]))
    }

    @ReadWriteAttribute
    public var id: String

    @ReadWriteAttribute
    public var effect: AnimationEffect?

    @ReadWriteAttribute
    public var timeline: AnimationTimeline?

    @ReadWriteAttribute
    public var playbackRate: Double

    @ReadonlyAttribute
    public var playState: AnimationPlayState

    @ReadonlyAttribute
    public var replaceState: AnimationReplaceState

    @ReadonlyAttribute
    public var pending: Bool

    @ReadonlyAttribute
    public var ready: JSPromise

    @ReadonlyAttribute
    public var finished: JSPromise

    @ClosureAttribute1Optional
    public var onfinish: EventHandler

    @ClosureAttribute1Optional
    public var oncancel: EventHandler

    @ClosureAttribute1Optional
    public var onremove: EventHandler

    @inlinable public func cancel() {
        let this = jsObject
        _ = this[Strings.cancel].function!(this: this, arguments: [])
    }

    @inlinable public func finish() {
        let this = jsObject
        _ = this[Strings.finish].function!(this: this, arguments: [])
    }

    @inlinable public func play() {
        let this = jsObject
        _ = this[Strings.play].function!(this: this, arguments: [])
    }

    @inlinable public func pause() {
        let this = jsObject
        _ = this[Strings.pause].function!(this: this, arguments: [])
    }

    @inlinable public func updatePlaybackRate(playbackRate: Double) {
        let this = jsObject
        _ = this[Strings.updatePlaybackRate].function!(this: this, arguments: [playbackRate.jsValue])
    }

    @inlinable public func reverse() {
        let this = jsObject
        _ = this[Strings.reverse].function!(this: this, arguments: [])
    }

    @inlinable public func persist() {
        let this = jsObject
        _ = this[Strings.persist].function!(this: this, arguments: [])
    }

    @inlinable public func commitStyles() {
        let this = jsObject
        _ = this[Strings.commitStyles].function!(this: this, arguments: [])
    }
}

public class AnimationEffect: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[Strings.AnimationEffect].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func getTiming() -> EffectTiming {
        let this = jsObject
        return this[Strings.getTiming].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getComputedTiming() -> ComputedEffectTiming {
        let this = jsObject
        return this[Strings.getComputedTiming].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func updateTiming(timing: OptionalEffectTiming? = nil) {
        let this = jsObject
        _ = this[Strings.updateTiming].function!(this: this, arguments: [timing?.jsValue ?? .undefined])
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
    @inlinable public class var constructor: JSFunction? { JSObject.global[Strings.AnimationTimeline].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        _currentTime = ReadonlyAttribute(jsObject: jsObject, name: Strings.currentTime)
        _phase = ReadonlyAttribute(jsObject: jsObject, name: Strings.phase)
        self.jsObject = jsObject
    }

    @ReadonlyAttribute
    public var currentTime: Double?

    @ReadonlyAttribute
    public var phase: TimelinePhase
}

public class BaseComputedKeyframe: BridgedDictionary {
    public convenience init(offset: Double?, computedOffset: Double, easing: String, composite: CompositeOperationOrAuto) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.offset] = offset.jsValue
        object[Strings.computedOffset] = computedOffset.jsValue
        object[Strings.easing] = easing.jsValue
        object[Strings.composite] = composite.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _offset = ReadWriteAttribute(jsObject: object, name: Strings.offset)
        _computedOffset = ReadWriteAttribute(jsObject: object, name: Strings.computedOffset)
        _easing = ReadWriteAttribute(jsObject: object, name: Strings.easing)
        _composite = ReadWriteAttribute(jsObject: object, name: Strings.composite)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var offset: Double?

    @ReadWriteAttribute
    public var computedOffset: Double

    @ReadWriteAttribute
    public var easing: String

    @ReadWriteAttribute
    public var composite: CompositeOperationOrAuto
}

public class BaseKeyframe: BridgedDictionary {
    public convenience init(offset: Double?, easing: String, composite: CompositeOperationOrAuto) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.offset] = offset.jsValue
        object[Strings.easing] = easing.jsValue
        object[Strings.composite] = composite.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _offset = ReadWriteAttribute(jsObject: object, name: Strings.offset)
        _easing = ReadWriteAttribute(jsObject: object, name: Strings.easing)
        _composite = ReadWriteAttribute(jsObject: object, name: Strings.composite)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var offset: Double?

    @ReadWriteAttribute
    public var easing: String

    @ReadWriteAttribute
    public var composite: CompositeOperationOrAuto
}

public class BasePropertyIndexedKeyframe: BridgedDictionary {
    public convenience init(offset: nullable_Double_or_seq_of_nullable_Double, easing: String_or_seq_of_String, composite: CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.offset] = offset.jsValue
        object[Strings.easing] = easing.jsValue
        object[Strings.composite] = composite.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _offset = ReadWriteAttribute(jsObject: object, name: Strings.offset)
        _easing = ReadWriteAttribute(jsObject: object, name: Strings.easing)
        _composite = ReadWriteAttribute(jsObject: object, name: Strings.composite)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var offset: nullable_Double_or_seq_of_nullable_Double

    @ReadWriteAttribute
    public var easing: String_or_seq_of_String

    @ReadWriteAttribute
    public var composite: CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto
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
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.progress] = progress.jsValue
        object[Strings.currentIteration] = currentIteration.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _progress = ReadWriteAttribute(jsObject: object, name: Strings.progress)
        _currentIteration = ReadWriteAttribute(jsObject: object, name: Strings.currentIteration)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var progress: Double?

    @ReadWriteAttribute
    public var currentIteration: Double?
}

public protocol DocumentOrShadowRoot: JSBridgedClass {}
public extension DocumentOrShadowRoot {
    @inlinable func getAnimations() -> [Animation] {
        let this = jsObject
        return this[Strings.getAnimations].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class DocumentTimeline: AnimationTimeline {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[Strings.DocumentTimeline].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(options: DocumentTimelineOptions? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [options?.jsValue ?? .undefined]))
    }
}

public class DocumentTimelineOptions: BridgedDictionary {
    public convenience init(originTime: DOMHighResTimeStamp) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.originTime] = originTime.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _originTime = ReadWriteAttribute(jsObject: object, name: Strings.originTime)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var originTime: DOMHighResTimeStamp
}

public class EffectTiming: BridgedDictionary {
    public convenience init(delay: Double, endDelay: Double, fill: FillMode, iterationStart: Double, iterations: Double, direction: PlaybackDirection, easing: String) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.delay] = delay.jsValue
        object[Strings.endDelay] = endDelay.jsValue
        object[Strings.fill] = fill.jsValue
        object[Strings.iterationStart] = iterationStart.jsValue
        object[Strings.iterations] = iterations.jsValue
        object[Strings.direction] = direction.jsValue
        object[Strings.easing] = easing.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _delay = ReadWriteAttribute(jsObject: object, name: Strings.delay)
        _endDelay = ReadWriteAttribute(jsObject: object, name: Strings.endDelay)
        _fill = ReadWriteAttribute(jsObject: object, name: Strings.fill)
        _iterationStart = ReadWriteAttribute(jsObject: object, name: Strings.iterationStart)
        _iterations = ReadWriteAttribute(jsObject: object, name: Strings.iterations)
        _direction = ReadWriteAttribute(jsObject: object, name: Strings.direction)
        _easing = ReadWriteAttribute(jsObject: object, name: Strings.easing)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var delay: Double

    @ReadWriteAttribute
    public var endDelay: Double

    @ReadWriteAttribute
    public var fill: FillMode

    @ReadWriteAttribute
    public var iterationStart: Double

    @ReadWriteAttribute
    public var iterations: Double

    @ReadWriteAttribute
    public var direction: PlaybackDirection

    @ReadWriteAttribute
    public var easing: String
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
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.subtree] = subtree.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _subtree = ReadWriteAttribute(jsObject: object, name: Strings.subtree)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var subtree: Bool
}

public class KeyframeAnimationOptions: BridgedDictionary {
    public convenience init(id: String, timeline: AnimationTimeline?) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.id] = id.jsValue
        object[Strings.timeline] = timeline.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _id = ReadWriteAttribute(jsObject: object, name: Strings.id)
        _timeline = ReadWriteAttribute(jsObject: object, name: Strings.timeline)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var id: String

    @ReadWriteAttribute
    public var timeline: AnimationTimeline?
}

public class KeyframeEffect: AnimationEffect {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[Strings.KeyframeEffect].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _target = ReadWriteAttribute(jsObject: jsObject, name: Strings.target)
        _pseudoElement = ReadWriteAttribute(jsObject: jsObject, name: Strings.pseudoElement)
        _composite = ReadWriteAttribute(jsObject: jsObject, name: Strings.composite)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(target: Element?, keyframes: JSObject?, options: Double_or_KeyframeEffectOptions? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [target.jsValue, keyframes.jsValue, options?.jsValue ?? .undefined]))
    }

    @inlinable public convenience init(source: KeyframeEffect) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [source.jsValue]))
    }

    @ReadWriteAttribute
    public var target: Element?

    @ReadWriteAttribute
    public var pseudoElement: String?

    @ReadWriteAttribute
    public var composite: CompositeOperation

    @inlinable public func getKeyframes() -> [JSObject] {
        let this = jsObject
        return this[Strings.getKeyframes].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func setKeyframes(keyframes: JSObject?) {
        let this = jsObject
        _ = this[Strings.setKeyframes].function!(this: this, arguments: [keyframes.jsValue])
    }
}

public class KeyframeEffectOptions: BridgedDictionary {
    public convenience init(composite: CompositeOperation, pseudoElement: String?) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.composite] = composite.jsValue
        object[Strings.pseudoElement] = pseudoElement.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _composite = ReadWriteAttribute(jsObject: object, name: Strings.composite)
        _pseudoElement = ReadWriteAttribute(jsObject: object, name: Strings.pseudoElement)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var composite: CompositeOperation

    @ReadWriteAttribute
    public var pseudoElement: String?
}

public class OptionalEffectTiming: BridgedDictionary {
    public convenience init(delay: Double, endDelay: Double, fill: FillMode, iterationStart: Double, iterations: Double, duration: Double_or_String, direction: PlaybackDirection, easing: String) {
        let object = JSObject.global[Strings.Object].function!.new()
        object[Strings.delay] = delay.jsValue
        object[Strings.endDelay] = endDelay.jsValue
        object[Strings.fill] = fill.jsValue
        object[Strings.iterationStart] = iterationStart.jsValue
        object[Strings.iterations] = iterations.jsValue
        object[Strings.duration] = duration.jsValue
        object[Strings.direction] = direction.jsValue
        object[Strings.easing] = easing.jsValue
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _delay = ReadWriteAttribute(jsObject: object, name: Strings.delay)
        _endDelay = ReadWriteAttribute(jsObject: object, name: Strings.endDelay)
        _fill = ReadWriteAttribute(jsObject: object, name: Strings.fill)
        _iterationStart = ReadWriteAttribute(jsObject: object, name: Strings.iterationStart)
        _iterations = ReadWriteAttribute(jsObject: object, name: Strings.iterations)
        _duration = ReadWriteAttribute(jsObject: object, name: Strings.duration)
        _direction = ReadWriteAttribute(jsObject: object, name: Strings.direction)
        _easing = ReadWriteAttribute(jsObject: object, name: Strings.easing)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var delay: Double

    @ReadWriteAttribute
    public var endDelay: Double

    @ReadWriteAttribute
    public var fill: FillMode

    @ReadWriteAttribute
    public var iterationStart: Double

    @ReadWriteAttribute
    public var iterations: Double

    @ReadWriteAttribute
    public var duration: Double_or_String

    @ReadWriteAttribute
    public var direction: PlaybackDirection

    @ReadWriteAttribute
    public var easing: String
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

public enum TimelinePhase: JSString, JSValueCompatible {
    case inactive = "inactive"
    case before = "before"
    case active = "active"
    case after = "after"

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

@usableFromInline enum Strings {
    static let _self: JSString = "self"
    @usableFromInline static let Animation: JSString = "Animation"
    @usableFromInline static let AnimationEffect: JSString = "AnimationEffect"
    @usableFromInline static let AnimationTimeline: JSString = "AnimationTimeline"
    @usableFromInline static let DocumentTimeline: JSString = "DocumentTimeline"
    @usableFromInline static let KeyframeEffect: JSString = "KeyframeEffect"
    @usableFromInline static let Object: JSString = "Object"
    @usableFromInline static let animate: JSString = "animate"
    @usableFromInline static let cancel: JSString = "cancel"
    @usableFromInline static let commitStyles: JSString = "commitStyles"
    @usableFromInline static let composite: JSString = "composite"
    @usableFromInline static let computedOffset: JSString = "computedOffset"
    @usableFromInline static let currentIteration: JSString = "currentIteration"
    @usableFromInline static let currentTime: JSString = "currentTime"
    @usableFromInline static let delay: JSString = "delay"
    @usableFromInline static let direction: JSString = "direction"
    @usableFromInline static let duration: JSString = "duration"
    @usableFromInline static let easing: JSString = "easing"
    @usableFromInline static let effect: JSString = "effect"
    @usableFromInline static let endDelay: JSString = "endDelay"
    @usableFromInline static let fill: JSString = "fill"
    @usableFromInline static let finish: JSString = "finish"
    @usableFromInline static let finished: JSString = "finished"
    @usableFromInline static let getAnimations: JSString = "getAnimations"
    @usableFromInline static let getComputedTiming: JSString = "getComputedTiming"
    @usableFromInline static let getKeyframes: JSString = "getKeyframes"
    @usableFromInline static let getTiming: JSString = "getTiming"
    @usableFromInline static let id: JSString = "id"
    @usableFromInline static let iterationStart: JSString = "iterationStart"
    @usableFromInline static let iterations: JSString = "iterations"
    @usableFromInline static let offset: JSString = "offset"
    @usableFromInline static let oncancel: JSString = "oncancel"
    @usableFromInline static let onfinish: JSString = "onfinish"
    @usableFromInline static let onremove: JSString = "onremove"
    @usableFromInline static let originTime: JSString = "originTime"
    @usableFromInline static let pause: JSString = "pause"
    @usableFromInline static let pending: JSString = "pending"
    @usableFromInline static let persist: JSString = "persist"
    @usableFromInline static let phase: JSString = "phase"
    @usableFromInline static let play: JSString = "play"
    @usableFromInline static let playState: JSString = "playState"
    @usableFromInline static let playbackRate: JSString = "playbackRate"
    @usableFromInline static let progress: JSString = "progress"
    @usableFromInline static let pseudoElement: JSString = "pseudoElement"
    @usableFromInline static let ready: JSString = "ready"
    @usableFromInline static let replaceState: JSString = "replaceState"
    @usableFromInline static let reverse: JSString = "reverse"
    @usableFromInline static let setKeyframes: JSString = "setKeyframes"
    @usableFromInline static let subtree: JSString = "subtree"
    @usableFromInline static let target: JSString = "target"
    @usableFromInline static let timeline: JSString = "timeline"
    @usableFromInline static let toString: JSString = "toString"
    @usableFromInline static let updatePlaybackRate: JSString = "updatePlaybackRate"
    @usableFromInline static let updateTiming: JSString = "updateTiming"
}

public protocol Any_CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto: ConvertibleToJSValue {}
extension CompositeOperationOrAuto: Any_CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto {}
extension Array: Any_CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto where Element == CompositeOperationOrAuto {}

public enum CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto: JSValueCompatible, Any_CompositeOperationOrAuto_or_seq_of_CompositeOperationOrAuto {
    case compositeOperationOrAuto(CompositeOperationOrAuto)
    case seq_of_CompositeOperationOrAuto([CompositeOperationOrAuto])

    public var compositeOperationOrAuto: CompositeOperationOrAuto? {
        switch self {
        case let .compositeOperationOrAuto(compositeOperationOrAuto): return compositeOperationOrAuto
        default: return nil
        }
    }

    public var seq_of_CompositeOperationOrAuto: [CompositeOperationOrAuto]? {
        switch self {
        case let .seq_of_CompositeOperationOrAuto(seq_of_CompositeOperationOrAuto): return seq_of_CompositeOperationOrAuto
        default: return nil
        }
    }

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

public protocol Any_Double_or_KeyframeAnimationOptions: ConvertibleToJSValue {}
extension Double: Any_Double_or_KeyframeAnimationOptions {}
extension KeyframeAnimationOptions: Any_Double_or_KeyframeAnimationOptions {}

public enum Double_or_KeyframeAnimationOptions: JSValueCompatible, Any_Double_or_KeyframeAnimationOptions {
    case double(Double)
    case keyframeAnimationOptions(KeyframeAnimationOptions)

    public var double: Double? {
        switch self {
        case let .double(double): return double
        default: return nil
        }
    }

    public var keyframeAnimationOptions: KeyframeAnimationOptions? {
        switch self {
        case let .keyframeAnimationOptions(keyframeAnimationOptions): return keyframeAnimationOptions
        default: return nil
        }
    }

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

public protocol Any_Double_or_KeyframeEffectOptions: ConvertibleToJSValue {}
extension Double: Any_Double_or_KeyframeEffectOptions {}
extension KeyframeEffectOptions: Any_Double_or_KeyframeEffectOptions {}

public enum Double_or_KeyframeEffectOptions: JSValueCompatible, Any_Double_or_KeyframeEffectOptions {
    case double(Double)
    case keyframeEffectOptions(KeyframeEffectOptions)

    public var double: Double? {
        switch self {
        case let .double(double): return double
        default: return nil
        }
    }

    public var keyframeEffectOptions: KeyframeEffectOptions? {
        switch self {
        case let .keyframeEffectOptions(keyframeEffectOptions): return keyframeEffectOptions
        default: return nil
        }
    }

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

public protocol Any_Double_or_String: ConvertibleToJSValue {}
extension Double: Any_Double_or_String {}
extension String: Any_Double_or_String {}

public enum Double_or_String: JSValueCompatible, Any_Double_or_String {
    case double(Double)
    case string(String)

    public var double: Double? {
        switch self {
        case let .double(double): return double
        default: return nil
        }
    }

    public var string: String? {
        switch self {
        case let .string(string): return string
        default: return nil
        }
    }

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

public protocol Any_String_or_seq_of_String: ConvertibleToJSValue {}
extension String: Any_String_or_seq_of_String {}
extension Array: Any_String_or_seq_of_String where Element == String {}

public enum String_or_seq_of_String: JSValueCompatible, Any_String_or_seq_of_String {
    case string(String)
    case seq_of_String([String])

    public var string: String? {
        switch self {
        case let .string(string): return string
        default: return nil
        }
    }

    public var seq_of_String: [String]? {
        switch self {
        case let .seq_of_String(seq_of_String): return seq_of_String
        default: return nil
        }
    }

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

public protocol Any_nullable_Double_or_seq_of_nullable_Double: ConvertibleToJSValue {}
extension Optional: Any_nullable_Double_or_seq_of_nullable_Double where Wrapped == Double {}
extension Array: Any_nullable_Double_or_seq_of_nullable_Double where Element == Double? {}

public enum nullable_Double_or_seq_of_nullable_Double: JSValueCompatible, Any_nullable_Double_or_seq_of_nullable_Double {
    case nullable_Double(Double?)
    case seq_of_nullable_Double([Double?])

    public var nullable_Double: Double?? {
        switch self {
        case let .nullable_Double(nullable_Double): return nullable_Double
        default: return nil
        }
    }

    public var seq_of_nullable_Double: [Double?]? {
        switch self {
        case let .seq_of_nullable_Double(seq_of_nullable_Double): return seq_of_nullable_Double
        default: return nil
        }
    }

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