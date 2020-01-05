/**********************************************************************
 * Compiler Project – Phase 2                                          *
 * Language : Eiffel                                                   *
 * Team :                                                              *
 *   1. Sadra Samadi             - 9312268122                          *
 *   2. Hamid Hosseini Nejad     - 9312268110                          *
 ***********************************************************************/

import java.util.HashMap;
import java.util.Map;

public class Eiffel {

    private static Map<String, Integer> map = new HashMap<>();

    public static void define(String name) {
        if (map.containsKey(name)) {
            System.err.println("Variable already defined <" + name + ">");
            System.exit(0);
        }
        map.put(name, null);
        System.out.println("define integer <" + name + ">\n");
    }

    public static void assign(String name, Integer value) {
        check(name);
        map.replace(name, value);
        System.out.println("}=" + value + " to <" + name + ">\n");
    }

    public static Integer get(String name) {
        check(name);
        Integer value = map.get(name);
        System.out.print("[" + name + "=" + value + "]");
        return value;
    }

    private static void check(String name) {
        if (!map.containsKey(name)) {
            System.err.println("Variable not defined <" + name + ">");
            System.exit(0);
        }
    }

}
