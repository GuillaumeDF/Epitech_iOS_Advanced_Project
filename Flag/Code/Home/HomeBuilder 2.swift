import UIKit

class HomeBuilder {

    func build() -> UIViewController {
        let router = Router()
        let presenter = HomePresenter()

        let viewController = UIStoryboard(name: "Home", bundle: Bundle(for: Home.self)).instantiateViewController(identifier: "Home") as! Home
        viewController.presenter = presenter
        viewController.router = router
        return viewController
    }
}
