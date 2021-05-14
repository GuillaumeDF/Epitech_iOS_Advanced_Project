// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let algeriaFlag = ImageAsset(name: "algeria-flag")
  internal static let alsaceFlag = ImageAsset(name: "alsace-flag")
  internal static let belgiumFlag = ImageAsset(name: "belgium-flag")
  internal static let canadaFlag = ImageAsset(name: "canada-flag")
  internal static let egyptFlag = ImageAsset(name: "egypt-flag")
  internal static let franceFlag = ImageAsset(name: "france-flag")
  internal static let germanyFlag = ImageAsset(name: "germany-flag")
  internal static let italyFlag = ImageAsset(name: "italy-flag")
  internal static let maroccoFlag = ImageAsset(name: "marocco-flag")
  internal static let mexicoFlag = ImageAsset(name: "mexico-flag")
  internal static let netherlandsFlag = ImageAsset(name: "netherlands-flag")
  internal static let portugalFlag = ImageAsset(name: "portugal-flag")
  internal static let spainFlag = ImageAsset(name: "spain-flag")
  internal static let swedenFlag = ImageAsset(name: "sweden-flag")
  internal static let switzerlandFlag = ImageAsset(name: "switzerland-flag")
  internal static let turkeyFlag = ImageAsset(name: "turkey-flag")
  internal static let ukFlag = ImageAsset(name: "uk-flag")
  internal static let usaFlag = ImageAsset(name: "usa-flag")

  // swiftlint:disable trailing_comma
  internal static let allImages: [ImageAsset] = [
    algeriaFlag,
    alsaceFlag,
    belgiumFlag,
    canadaFlag,
    egyptFlag,
    franceFlag,
    germanyFlag,
    italyFlag,
    maroccoFlag,
    mexicoFlag,
    netherlandsFlag,
    portugalFlag,
    spainFlag,
    swedenFlag,
    switzerlandFlag,
    turkeyFlag,
    ukFlag,
    usaFlag,
  ]
  // swiftlint:enable trailing_comma
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
