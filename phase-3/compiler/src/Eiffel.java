/**********************************************************************
 * Compiler Project – Phase 3                                          *
 * Language : Eiffel                                                   *
 * Team :                                                              *
 *   1. Sadra Samadi             - 9312268122                          *
 *   2. Hamid Hosseini Nejad     - 9312268110                          *
 ***********************************************************************/

import java.util.*;

public class Eiffel {

    public static List<Var> vars = new ArrayList<>();

    public static List<Var> args = new ArrayList<>();

    public static String function;

    public static List<Object> params;

    public static Eiffel.Var define(String name, Class<?> type) {
        Var var = new Var(name, type, null);
        vars.add(var);
        return var;
    }

    public static void assign(String name, Object value) {
        for (Var var : vars)
            if (Objects.equals(var.name, name)) {
                if (Objects.equals(var.type, value.getClass())) {
                    var.value = value;
                    return;
                } else
                    throw new RuntimeException("Required <" + var.type.getSimpleName() +
                            "> for variable <" + var.name +
                            "> But found <" + value.getClass().getSimpleName() + "> !");
            }
        throw new RuntimeException("Variable not defined <" + name + "> !");
    }

    public static Var get(String name) {
        for (Var var : vars)
            if (Objects.equals(var.name, name))
                return var;
        throw new RuntimeException("Variable not defined <" + name + "> !");
    }

    public static void call() {
        if (params.size() > args.size())
            throw new RuntimeException("Passed parameters are more than defined arguments !");
        for (int i = 0; i < args.size(); i++) {
            Eiffel.Var arg = args.get(i);
            if (i > params.size() - 1)
                throw new RuntimeException("Can't run function <" + function +
                        ">, Parameter not found <" + arg.name + "> !");
            Object param = params.get(i);
            if (!Objects.equals(arg.type, param.getClass()))
                throw new RuntimeException("Can't run function <" + function + ">, Required <" +
                        arg.type.getSimpleName() + "> for parameter <" + arg.name + ">, But found <" +
                        param.getClass().getSimpleName() + "> !");
        }
    }

    public static class Var {

        public String name;

        public Class<?> type;

        public Object value;

        public Var(String name, Class<?> type, Object value) {
            this.name = name;
            this.type = type;
            this.value = value;
        }

    }

}
