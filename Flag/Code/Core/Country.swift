import UIKit

public struct Country {
    public let flagAsset: UIImage
    public let name: String

    public init(flagAsset: UIImage, name: String) {
        self.flagAsset = flagAsset
        self.name = name
    }
}
