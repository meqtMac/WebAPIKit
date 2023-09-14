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

public class MediaTrackCapabilities: BridgedDictionary {
    public convenience init(width: ULongRange, height: ULongRange, aspectRatio: DoubleRange, frameRate: DoubleRange, facingMode: [String], resizeMode: [String], sampleRate: ULongRange, sampleSize: ULongRange, echoCancellation: [Bool], autoGainControl: [Bool], noiseSuppression: [Bool], latency: DoubleRange, channelCount: ULongRange, deviceId: String, groupId: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _width = ReadWriteAttribute(jsObject: object, name: .width)
        _height = ReadWriteAttribute(jsObject: object, name: .height)
        _aspectRatio = ReadWriteAttribute(jsObject: object, name: .aspectRatio)
        _frameRate = ReadWriteAttribute(jsObject: object, name: .frameRate)
        _facingMode = ReadWriteAttribute(jsObject: object, name: .facingMode)
        _resizeMode = ReadWriteAttribute(jsObject: object, name: .resizeMode)
        _sampleRate = ReadWriteAttribute(jsObject: object, name: .sampleRate)
        _sampleSize = ReadWriteAttribute(jsObject: object, name: .sampleSize)
        _echoCancellation = ReadWriteAttribute(jsObject: object, name: .echoCancellation)
        _autoGainControl = ReadWriteAttribute(jsObject: object, name: .autoGainControl)
        _noiseSuppression = ReadWriteAttribute(jsObject: object, name: .noiseSuppression)
        _latency = ReadWriteAttribute(jsObject: object, name: .latency)
        _channelCount = ReadWriteAttribute(jsObject: object, name: .channelCount)
        _deviceId = ReadWriteAttribute(jsObject: object, name: .deviceId)
        _groupId = ReadWriteAttribute(jsObject: object, name: .groupId)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var width: ULongRange

    @ReadWriteAttribute
    public var height: ULongRange

    @ReadWriteAttribute
    public var aspectRatio: DoubleRange

    @ReadWriteAttribute
    public var frameRate: DoubleRange

    @ReadWriteAttribute
    public var facingMode: [String]

    @ReadWriteAttribute
    public var resizeMode: [String]

    @ReadWriteAttribute
    public var sampleRate: ULongRange

    @ReadWriteAttribute
    public var sampleSize: ULongRange

    @ReadWriteAttribute
    public var echoCancellation: [Bool]

    @ReadWriteAttribute
    public var autoGainControl: [Bool]

    @ReadWriteAttribute
    public var noiseSuppression: [Bool]

    @ReadWriteAttribute
    public var latency: DoubleRange

    @ReadWriteAttribute
    public var channelCount: ULongRange

    @ReadWriteAttribute
    public var deviceId: String

    @ReadWriteAttribute
    public var groupId: String
}

public class MediaTrackConstraintSet: BridgedDictionary {
    public enum ConstrainDOMString: JSValueCompatible {
        public class ConstrainDOMStringParameters: BridgedDictionary {
            public convenience init(exact: String_or_seq_of_String, ideal: String_or_seq_of_String) {
                let object = JSObject.global[.Object].function!.new()
                object[.exact] = _toJSValue(exact)
                object[.ideal] = _toJSValue(ideal)
                self.init(unsafelyWrapping: object)
            }
            
            public required init(unsafelyWrapping object: JSObject) {
                _exact = ReadWriteAttribute(jsObject: object, name: .exact)
                _ideal = ReadWriteAttribute(jsObject: object, name: .ideal)
                super.init(unsafelyWrapping: object)
            }
            
            @ReadWriteAttribute
            public var exact: String_or_seq_of_String
            
            @ReadWriteAttribute
            public var ideal: String_or_seq_of_String
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
        }
        case constrainDOMStringParameters(ConstrainDOMStringParameters)
        case string(String)
        case seq_of_String([String])
        
