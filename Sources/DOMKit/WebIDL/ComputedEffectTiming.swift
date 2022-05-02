// This file was auto-generated by WebIDLToSwift. DO NOT EDIT!

import JavaScriptEventLoop
import JavaScriptKit

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