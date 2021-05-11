import UIKit

struct Router: HomeViewRouting {

    func getDetail(country: Country) -> UIViewController {
        return DetailBuilder().build(country: country)
    }
}
