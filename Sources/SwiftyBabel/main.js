const utils = require("utils")

function main() {
    console.log('main function handler')
}

const obj = {
    a: "a",
    b: "b"
}

utils.sayHello('kayanouriko')
console.log(main, obj.a, obj.b)
// console.log(main1)


/*
 
 
 const parser = require('@babel/parser');
 
 let code = "2 + 4 * 5";
 
 let ast = parser.parse(code);
 
 let expressionValue = ast.program.body[0].expression.left.value;

 console.log(expressionValue);
 
 
 */