        public static func construct(from value: JSValue) -> Self? {
            if let constrainDOMStringParameters: ConstrainDOMStringParameters = value.fromJSValue() {
                return .constrainDOMStringParameters(constrainDOMStringParameters)
            }
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
            case let .constrainDOMStringParameters(constrainDOMStringParameters):
                return constrainDOMStringParameters.jsValue
            case let .string(string):
                return string.jsValue
            case let .seq_of_String(seq_of_String):
                return seq_of_String.jsValue
            }
        }
    }
    public convenience init(width: ConstrainULong,
                            height: ConstrainULong,
                            aspectRatio: ConstrainDouble,
                            frameRate: ConstrainDouble,
                            facingMode: ConstrainDOMString,
                            resizeMode: ConstrainDOMString,
                            sampleRate: ConstrainULong,
                            sampleSize: ConstrainULong,
                            echoCancellation: ConstrainBoolean,
                            autoGainControl: ConstrainBoolean,
                            noiseSuppression: ConstrainBoolean,
                            latency: ConstrainDouble,
                            channelCount: ConstrainULong,
                            deviceId: ConstrainDOMString,
                            groupId: ConstrainDOMString) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        _width = ReadWriteAttribute(jsObject: object, name: .width)
        _height = ReadWriteAttribute(jsObject: object, name: .height)
        _aspectRatio = ReadWriteAttribute(jsObject: object, name: .aspectRatio)
        _frameRate = ReadWriteAttribute(jsObject: object, name: .frameRate)
        _facingMode = ReadWriteAttribute(jsObject: object, name: .facingMode)
        _resizeMode = ReadWriteAttribute(jsObject: object, name: .resizeMode)
        _sampleRate = ReadWriteAttribute(jsObject: object, name: .sampleRate)
        _sampleSize = ReadWriteAttribute(jsObject: object, name: .sampleSize)
        _echoCancellation = ReadWriteAttribute(jsObject: object, name: .echoCancellation)
        _autoGainControl = ReadWriteAttribute(jsObject: object, name: .autoGainControl)
        _noiseSuppression = ReadWriteAttribute(jsObject: object, name: .noiseSuppression)
        _latency = ReadWriteAttribute(jsObject: object, name: .latency)
        _channelCount = ReadWriteAttribute(jsObject: object, name: .channelCount)
        _deviceId = ReadWriteAttribute(jsObject: object, name: .deviceId)
        _groupId = ReadWriteAttribute(jsObject: object, name: .groupId)
        super.init(unsafelyWrapping: object)
    }
    
    @ReadWriteAttribute
    public var width: ConstrainULong
    
    @ReadWriteAttribute
    public var height: ConstrainULong
    
    @ReadWriteAttribute
    public var aspectRatio: ConstrainDouble
    
    @ReadWriteAttribute
    public var frameRate: ConstrainDouble
    
    @ReadWriteAttribute
    public var facingMode: ConstrainDOMString
    
    @ReadWriteAttribute
    public var resizeMode: ConstrainDOMString
    
    @ReadWriteAttribute
    public var sampleRate: ConstrainULong
    
    @ReadWriteAttribute
    public var sampleSize: ConstrainULong
    
    @ReadWriteAttribute
    public var echoCancellation: ConstrainBoolean
    
    @ReadWriteAttribute
    public var autoGainControl: ConstrainBoolean
    
    @ReadWriteAttribute
    public var noiseSuppression: ConstrainBoolean
    
    @ReadWriteAttribute
    public var latency: ConstrainDouble
    
    @ReadWriteAttribute
    public var channelCount: ConstrainULong
    
    @ReadWriteAttribute
    public var deviceId: ConstrainDOMString
    
    @ReadWriteAttribute
    public var groupId: ConstrainDOMString
}

public class MediaTrackConstraints: BridgedDictionary {
    public convenience init(advanced: [MediaTrackConstraintSet]) {
        let object = JSObject.global[.Object].function!.new()
        object[.advanced] = _toJSValue(advanced)
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        _advanced = ReadWriteAttribute(jsObject: object, name: .advanced)
        super.init(unsafelyWrapping: object)
    }
    
    @ReadWriteAttribute
    public var advanced: [MediaTrackConstraintSet]
}

