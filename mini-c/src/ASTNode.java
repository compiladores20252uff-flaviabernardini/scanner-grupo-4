import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ASTNode {
    private String name;
    private String value;
    private List<ASTNode> children;

    public ASTNode(String name) {
        this.name = name;
        this.value = null;
        this.children = new ArrayList<>();
    }

    public ASTNode(String name, String value) {
        this.name = name;
        this.value = value;
        this.children = new ArrayList<>();
    }

    public ASTNode addChild(ASTNode child) {
        if (child != null) {
            this.children.add(child);
        }
        return this;
    }

    public ASTNode addChildren(ASTNode... children) {
        for (ASTNode child : children) {
            this.addChild(child);
        }
        return this;
    }

    @Override
    public String toString() {
        StringBuilder buffer = new StringBuilder();
        print(buffer, "", "");
        return buffer.toString();
    }

    private void print(StringBuilder buffer, String prefix, String childrenPrefix) {
        buffer.append(prefix);
        buffer.append(name);
        if (value != null) {
            buffer.append(": ").append(value);
        }
        buffer.append("\n");

        for (Iterator<ASTNode> it = children.iterator(); it.hasNext();) {
            ASTNode next = it.next();
            if (it.hasNext()) {
                next.print(buffer, childrenPrefix + "├── ", childrenPrefix + "│   ");
            } else {
                next.print(buffer, childrenPrefix + "└── ", childrenPrefix + "    ");
            }
        }
    }
}