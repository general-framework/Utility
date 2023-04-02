#if os(macOS)
import CoreGraphics
public typealias SceneFloat = CGFloat
#else
public typealias SceneFloat = Float
#endif

#if canImport(SceneKit)
import SceneKit
extension SCNVector3 {
    public init(x: SceneFloat, y: SceneFloat, z: SceneFloat) {
        self.init()
        self.x = SceneFloat(x)
        self.y = SceneFloat(y)
        self.z = SceneFloat(z)
    }
}

extension SCNVector3 {
    public static func - (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
    }

    public static func + (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
    }

    public static func * (vector: SCNVector3, scalar: SCNFloat) -> SCNVector3 {
        return SCNVector3(vector.x * SCNFloat(scalar), vector.y * SCNFloat(scalar), vector.z * SCNFloat(scalar))
    }

    public static func != (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
        return lhs.x != rhs.x || lhs.y != rhs.y || lhs.z != rhs.z
    }

    public func clamped(min minValue: SCNFloat, max maxValue: SCNFloat) -> SCNVector3 {
        let x = SCNFloat(min(max(self.x, minValue), maxValue))
        let y = SCNFloat(min(max(self.y, minValue), maxValue))
        let z = SCNFloat(min(max(self.z, minValue), maxValue))
        return SCNVector3(x, y, z)
    }

    public func length() -> SCNFloat {
        let s = sqrtf(Float(x*x + y*y + z*z))
        return SCNFloat(s)
    }

    public func normalized() -> SCNVector3 {
        let len = length()
        return SCNVector3(x / len, y / len, z / len)
    }
}

public func lerp(a: CGFloat, b: CGFloat, t: CGFloat) -> CGFloat {
    return a + (b - a) * t
}

extension GLKVector3 {
    public func rotationAroundY() -> SCNFloat {
        let angle = atan2f(-z, x) + .pi / 2
        return SCNFloat(angle)
    }
}

#endif
