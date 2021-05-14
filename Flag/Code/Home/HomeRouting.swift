import UIKit
import Core

public protocol HomeViewRouting {
    func getDetail(country: Country, textColor: UIColor) -> UIViewController
}
