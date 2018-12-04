package gx.util;

/**
 * 标记字符串解析处理工具
 * 
 * @author wings
 * 
 */
public class TokenParser {

    private final String openToken;
    private final String closeToken;
    private final TokenHandler handler;

    public TokenParser(String openToken, String closeToken, TokenHandler handler) {
        this.openToken = openToken;
        this.closeToken = closeToken;
        this.handler = handler;
    }

    /**
     * 
     * @param text
     * @return
     */
    public String parse(String text) {
        StringBuilder builder = new StringBuilder();
        if ((text != null) && (text.length() > 0)) {
            char[] src = text.toCharArray();
            int offset = 0;
            int start = text.indexOf(this.openToken, offset);
            while (start > -1) {
                int end = text.indexOf(this.closeToken, start);
                if (end == -1) {
                    builder.append(src, offset, src.length - offset);
                    offset = src.length;
                } else {
                    builder.append(src, offset, start - offset);
                    offset = start + this.openToken.length();
                    String content = new String(src, offset, end - offset);
                    builder.append(this.handler.handleToken(content));
                    offset = end + this.closeToken.length();
                }
                start = text.indexOf(this.openToken, offset);
            }
            if (offset < src.length) {
                builder.append(src, offset, src.length - offset);
            }
        }
        return builder.toString();
    }

    public String parse(String text, char esc) {
        StringBuilder builder = new StringBuilder();
        if ((text != null) && (text.length() > 0)) {
            char[] src = text.toCharArray();
            int offset = 0;
            int start = text.indexOf(this.openToken, offset);
            while (start > -1) {
                if ((start > 0) && (src[(start - 1)] == esc)) {
                    builder.append(src, offset, start - 1).append(this.openToken);
                    offset = start + this.openToken.length();
                } else {
                    int end = text.indexOf(this.closeToken, start);
                    if (end == -1) {
                        builder.append(src, offset, src.length - offset);
                        offset = src.length;
                    } else {
                        builder.append(src, offset, start - offset);
                        offset = start + this.openToken.length();
                        String content = new String(src, offset, end - offset);
                        builder.append(this.handler.handleToken(content));
                        offset = end + this.closeToken.length();
                    }
                }
                start = text.indexOf(this.openToken, offset);
            }
            if (offset < src.length) {
                builder.append(src, offset, src.length - offset);
            }
        }
        return builder.toString();
    }

    static abstract interface TokenHandler {
        public abstract String handleToken(String tokenString);
    }
}
