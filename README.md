# ruby-hcl
Ruby Parser for the Hashicorp Configuration Language


### Lexer
  - Built using the `rexical` library (https://github.com/tenderlove/rexical)
  
### Parser
  - Built using the `racc` library (https://github.com/tenderlove/racc)

---
### Hashicorp Configuration Language
  - (https://github.com/hashicorp/hcl)
  
#### Examples
``` ruby
  some_value "other_value" {
    key = "value"
  }
```

will create a hash which looks like:

`{"some_value" => {"other_value" => {"key" => "value"}}}`
  
## Ruby-HCL Usage

``` ruby
require 'hcl'
require 'json'

parser = HCLParser.new(File.read("file_to_parse.hcl"))
puts JSON.dump(parser)
```


#### TODO
- [x] Properly handle nested multi-line comments
- [x] Properly handle floating point values
- [ ] Create a `HCL` class as an to load/dump/parse `HCL` files
- [x] Write tests for the lexer
- [ ] Write tests for the parser


