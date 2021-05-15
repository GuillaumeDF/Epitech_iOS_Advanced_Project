import Foundation
import ArgumentParser

struct CreateModule: ParsableCommand {
    
    @Argument(help: "The name of the framework")
    var name: String
    
    func run() throws {
        let fileManager = FileManager()
        
        let currentPath = fileManager.currentDirectoryPath
        let templatePath = currentPath + "/Template/"
        let frameworksPath = currentPath + "/Flag/Frameworks/"
        let frameworkNamePath = frameworksPath + self.name + "/"

        do {
            //try fileManager.createDirectory(atPath: frameworksPath, withIntermediateDirectories: false, attributes: [:])
            try fileManager.createDirectory(atPath: frameworkNamePath, withIntermediateDirectories: true, attributes: [:])
        } catch {}

        let files = try fileManager.contentsOfDirectory(atPath: templatePath)
        files.forEach { (filePath) in
        do {
            try fileManager.copyItem(atPath: templatePath + filePath, toPath: frameworkNamePath + filePath)
        } catch {}
            let content = fileManager.contents(atPath: templatePath + filePath)
            let string = String(data: content ?? Data(), encoding: .utf8)
            let replace = string?.replacingOccurrences(of: "__TEMPLATE__", with: name)
            do {
                try replace?.write(toFile: frameworkNamePath + filePath, atomically: true, encoding: .utf8)
            } catch {}
        }
        do {
            try fileManager.moveItem(atPath: frameworkNamePath + "__TEMPLATE__.podspec", toPath: frameworkNamePath + self.name + ".podspec")
        } catch {}
        print("A podspec was created in " + frameworkNamePath + self.name + ".podspec" + " directory\n")
        if (self.name == "Home") {
            print("Home needs Core dependency")
            print("Please open the file: " + frameworkNamePath + self.name + ".podspec")
            print("Uncomment the last line : #s.dependency 'Core'")
            print("Save\n")
        }
        print("Move at the root of the project Flag")
        print("Create or open Podfile")
        print("Add: pod '" + self.name + "', :path => './Frameworks/" + self.name + "/'")
        print("Run pod install")
    }
}

CreateModule.main()
