<%@page pageEncoding="UTF-8"%>
<div class="search_div">
    <form action="http://www.baidu.com/baidu" target="_blank" />
    <input name="tn" type="hidden" value="搜索" />
    <span class="search">
        <input type="text" name="word" baiduSug="1" placeholder="请输入区域关键词" />
    </span>
    <!--注意以上为文本框设置的placeholder属性，为文本框默认显示的文字-->
    <span class="button">
        <input type="submit" value="搜索" />
    </span>
    </form>
</div>