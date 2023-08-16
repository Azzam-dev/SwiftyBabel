//
//  BabelContext.swift
//  FractalBabelLoader//  Copyright © 2018 Giuseppe Salvo. All rights reserved.
//

import JavaScriptCore

class BabelTranspilerContext {
    
    static let shared = BabelTranspilerContext()

    let context = JSContext()
    
    private init() {
        
        guard let babelURL = Bundle.module.url(forResource: "babel", withExtension: "js") else {
            print("error: failed while loading babel.js file")
            return
        }
        
        do {
            let babelContent = try String(contentsOf: babelURL)
            _ = context?.evaluateScript(babelContent)
        } catch {
            print("error: failed while loading babel.js content")
            return
        }
    }

}

class EsprimaParserContext {
    
    static let shared = EsprimaParserContext()

    let context = JSContext()
    
    private init() {
        
        guard let esprimaURL = Bundle.module.url(forResource: "esprima", withExtension: "js") else {
            print("error: failed while loading esprima.js file")
            return
        }
        
        do {
            let esprimaContent = try String(contentsOf: esprimaURL)
            _ = context?.evaluateScript(esprimaContent)
        } catch {
            print("error: failed while loading esprima.js content")
            return
        }
    }

}
