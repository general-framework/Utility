import SceneKit

#if os(macOS)
public typealias SCNFloat = CGFloat
#else
public typealias SCNFloat = Float
#endif

extension SCNVector3 {
    public init(x: SCNFloat, y: SCNFloat, z: SCNFloat) {
        self.init()
        self.x = SCNFloat(x)
        self.y = SCNFloat(y)
        self.z = SCNFloat(z)
    }
}
