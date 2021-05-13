import UIKit

struct Router: HomeViewRouting {

    func getDetail(country: Country, textColor: UIColor) -> UIViewController {
        return DetailBuilder().build(country: country, textColor: textColor)
    }
}
