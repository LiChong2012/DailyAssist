package twitterapi;
/**
 *
 * @author HUA
 */

public class TweetEntity {

    public int start;
    public int end;
    public String entity;
    public int type; //1---URL; 2---Hashtag; 3---Media; 4---UserMention

    
    public TweetEntity() {
        start = -1;
        end = -1;
        entity = "";
        type = -1;
    }

    public TweetEntity(int istart, int iend, String sentity, int itype) {
        start = istart;
        end = iend;
        entity = sentity;
        type = itype;
    }
}
