//
//  JSContext-Extensions.swift
//  JavascriptCoreDemo
//
//  Created by 茅野瓜子 on 2022/6/27.
//

import JavaScriptCore

extension JSContext {
    
    /// Turn on enhanced mode
    /// Includes console.log functionality and nodejs-like require import functionality
    func enhancementMode() {
        addUtils()
        addRequire()
    }
    
    func addRequire() {
        let context = self
        let callback: (String) -> JSValue = { jsName in
            // Here we only focus on the import of js in the target
            // In actual business, generally speaking, the operations of these js imports should be used as plug-in-like effects and stored in folders such as document
            // At this time, you should use FileManager to operate to obtain the relevant path
            var moduleName = jsName
            if (jsName.hasSuffix(".js")) {
                moduleName = jsName.replacingOccurrences(of: ".js", with: "")
            }
            let path = Bundle.main.path(forResource: moduleName, ofType: "js") ?? ""
            let moduleContent = try? String(contentsOfFile: path, encoding: .utf8)
            // Imitate the implementation principle of require of nodejs
            // Simply put, it is to wrap the content of the js file in a function and export module.exports to the outside world
            // With the help of evaluateScript function, it is easy to implement
            let js = """
            (() => {
                let module = {}
                module.exports = {}
                let exports = module.exports
                \(moduleContent ?? "")
                return module.exports
            })()
            """
            return context.evaluateScript(js)
        }
        setObject(callback, forKeyedSubscript: "require" as NSCopying & NSObjectProtocol)
    }
    
    func addUtils() {
        // Inject js script
        // Used to define some global objects and functions
        
        // Define a simple console.log function
        let js = """
        const console = {
            log: (...message) => {
                _consoleLog(message.join(" "))
            }
        }
        """
        evaluateScript(js)
        
        // Set the callback to provide native use, for outputting printing information to the Xcode Console
        let callback: @convention(block) (String?) -> Void = {
            print("[JavaScriptCore]: \($0 ?? "undefined")")
        }
        setObject(callback, forKeyedSubscript: "_consoleLog" as NSCopying & NSObjectProtocol)
    }
}
