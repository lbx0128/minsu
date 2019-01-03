$("#button-search").click(function () {
    // 获取搜索的关键字
   // console.log($("#text-search").val());
    if($("#text-search").val() === ""){
        alert("请勿输入空值");
    }
    else window.location.href = "/user/search_city/" + $("#text-search").val();
});