import UIKit
import Core

struct Router: HomeViewRouting {

    func getDetail(country: Country) -> UIViewController {
        return DetailBuilder().build(country: country)
    }
}
