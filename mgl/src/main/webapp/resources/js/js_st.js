$(window).on('load',function(){	
	 //top 개인화 메뉴
  var acdtop = document.getElementsByClassName('move_ct_area'),
    head1_h = $('#head1').outerHeight(true),
    movect = $(acdtop).children('.move_ct'),
    movect_h = movect.outerHeight(true);
  movect.css('top', -movect_h);
  $('#pr_up_btn').on('click', function() {
    var move_cont = $(this).closest('#head1').next(acdtop);;
    if (move_cont.hasClass('open')) {
      move_cont.removeClass('open');
      move_cont.closest('header').removeClass('acd2_vb');
      $(move_cont).find('.move_ct').stop(true, false).animate({
        'top': -movect_h,
        opacity: 0
      }, 200);
      move_cont.children('.more_menu_bg').remove();
    } else {
      move_cont.addClass('open');
      move_cont.closest('header').addClass('acd2_vb');
      $(move_cont).find('.move_ct').stop(true, false).animate({
        'top': head1_h,
        opacity: 1
      }, 200);
      move_cont.append('<div class="more_menu_bg"></div>');
    }
    move_cont.children(".more_menu_bg").click(function() {
      $(this).prev('.move_ct').stop(true, false).animate({
        'top': -movect_h,
        opacity: 0
      }, 200);
      $(this).parent('.move_ct_area').removeClass('open');
      $(this).parents('header').removeClass('acd2_vb');
      $(this).remove();
    });
  });
})

