/**********************************************************************
* Compiler Project – Phase 2                                          *
* Language : Eiffel                                                   *
* Team :                                                              *
*   1. Sadra Samadi             - 9312268122                          *
*   2. Hamid Hosseini Nejad     - 9312268110                          *
***********************************************************************/

import java.io.*;

public class Main {

    static public void main(String argv[]) {
        try {
            String file = argv[0];
            FileReader fileReader = new FileReader(file);
            Lexer lexer = new Lexer(fileReader);
            Parser parser = new Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
