import UIKit

public protocol HomeViewRouting {
    func getDetail(country: Country, textColor: UIColor) -> UIViewController
}
