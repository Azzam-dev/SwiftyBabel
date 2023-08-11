//
//  SwiftyBabel.swift
//  SwiftyBabel
//
//  Created by Azzam AL-Rashed on 10/08/2023.
//

import JavaScriptCore


public struct SwiftyBabel {
    public static let instance = SwiftyBabel()
    let context: JSContext? = {
        let jsContext: JSContext = JSContext()
        
        jsContext.enhancementMode()
        guard let babelPath = Bundle.main.path(forResource: "main", ofType: "js") else {
            print("error: could not load the file")
            return nil
        }
        
        
        let babelCode = try? String(contentsOfFile: babelPath, encoding: .utf8)
        
        jsContext.evaluateScript(babelCode)
        
        return jsContext
    }()
    
    public func parse(code: String, options: [String: Any]? = nil) -> JSValue? {
        guard let context = context else { return nil }
        var options = options
        options?["presets"] = ["preset-env"]
        
        let result: JSValue = context.objectForKeyedSubscript("Babel").invokeMethod("transform", withArguments: [code, options ?? [:]])
        
        
        return result.objectForKeyedSubscript("code")
    }
    
    public func generate(ast: JSValue, options: [String: Any]? = nil) -> String? {
        guard let context = context else { return nil }
        var options = options
        options?["presets"] = ["preset-env"]
        
        let result = context.objectForKeyedSubscript("Babel").invokeMethod("transform", withArguments: [ast, options ?? [:]]).toString()
        
        
        return result
    }
}
