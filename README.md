# Parser_Pratice

Write a YaCC/bison Specification and build a YaCC/bison lexical analyzer with Flex to build a parser. 

## about 
 
The parser needs to be able to print the analyzed source code lines on the screen after parsing the grammar.

    $ ./a.out < input.java

   output :
    
    Total line_number : 20
    
Make it possible to print parsing errors on the screen.

    $ ./a.out < example.java

   output :

    Error : syntax error encoutered at line number:1
