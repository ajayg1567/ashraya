(function(){$(document).ready(function(){var e,n;return e=new Date,n=new Date,$(".calendar").datepicker({format:"dd/mm/yyyy",minDate:e,yearRange:n.getFullYear()+":"+n.getFullYear(),beforeShowDay:function(e){var n,a,t;return t=e.getMonth()+1,t=t.toString().length<2?"0"+t.toString():t,n=e.getFullYear()+"/"+t+"/"+e.getDate(),console.log(n),window.ths=$(this),$.inArray(n,gon.dates)>=0?(a=gon.dates_details[n],a.booked||a.breakfast&&a.lunch&&a.dinner?[!0,"booked"]:[!0,""]):[!0,""]}}),$("body").on({mouseover:function(e){var n,a;return n="<div class='event-tooltip-content container-fluid'> <i class='fa fa-spinner fa-spin hide' style='font-size:48px'> </i> <div class='row'> <div class='checkbox'> <label class='radio-inline'>Available</label> <span class='glyphicon glyphicon-stop' aria-hidden='true' style='background-color:#24ec24;color:#24ec24'></span> <label class='radio-inline'>Booked</label> <span class='glyphicon glyphicon-stop' aria-hidden='true' style='background-color:#337ab7;color:#337ab7'></span></label> </div> </div> <div class='row'> <div class='col-md-5'> <br> </div> </div> <div class='row'> <div class='btn-group btn-group-justified'> <a href='#' class='btn btn-primary breakfast' disabled='disabled' >Breakfast</a> <a href='#' class='btn btn-primary lunch' disabled= 'disabled' >Lunch</a> <a href='#' class='btn btn-primary dinner' disabled= 'disabled' >Dinner</a> </div> </div> </div>",a=e.currentTarget,window.events=e,$(".popover").remove(),$(a).popover({trigger:"manual",container:"body",html:!0,title:'Sponsor Info<a href="#" class="close" data-dismiss="alert">x</a>',content:n}),$(a).popover("show"),$(a).on("shown.bs.popover",function(){var e,n,t;if(t=($(a).closest("td").data("month")+1).toString(),t=t.toString().length<2?"0"+t.toString():t,e=$(a).closest("td").data("year")+"/"+t+"/"+$(a).html(),n=null,(null!==(n=gon.dates_details[e])||""!==n||void 0!==n)&&(n.breakfast||$(".breakfast").attr("disabled",!1).css({"background-color":"#24ec24"}),n.lunch||$(".lunch").attr("disabled",!1).css({"background-color":"#24ec24"}),n.dinner||$(".dinner").attr("disabled",!1).css({"background-color":"#24ec24"}),n.breakfast&&$(".breakfast").css({"pointer-events":"none"}),n.lunch&&$(".lunch").css({"pointer-events":"none"}),n.dinner))return $(".dinner").css({"pointer-events":"none"})})},click:function(e){var n;return n=e.currentTarget,$(n).popover("hide")},select:function(e){var n;return n=e.currentTarget,$(n).popover("hide")}},"[data-handler=selectDay] a:not(.ui-state-active)"),$(document).on("click",".popover .close",function(){$(this).parents(".popover").popover("hide")})})}).call(this);