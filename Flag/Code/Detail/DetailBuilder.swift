import UIKit
import Core

public class DetailBuilder {

    func build(country: Country, textColor: UIColor) -> UIViewController {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailBuilder.self))
        let viewController = storyboard.instantiateViewController(identifier: "Detail") as! Detail

        viewController.viewModel = .init(image: country.flagAsset, text: country.name, textColor: textColor)
        return viewController
    }
}