public class MediaTrackSettings: BridgedDictionary {
    public convenience init(width: UInt32, height: UInt32, aspectRatio: Double, frameRate: Double, facingMode: String, resizeMode: String, sampleRate: UInt32, sampleSize: UInt32, echoCancellation: Bool, autoGainControl: Bool, noiseSuppression: Bool, latency: Double, channelCount: UInt32, deviceId: String, groupId: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _width = ReadWriteAttribute(jsObject: object, name: .width)
        _height = ReadWriteAttribute(jsObject: object, name: .height)
        _aspectRatio = ReadWriteAttribute(jsObject: object, name: .aspectRatio)
        _frameRate = ReadWriteAttribute(jsObject: object, name: .frameRate)
        _facingMode = ReadWriteAttribute(jsObject: object, name: .facingMode)
        _resizeMode = ReadWriteAttribute(jsObject: object, name: .resizeMode)
        _sampleRate = ReadWriteAttribute(jsObject: object, name: .sampleRate)
        _sampleSize = ReadWriteAttribute(jsObject: object, name: .sampleSize)
        _echoCancellation = ReadWriteAttribute(jsObject: object, name: .echoCancellation)
        _autoGainControl = ReadWriteAttribute(jsObject: object, name: .autoGainControl)
        _noiseSuppression = ReadWriteAttribute(jsObject: object, name: .noiseSuppression)
        _latency = ReadWriteAttribute(jsObject: object, name: .latency)
        _channelCount = ReadWriteAttribute(jsObject: object, name: .channelCount)
        _deviceId = ReadWriteAttribute(jsObject: object, name: .deviceId)
        _groupId = ReadWriteAttribute(jsObject: object, name: .groupId)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var width: UInt32

    @ReadWriteAttribute
    public var height: UInt32

    @ReadWriteAttribute
    public var aspectRatio: Double

    @ReadWriteAttribute
    public var frameRate: Double

    @ReadWriteAttribute
    public var facingMode: String

    @ReadWriteAttribute
    public var resizeMode: String

    @ReadWriteAttribute
    public var sampleRate: UInt32

    @ReadWriteAttribute
    public var sampleSize: UInt32

    @ReadWriteAttribute
    public var echoCancellation: Bool

    @ReadWriteAttribute
    public var autoGainControl: Bool

    @ReadWriteAttribute
    public var noiseSuppression: Bool

    @ReadWriteAttribute
    public var latency: Double

    @ReadWriteAttribute
    public var channelCount: UInt32

    @ReadWriteAttribute
    public var deviceId: String

    @ReadWriteAttribute
    public var groupId: String
}

public class MediaTrackSupportedConstraints: BridgedDictionary {
    public convenience init(width: Bool, height: Bool, aspectRatio: Bool, frameRate: Bool, facingMode: Bool, resizeMode: Bool, sampleRate: Bool, sampleSize: Bool, echoCancellation: Bool, autoGainControl: Bool, noiseSuppression: Bool, latency: Bool, channelCount: Bool, deviceId: Bool, groupId: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _width = ReadWriteAttribute(jsObject: object, name: .width)
        _height = ReadWriteAttribute(jsObject: object, name: .height)
        _aspectRatio = ReadWriteAttribute(jsObject: object, name: .aspectRatio)
        _frameRate = ReadWriteAttribute(jsObject: object, name: .frameRate)
        _facingMode = ReadWriteAttribute(jsObject: object, name: .facingMode)
        _resizeMode = ReadWriteAttribute(jsObject: object, name: .resizeMode)
        _sampleRate = ReadWriteAttribute(jsObject: object, name: .sampleRate)
        _sampleSize = ReadWriteAttribute(jsObject: object, name: .sampleSize)
        _echoCancellation = ReadWriteAttribute(jsObject: object, name: .echoCancellation)
        _autoGainControl = ReadWriteAttribute(jsObject: object, name: .autoGainControl)
        _noiseSuppression = ReadWriteAttribute(jsObject: object, name: .noiseSuppression)
        _latency = ReadWriteAttribute(jsObject: object, name: .latency)
        _channelCount = ReadWriteAttribute(jsObject: object, name: .channelCount)
        _deviceId = ReadWriteAttribute(jsObject: object, name: .deviceId)
        _groupId = ReadWriteAttribute(jsObject: object, name: .groupId)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var width: Bool

    @ReadWriteAttribute
    public var height: Bool

    @ReadWriteAttribute
    public var aspectRatio: Bool

    @ReadWriteAttribute
    public var frameRate: Bool

    @ReadWriteAttribute
    public var facingMode: Bool

    @ReadWriteAttribute
    public var resizeMode: Bool

    @ReadWriteAttribute
    public var sampleRate: Bool

    @ReadWriteAttribute
    public var sampleSize: Bool

    @ReadWriteAttribute
    public var echoCancellation: Bool

    @ReadWriteAttribute
    public var autoGainControl: Bool

    @ReadWriteAttribute
    public var noiseSuppression: Bool

    @ReadWriteAttribute
    public var latency: Bool

    @ReadWriteAttribute
    public var channelCount: Bool

    @ReadWriteAttribute
    public var deviceId: Bool

    @ReadWriteAttribute
    public var groupId: Bool
}

public enum ConstrainBoolean: JSValueCompatible {
    case bool(Bool)
    case constrainBooleanParameters(ConstrainBooleanParameters)

   public static func construct(from value: JSValue) -> Self? {
        if let bool: Bool = value.fromJSValue() {
            return .bool(bool)
        }
        if let constrainBooleanParameters: ConstrainBooleanParameters = value.fromJSValue() {
            return .constrainBooleanParameters(constrainBooleanParameters)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .bool(bool):
            return bool.jsValue
        case let .constrainBooleanParameters(constrainBooleanParameters):
            return constrainBooleanParameters.jsValue
        }
    }

}

extension ConstrainBoolean {
     public class ConstrainBooleanParameters: BridgedDictionary {
    public convenience init(exact: Bool, ideal: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.exact] = _toJSValue(exact)
        object[.ideal] = _toJSValue(ideal)
        self.init(unsafelyWrapping: object)
    }

    public required init(unsafelyWrapping object: JSObject) {
        _exact = ReadWriteAttribute(jsObject: object, name: .exact)
        _ideal = ReadWriteAttribute(jsObject: object, name: .ideal)
        super.init(unsafelyWrapping: object)
    }

    @ReadWriteAttribute
    public var exact: Bool

    @ReadWriteAttribute
    public var ideal: Bool
}   
}