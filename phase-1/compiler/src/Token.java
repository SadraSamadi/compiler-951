public class Token {

    private int type;

    private String value;

    private int row;

    private int col;

    public Token(int type, String value, int row, int col) {
        this.type = type;
        this.value = value;
        this.row = row;
        this.col = col;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getCol() {
        return col;
    }

    public void setCol(int col) {
        this.col = col;
    }

    public void print(String msg) {
        System.out.println("[" + row + ":" + col + "]\t=> (" + type + ")\t" + msg + value);
    }

}
