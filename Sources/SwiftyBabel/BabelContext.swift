//
//  BabelContext.swift
//  FractalBabelLoader//  Copyright © 2018 Giuseppe Salvo. All rights reserved.
//

import JavaScriptCore

class BabelContext {
    
    static let shared = BabelContext()

    let context = JSContext()
    
    private init() {
        
        guard let babelURL = Bundle.module.url(forResource: "babel", withExtension: "js") else {
            print("error: failed while loading babel.min.js file")
            return
        }
        
        do {
            let babelContent = try String(contentsOf: babelURL)
            _ = context?.evaluateScript(babelContent)
        } catch {
            print("error: failed while loading babel.min.js content")
            return
        }
    }

}
