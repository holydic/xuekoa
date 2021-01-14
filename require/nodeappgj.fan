模块和app结构
npm init ->package.json
package.json-start脚本 ->npm start 或 node index.js

├── app
| ├── calc.js 函数，module.exports.sum = sum 
| └── index.js calc = require('./calc')，变量， result = calc.sum(numbersToAdd)，打印
├── index.js require('./app/index') 
└── package.json
