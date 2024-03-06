
$(function() {
    let tabList = $('.tab');
    let infoList = $('.info');

    tabList.click(function() {
        tabList.removeClass('active');
        infoList.removeClass('active');

        $(this).addClass('active');
        infoList.eq(tabList.index(this)).addClass('active');
    });
})