;(function($){
	$.fn.navi_depth=function(options){
		//옵션값
		var opt={
			pageNum:null,           //메인메뉴 페이지인식
			subNum:null,            //서브메뉴 페이지인식
			motionType:'none',      //모션타입(none,fade,slide)
			motionSpeed:200,        //모션속도(밀리초)
			delayTime:200           //메뉴아웃시 되돌아가는 딜레이시간(밀리초)
		}	
		$.extend(opt,options);
		return this.each(function(){
			var $this=$(this);			
			var $menuList=$this.find('> li');
			var $subList=$menuList.find('>.sub_ul>li');
			var listNum=$menuList.length;
			var fixMenu=opt.pageNum-1;
			var fixSub=opt.subNum-1;
			var currentMenu=fixMenu;
			var currentSub=fixSub;
			var timerId;
			init();			

			function init(){
				setMouseEvent();
				setAnimation();				
			}

			function setMouseEvent(){
				$this.bind('click',function(){
					clearTimeout(timerId);
				});
				$this.bind('mouseleave',function(){
					timerId=setTimeout(setAnimation,opt.delayTime);
				});
				$menuList.bind('click keyup',function(){					
					currentMenu=$(this).index();
					if(currentMenu!=fixMenu){
						currentSub=null;
					}						
					setAnimation();
				});
				$menuList.bind('mouseleave',function(){
					if(currentMenu!=fixMenu){
						currentSub=fixSub;
					}
					currentMenu=fixMenu;						
				});

				$subList.bind('click keyup',function(){
					currentSub=$(this).index();					
					setAnimation();
				});
				$subList.bind('mouseleave',function(){
					var _currentMenu=$(this).closest('.tabs_cont > li').index();
					if(_currentMenu==fixMenu){
						currentSub=fixSub;
					}else{
						currentSub=null;
					}						
				});
			}

			function setAnimation(){
				for(var i=0;i<listNum;i++){
					var _menuList=$menuList.eq(i);
					if(currentMenu==i){
						switch(opt.motionType){
							case 'fade':
								_menuList.find('ul').stop(true,true).fadeIn(opt.motionSpeed);
								break;
							case 'slide':
								_menuList.find('ul').stop(true,true).slideDown(opt.motionSpeed);
								break;
							default:
								_menuList.find('ul').show();
						}				
						_menuList.addClass('active_tab');
						for(var k=0;k<_menuList.find('.sub_ul>li').length;k++){
							var _sub=_menuList.find('.sub_ul>li').eq(k);
							if(currentSub==k){
								_sub.addClass('active_sub');
							}else{
								_sub.removeClass('active_sub');
							}
						}
					}else{
						switch(opt.motionType){
							case 'fade':
								_menuList.find('ul').stop(true,true).fadeOut(opt.motionSpeed/2);
								break;
							case 'slide':
								_menuList.find('ul').stop(true,true).slideUp(opt.motionSpeed/2);
								break;
							default:
								_menuList.find('ul').hide();
						}
						_menuList.removeClass('active_tab');						
						
					}
				}
			}

			function setReplace(_mc,_attr,_old,_new){
				var str=_mc.attr(_attr);
				if(String(str).search(_old)!=-1){
					_mc.attr(_attr,str.replace(_old,_new));
				}
			}
		})
	}
})(jQuery)