jQuery(document).ready(function($) {
  var $container = $('#container'),
    head_el = document.getElementsByClassName('head_el');
  if ($(head_el).length > 0) {
    var head_sum_h = 0;
    $(head_el).each(function() {
      head_sum_h += $(this).find('.head_top').outerHeight(true);
    });
    var header_h = head_sum_h;
  } else {
    var header_h = $('header').outerHeight(true)
  }
  //container 높이 css
  $(window).on('load resize', function() {
    if ($(head_el).length > 0) {
      var head_sum_h = 0;
      $(head_el).each(function() {
        head_sum_h += $(this).find('.head_top').outerHeight(true);
      });
      var header_h = head_sum_h;
    } else {
      var header_h = $('header').outerHeight(true)
    }
    var $ft = $('#ft_area').find('ul[class*="ft"], .talk_feed');
    if ($ft.length > 0) { //존재확인
      $cont_h = $(window).height() - header_h - $ft.outerHeight();
    } else {
      $cont_h = $(window).height() - header_h;
    }
    var tie_head = document.getElementsByClassName('title_head'),
      $head1_h = $('header').find('.head_top').outerHeight(true);
    if (tie_head.length > 0) { //존재확인
      $(tie_head).css('top', $head1_h)
    }
    $container.css({
      'height': $cont_h,
      "margin-top": header_h
    });
    var fix_top = document.getElementsByClassName('fix_top');
    if (fix_top.length > 0) {
      $fix_top_cont = $(fix_top).next('div');
      $fix_top_cont.css("margin-top", $(fix_top).outerHeight());
    }
  }).trigger('resize');

  //이름 텍스트 짤림...	
  var name_3 = document.getElementsByClassName('name3'),
    na_length = 3; //표시할 글자수
  for (var i = 0, name_le = name_3.length; i < name_le; i++) {
    nle = name_3[i];
    if ($(nle).text().length >= na_length) {
      $(nle).text($(nle).text().substr(0, na_length));
    }
  }

  //클럽이름 club_name-long 짤림...	
  var clublong = document.getElementsByClassName('club_name-long'),
    clublong_le = 10; //표시할 글자수
  for (var i = 0, clublong_lg = clublong.length; i < clublong_lg; i++) {
    var clublong_nu = clublong[i];
    if ($(clublong_nu).text().length >= clublong_le) {
      $(clublong_nu).text($(clublong_nu).text().substr(0, clublong_le));
    }
  }

  //클럽 텍스트 짤림...	    
  var club_css = document.getElementsByClassName('club_name'),
    club_un = 8; //표시할 글자수	  
  for (var i = 0, club_le = club_css.length; i < club_le; i++) {
    var clubnu = club_css[i];
    if ($(clubnu).text().length >= club_un) {
      $(clubnu).text($(clubnu).text().substr(0, club_un));
    }
  }

  //textarea 높이 css
  $(window).on('load resize', function() {
    $('textarea.texbox').on('keyup resize', function() {
      $(this).css('height', 'auto');
      $(this).height(this.scrollHeight);
    }).trigger("keyup");
  });

  //댓글 쓰기 높이	
  $('textarea.write_text').on('keyup resize', function() {
    var value = $(this).val();
    $(this).css('height', 'auto');
    $(this).height(this.scrollHeight);
    var comment_h_cur = $(this).closest('.talk_feed').outerHeight();
    if (comment_h_cur <= 121) {
      $container.css('height', $(window).height() - header_h - comment_h_cur);
    } else {
      if (comment_h_cur > 46) {
        $container.css('height', $(window).height() - header_h + comment_h_cur);
      }
    }
  }).trigger("keyup");

  //댓글 쓰기 포커스
  if (window.location.hash === "#ft_area") {
    $("#ft_area textarea").focus();
  }

  //검색바 토글
  var bt_top = document.getElementsByClassName('bt_top');
  $(bt_top).find('.icon-search').click(function() {
    var search_head = $(this).parents("header").next($container);
    if (search_head.hasClass('input_search')) {
      search_head.removeClass('input_search');
      search_head.find('.search_bar_area').stop(true, false).slideUp(200);
    } else {
      search_head.addClass('input_search');
      search_head.find('.search_bar_area').stop(true, false).slideDown(200);
    }
  });

  //아코디언
  var accordion = document.getElementsByClassName('accordion_ul');
  $(accordion).on('click', '.accd_head', function() {
    var element = $(this).parent('li');
    if (element.hasClass('open')) {
      element.removeClass('open');
      element.children('.accd_a').stop(true, false).slideUp(200);
    } else {
      element.addClass('open');
      element.children('.accd_a').stop(true, false).slideDown(200);
      element.siblings('li').children('.accd_a').stop(true, false).slideUp(200);
      element.siblings('li').removeClass('open');
    }
  });

  //아코디언1
  var acd1 = document.getElementsByClassName('acd_area');
  $(acd1).find('.acd-cont').hide();
  $(acd1).on('click', '.acd-head', function() {
    var acd_p = $(this).parent();
    if (acd_p.hasClass('open')) {
      acd_p.removeClass('open');
      acd_p.children('.acd-cont').stop(true, false).slideUp(200);
      acd_p.find('#map').stop(true, false).animate({
        opacity: 0
      }, 20);
    } else {
      acd_p.addClass('open');
      acd_p.children('.acd-cont').stop(true, false).slideDown(200);
      acd_p.find('#map').stop(true, false).animate({
        opacity: 1
      }, 20);
    }
  });

  //라디오 박스 선택 슬라이드(아코디언)
  $('input[name^="option_add"]').change(function() {
    var check_uls = $(this).closest('.list_check').next('.check_ul_area');
    if ($('#check_detail').is(':checked')) {
      $(check_uls).stop(true, false).slideDown(200);
    } else {
      $(check_uls).stop(true, false).slideUp(200);
    }
  });

  //select 변경...
  var $select = document.getElementsByTagName('select');
  if ($select.length > 0) {
    $($select).prettyDropdown();
    var selectTarget = $('.prettydropdown ul');
    $(selectTarget).each(function() {
      var selectname = $(this).children('.selected').text();
      $(this).before('<label></label>');
      $(this).siblings('label').text(selectname);
      $(this).on('click', function() {
        var select_name = $(this).children('.selected').text();
        $(this).siblings('label').text(select_name);
      });
    });
  }
  //더블메뉴
  var tab_b_double = document.getElementsByClassName('tab_btn_b');
  $(tab_b_double).children('li').each(function() {
    var tab_b_span = $(this).children('span');
    if (tab_b_span.length > 1) {
      $(this).closest('li').addClass('tab_span_double');
    }
  });
  //메뉴(현재 페이지 활성화)
  var path = window.location.pathname.split("/").pop(),
    menutarget = $('.tab_span_double span[onclick*="' + path + '"]');
  menutarget.addClass('active_target');

  //탭
  var tab_nav = document.getElementsByClassName('tab_cont'),
    tab_con = document.getElementsByClassName('tab_cont_con'),
    tab_navli = $(tab_nav).children();
  for (var i = 0, tab_nav_le = tab_nav.length; i < tab_nav_le; i++) {
    var tab_navle = tab_nav[i];
    $(tab_navle).children().first().addClass('active_tab');
  }

  for (var i = 0, tab_con_le = tab_con.length; i < tab_con_le; i++) {
    var tab_conle = tab_con[i];
    $(tab_conle).children().first().show();
  }

  $(tab_navli).click(function(e) {
    //e.stopPropagation();
    var tabIndex = $(tab_navli).index(this);
    /*$(this).siblings().removeClass("active_tab");*/
    $(this).addClass("active_tab");
    $(tab_con).children('.tab_con:eq(' + tabIndex + ')').siblings().hide();
    $(tab_con).children('.tab_con:eq(' + tabIndex + ')').show();
  });

  //tr 드래그 순서 변경
  var tr_move = document.getElementsByClassName('move_tr');
  var tr_mo = $(tr_move).find('td').not('.btn_icons_td');
  if (tr_move.length > 0) {
    $(tr_move).tableDnD({
      onDragStart: function(table, row) {
        // $(table).parent().find('.result').text(row.id);
        $(row).closest('tr').addClass('active_tr');
        $(table).find('tr').siblings().removeClass('move_active');
        $(row).closest('tr').siblings().removeClass('active_tr');
      },
      dragHandle: tr_mo
    });
  }

  //tr 상하 순서 변경
  $(tr_move).on('click', '.icon-arrow-up', function() {
    moveUp(this)
  });
  $(tr_move).on('click', '.icon-arrow-down', function() {
    moveDown(this)
  });

  function moveUp(el) {
    var $tr = $(el).closest('tr');
    $tr.prev().before($tr);
    $tr.addClass('move_active');
    $tr.siblings('tr').removeClass('move_active');
    $tr.siblings('tr').removeClass('active_tr');
  }

  function moveDown(el) {
    var $tr = $(el).closest('tr');
    $tr.next().after($tr);
    $tr.addClass('move_active');
    $tr.siblings('tr').removeClass('move_active');
    $tr.siblings('tr').removeClass('active_tr');
  }

  //첨부파일업로드
  var filebox = document.getElementsByClassName('filebox');
  var fileTarget = $(filebox).find('input.upload-hidden')
  fileTarget.on('change', function() {
    if (window.FileReader) {
      var filename = $(this)[0].files[0].name;
    } else {
      var filename = $(this).val().split('/').pop().split('\\').pop();
    }
    $(this).siblings('.upload-name').val(filename);
  });

  //사인	
  var signature = document.getElementById('signature');
  if ($(signature).length > 0) {
    $(signature).jqSignature({
      lineWidth: 2,
      height: 180
    });
    var sign_btn = $(signature).find('.btn_st');
    $(sign_btn).on('click', function() {
      $(signature).jqSignature('clearCanvas');
      $(this).fadeOut(50);
    });
    $(signature).on('jq.signature.changed', function() {
      $(sign_btn).fadeIn(50);
    });
  }

  // 데이타 넓이 조절	
  $('.el_club_side').each(function() {
    var side_db = $(this).next('.side_rt_db');
    if (side_db.length > 0) {
      side_db.each(function() {
        $side_dt = $(this).outerWidth();
      });
      $(this).css('max-width', 'calc(100% - ' + $side_dt + 'px)');
    }
  });

  // 데이타 no 영역 visible 처리
  var visib_td = document.getElementsByClassName('visible_area_td');
  if ($(visib_td).children('table').has('tr').length > 0) {
    $(visib_td).show();
  } else {
    $(visib_td).hide();
  }
  $('.creat_btn').click(function() {
    if ($(visib_td).children('table').has('tr').length > 0) {
      $(visib_td).show();
    } else {
      $(visib_td).hide();
    }
  });

  var visib_ul = document.getElementsByClassName('visible_area_ul');
  if ($(visib_ul).children('ul').has('li').length > 0) {
    $(visib_ul).show();
  } else {
    $(visib_ul).hide();
  }
  $('.v_all').click(function() {
    if ($(visib_ul).children('ul').has('li').length > 0) {
      $(visib_ul).show();
    } else {
      $(visib_ul).hide();
    }
  });

  //사이드 메뉴 더 보기
  var $menu = $('.btn_more');
  $(".more_menu").each(function() {
    $(this).click(function(e) {
      e.stopPropagation();
      var more_pt = $(this).closest($menu),
        titlehead = $(this).closest('.title_head');
      if (more_pt.hasClass('is-active')) {
        more_pt.removeClass('is-active');
        more_pt.children('.more_menu_bg').remove();
        titlehead.prev('header').css('z-index', 11);
      } else {
        more_pt.addClass('is-active');
        more_pt.append('<div class="more_menu_bg"></div>');
        titlehead.prev('header').css('z-index', 10);
        $(this).siblings().on('click', function(e) {
          e.stopPropagation();
        });
      }
      more_pt.children(".more_menu_bg").click(function() {
        $(this).parent($menu).removeClass('is-active');
        $(this).remove();
        titlehead.prev('header').css('z-index', 11);
      });
    });
  });
  var href_over = document.getElementsByClassName('hrefover');
  $(href_over).on('click', function(e) {
    e.stopPropagation();
  });
  $($menu).each(function() {
    $(this).parent().addClass('noti_btn_is');
  });

  //팝업(읽는 맴버,게스트등록,선수등록)
  var popup_wrap = document.getElementsByClassName('popwin_wrap'),
    popup_s = document.getElementsByClassName('popwin_size'),
    pop_btn = $("[class*='popwin_btn']");

  $(pop_btn).on('click', function() {
    var pop_nb = $(this).attr('class').slice(-1) - 1,
      $popup_nb = $(popup_s).eq(pop_nb),
      $popup_wp = $($popup_nb).parent('.popwin_wrap');
    if (!$($popup_nb).parent().is($popup_wp)) {
      $($popup_nb).wrap('<div class="popwin_wrap"></div>');
    }
    $(window).on('load resize', function() {
      var popup_cont_h = $($popup_nb).outerHeight(),
        title_popup_h2 = $($popup_nb).children('.title_popup').outerHeight() / 2,
        popup_scrollwrap = $($popup_nb).find('.scroll_wrap');
      if (popup_scrollwrap.outerHeight() > $(window).height() / 2) {
        $(popup_scrollwrap).css('height', 70 + 'vh');
        $($popup_nb).css('top', 'calc(50% - ' + 70 / 2 + 'vh - ' + title_popup_h2 + 'px)');
      } else {
        $(popup_scrollwrap).css('height', 'auto');
        $($popup_nb).css('top', 'calc(50% - ' + popup_cont_h / 2 + 'px)');
      }
    }).trigger('resize');
    $(popup_wrap).click(function() {
      if ($(this).children().parent().is(popup_wrap)) {
        $(this).children().unwrap();
      }
      $($menu).each(function() {
        if ($(this).hasClass('is-active')) {
          $(this).removeClass('is-active');
          $(this).children('.more_menu_bg').remove();
        }
      });
    });

    $(popup_wrap).find('.popwin_size').on('click', function(e) {
      e.stopPropagation();
    });

    $(popup_wrap).find(".la-close, .close_popup").click(function() {
      if ($($popup_nb).parent().is(popup_wrap)) {
        $($popup_nb).unwrap();

      }
      $($menu).each(function() {
        if ($(this).hasClass('is-active')) {
          $(this).removeClass('is-active');
          $(this).children('.more_menu_bg').remove();
        }
      });

    });

  });

  // 게시판 텍스트 말줄임	
  var notiBody = document.getElementsByClassName('notiBody');
  if (notiBody.length > 0) { //존재확인	 
    $(notiBody).dotdotdot({
      height: 40,
      watch: 'window'
    });
  }

  var $noti_txtbd = $('.notice_li').find('.txtbd');
  if ($noti_txtbd.length > 0) {
    $($noti_txtbd).dotdotdot({
      height: 60,
      watch: 'window'
    });
  }
  var $txtbd = $('.row_tr').find('.txtbd');
  if ($txtbd.length > 0) { //존재확인				 
    $($txtbd).dotdotdot({
      ellipsis: '',
      height: 90,
      watch: 'window',
      callback: function(isTruncated) {
        if ($(this).hasClass("is-truncated") === true) {
          $(this).append('<span class="more_bt">...더보기</span>');
        }
      }
    });
  }

  //스크롤 네비 위치
  var $sl_nv_area = $('.scroll_nv_area'),
    $sl_tab_cont = $sl_nv_area.children('.tab_cont_con');
  if ($sl_nv_area.length > 0) {
    if ($sl_tab_cont.length > 0) {
      $(window).on('load resize', function() {
        $sl_tab_cont.css('height', $(window).height() - $('header').outerHeight(true) - $sl_tab_cont.prev().outerHeight(true) + 2);
      }).trigger('resize');
      var sl_top_val = $sl_tab_cont.offset().top;
      $sl_nv_area.on('click', '.tab_cont', function(e) {
        $container.stop().animate({
          scrollTop: sl_top_val
        }, 400);
        return false;
      });
    }

    //스크롤 링크 이동	 
    var $scroll_nv = $(".btn-scroll"),
      $contents = $('.scroll_contop');
    $scroll_nv.each(function() {
      var scroll_nv_nb = $(this).index(),
        scroll_nb = $contents.eq(scroll_nv_nb),
        offsetTop = $(scroll_nb).offset().top - $('header').outerHeight(true);
      $(this).on('click', function(e) {
        e.stopPropagation();
        $sl_nv_area.addClass('scroll_nv_fix').css('top', header_h);
        $container.stop().animate({
          scrollTop: offsetTop
        }, 400);
        return false;
      });
    });
    $container.scroll(function() {
      var scrollDistance = $sl_nv_area.offset().top + $sl_nv_area.outerHeight(true);
      $contents.each(function(i) {
        if ($(this).offset().top <= scrollDistance) {
          $($scroll_nv).removeClass('active');
          $($scroll_nv).eq(i).addClass('active');
        }
      });
    });
  }

  //토터먼트
  $('.tourna_match').each(function() {
    $('.time-court').each(function() {
      $timecourt_w = $(this).outerWidth() / 2;
      $(this).not('.time_court_r').css('margin-left', -$timecourt_w);
    });
  });

  var tourna_tds = $('.tourna_td').find('td').not(':first-child');
  $(tourna_tds).each(function(e) {});
  $('.win_line').each(function() {
    $(this).closest('.match_unit').addClass('win_line_p');
  });

  //오각형 대진표
  if ($('.figure5').length > 0) {
    $('.match_data').each(function() {
      var match_data_r = $(':nth-of-type(1),:nth-of-type(2),:nth-of-type(7),:nth-of-type(8)');
      $(this).filter(match_data_r).find('ol').addClass('time_court_r');
      $('.time-court').each(function() {
        $timecourt_w = $(this).outerWidth() / 2;
        $(this).not('.time_court_r').css('margin-left', -$timecourt_w);
        $(this).filter('.time_court_r').css('margin-right', -$timecourt_w);
      });
      var win_lose_r = $(':nth-of-type(1),:nth-of-type(2),:nth-of-type(7),:nth-of-type(8)'),
        win_lose_horiz = $(':nth-of-type(3),:nth-of-type(6)'),
        $win_lose_w = $(this).find('.win_lose').outerWidth() / 2;
      $(this).not(win_lose_r).find('.win_lose').css('margin-left', -$win_lose_w);
      $(this).filter(win_lose_r).find('.win_lose').css('margin-right', -$win_lose_w);
      $(this).filter(win_lose_horiz).find('.win_lose').filter(':nth-of-type(2)').css('margin-right', -$win_lose_w);
    });
    $('.club-player:eq(0)').hover(function() {
      $('.match_data').filter(':eq(0),:eq(4),:eq(7),:eq(9)').toggleClass('data_view');
    });
    $('.club-player:eq(1)').hover(function() {
      $('.match_data').filter(':eq(0),:eq(1),:eq(5),:eq(6)').toggleClass('data_view');
    });
    $('.club-player:eq(2)').hover(function() {
      $('.match_data').filter(':eq(1),:eq(2),:eq(7),:eq(8)').toggleClass('data_view');
    });
    $('.club-player:eq(3)').hover(function() {
      $('.match_data').filter(':eq(2),:eq(3),:eq(6),:eq(9)').toggleClass('data_view');
    });
    $('.club-player:eq(4)').hover(function() {
      $('.match_data').filter(':eq(3),:eq(4),:eq(5),:eq(8)').toggleClass('data_view');
    });
  }

  //사각형 대진표
  if ($('.figure4').length > 0) {
    $('.match_data').each(function() {
      var match_data_r = $(':nth-of-type(2),:nth-of-type(6)');
      $(this).filter(match_data_r).find('ol').addClass('time_court_r');
      $('.time-court').each(function() {
        $timecourt_w = $(this).outerWidth() / 2;
        $(this).not('.time_court_r').css('margin-left', -$timecourt_w);
        $(this).filter('.time_court_r').css('margin-right', -$timecourt_w);
      });
      var win_lose_r = $(':nth-of-type(2),:nth-of-type(6)'),
        win_lose_horiz = $(':nth-of-type(1),:nth-of-type(3)'),
        $win_lose_w = $(this).find('.win_lose').outerWidth() / 2;
      $(this).not(win_lose_r).find('.win_lose').css('margin-left', -$win_lose_w);
      $(this).filter(win_lose_r).find('.win_lose').css('margin-right', -$win_lose_w);
      $(this).filter(win_lose_horiz).find('.win_lose').filter(':nth-of-type(2)').css('margin-right', -$win_lose_w);
    });
    $('.club-player:eq(0)').hover(function() {
      $('.match_data').filter(':eq(0),:eq(3),:eq(4)').toggleClass('data_view');
    });
    $('.club-player:eq(1)').hover(function() {
      $('.match_data').filter(':eq(0),:eq(1),:eq(5)').toggleClass('data_view');
    });
    $('.club-player:eq(2)').hover(function() {
      $('.match_data').filter(':eq(1),:eq(2),:eq(4)').toggleClass('data_view');
    });
    $('.club-player:eq(3)').hover(function() {
      $('.match_data').filter(':eq(2),:eq(3),:eq(5)').toggleClass('data_view');
    });
  }

  //삼각형 대진표
  if ($('.figure3').length > 0) {
    $('.match_data').each(function() {
      var match_data_r = $(':nth-of-type(1)');
      $(this).filter(match_data_r).find('ol').addClass('time_court_r');
      $('.time-court').each(function() {
        $timecourt_w = $(this).outerWidth() / 2;
        $(this).not('.time_court_r').css('margin-left', -$timecourt_w);
        $(this).filter('.time_court_r').css('margin-right', -$timecourt_w);
      });
      var win_lose_r = $(':nth-of-type(1)'),
        win_lose_horiz = $(':nth-of-type(2)'),
        $win_lose_w = $(this).find('.win_lose').outerWidth() / 2;
      $(this).not(win_lose_r).find('.win_lose').css('margin-left', -$win_lose_w);
      $(this).filter(win_lose_r).find('.win_lose').css('margin-right', -$win_lose_w);
      $(this).filter(win_lose_horiz).find('.win_lose').filter(':nth-of-type(2)').css('margin-right', -$win_lose_w);
    });
    $('.club-player:eq(0)').hover(function() {
      $('.match_data').filter(':eq(0),:eq(2)').toggleClass('data_view');
    });
    $('.club-player:eq(1)').hover(function() {
      $('.match_data').filter(':eq(0),:eq(1)').toggleClass('data_view');
    });
    $('.club-player:eq(2)').hover(function() {
      $('.match_data').filter(':eq(1),:eq(2)').toggleClass('data_view');
    });
  }

  // 아이콘 바로가기 
  var app_more = document.getElementsByClassName('app_more');
  $(app_more).on('click', '.app_set_btn', function() {
    $(this).next('.add-apps').toggleClass('apps_view');
    $(this).toggleClass('apps_close');
  });

});