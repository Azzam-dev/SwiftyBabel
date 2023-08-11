//
//  Loader.swift
//  FractalBabelLoader
//  Copyright © 2018 Giuseppe Salvo. All rights reserved.
//

import Foundation
import JavaScriptCore

class SwiftyBabel {
    
    var options : [String: Any] = ["presets": ["es2015"]]
    
    required init() {
        firstInit()
    }
    
    required init(options: [String: Any]) {
        self.options = options
        firstInit()
    }
    
    // Initializing lazy JSContext
    func firstInit() {
        _ = try? transpile(code: "var __BABEL_LOADER_TEST__ = 'Hello World'")
    }
    
    func transpile(code: String) throws -> String? {
        guard let context = BabelContext.shared.context else {
            throw BabelLoaderError(.nilBabelContext, value: "found nil in Babel Context")
        }
        let babel = context.globalObject.forProperty("Babel")
        
        let value = babel!.invokeMethod("transform", withArguments: [
            code, options
        ])!.forProperty("code")
        
        if let exception = context.exception {
            context.exception = nil
            throw BabelLoaderError(.codeNotValid, value: exception)
        }
        
        return value!.toString()!
    }
    
    func parse(code: String) throws -> JSValue {
        guard let context = BabelContext.shared.context else {
            throw BabelLoaderError(.nilBabelContext, value: "found nil in Babel Context")
        }
        let babel = context.globalObject.forProperty("Babel")
        
        let value = babel!.invokeMethod("parse", withArguments: [
            code, options
        ])!.forProperty("code")
        
        if let exception = context.exception {
            context.exception = nil
            throw BabelLoaderError(.codeNotValid, value: exception)
        }
        
        return value!
    }
    
    func generate(ast: JSValue) throws -> String? {
        guard let context = BabelContext.shared.context else {
            throw BabelLoaderError(.nilBabelContext, value: "found nil in Babel Context")
        }
        let babel = context.globalObject.forProperty("Babel")
        
        let value = babel!.invokeMethod("generate", withArguments: [
            ast, options
        ])!.forProperty("code")
        
        if let exception = context.exception {
            context.exception = nil
            throw BabelLoaderError(.codeNotValid, value: exception)
        }
        
        return value!.toString()!
    }

}
