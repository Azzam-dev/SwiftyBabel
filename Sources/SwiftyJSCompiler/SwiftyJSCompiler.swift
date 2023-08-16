//
//  SwiftyBabel.swift
//  FractalBabelLoader
//  Copyright © 2018 Giuseppe Salvo. All rights reserved.
//

import Foundation
import JavaScriptCore

class SwiftyJSCompiler {
    
    var options : [String: Any] = ["presets": ["es2015"]]
    var optionse : [String: Any] = ["jsx": true]
    
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
        guard let context = BabelTranspilerContext.shared.context else {
            throw LoaderError(.nilContext, value: "found nil in Babel Context")
        }
        let babel = context.globalObject.forProperty("Babel")
        
        let code = babel!.invokeMethod("transform", withArguments: [
            code, options
        ])!.forProperty("code")
        
        if let exception = context.exception {
            context.exception = nil
            throw LoaderError(.codeNotValid, value: exception)
        }
        
        return code?.toString()
    }
    
    func parse(code: String) throws -> JSValue? {
        guard let context = EsprimaParserContext.shared.context else {
            throw LoaderError(.nilContext, value: "found nil in Esprima Context")
        }
        let esprima = context.globalObject.forProperty("esprima")
        let ast = esprima!.invokeMethod("parse", withArguments: [code, optionse]).forProperty("body")
        print("did I do it?:", ast!.toObject())
        
        if let exception = context.exception {
            print("what is going on here???!", context.exception)
            context.exception = nil
            throw LoaderError(.codeNotValid, value: exception)
        }
        
        return ast
    }
    
    func generate(ast: JSValue) throws -> String? {
        guard let context = BabelTranspilerContext.shared.context else {
            throw LoaderError(.nilContext, value: "found nil in Babel Context")
        }
        let babel = context.globalObject.forProperty("Babel")
        
        let value = babel!.invokeMethod("generate", withArguments: [
            ast, options
        ])!.forProperty("code")
        
        if let exception = context.exception {
            context.exception = nil
            throw LoaderError(.codeNotValid, value: exception)
        }
        
        return value?.toString()
    }

}
