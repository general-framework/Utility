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
#endif
