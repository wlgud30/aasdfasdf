jQuery(document).ready(function($) {
    var $ft_active = $('#ft_nv1 li'),
        $bt_top_is = $('.title_head .bt_top');
       // $bt_top_btn = $bt_top_is.children('.btn_st');

    $ft_active.each(function() {
        var ft_nv_nb = $(this).index(),
            btn_nb = $bt_top_is.eq(ft_nv_nb);
        if ($(this).hasClass('act_circle')) {
            btn_nb.siblings('.bt_top').remove();
        }
    });
});