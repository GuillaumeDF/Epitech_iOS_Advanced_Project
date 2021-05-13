import UIKit

public class DetailViewModel {

    public let image: UIImage
    public let text: String
    public let textColor: UIColor

    public init(image: UIImage, text: String, textColor: UIColor) {
        self.image = image
        self.text = text
        self.textColor = textColor
    }
}
