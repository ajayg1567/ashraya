$(document).ready ->
  dateToday = new Date();
  start = new Date();

  $('.calendar').datepicker 
    format: 'dd/mm/yyyy' 
    minDate: dateToday 
    yearRange: start.getFullYear() + ':' + start.getFullYear()
    beforeShowDay: (date) ->
      month = date.getMonth() + 1 
      month = if month.toString().length < 2 then '0'+ month.toString() else month
      dmy = date.getFullYear()+ '/'+ month + '/' + date.getDate()
      console.log dmy
      window.ths = $(this)
      if $.inArray(dmy, gon.dates) >= 0
        elem = gon.dates_details[dmy]
        if elem.booked || ( elem.breakfast && elem.lunch && elem.dinner)
          [
            true
            'booked'
          ]
        else
          [
            true
            ''
          ]

      else
        [
          true
          ''
        ]

  $("body").on {
    mouseover: (e) ->
      content = "<div class='event-tooltip-content container-fluid'>
                  <i class='fa fa-spinner fa-spin hide' style='font-size:48px'>
                  </i> 
                  <div class='row'>
                    <div class='checkbox'>
                      <label class='radio-inline'>Available</label>
                      <span class='glyphicon glyphicon-stop' aria-hidden='true' style='background-color:#24ec24;color:#24ec24'></span>
                      
                      <label class='radio-inline'>Booked</label>
                      <span class='glyphicon glyphicon-stop' aria-hidden='true' style='background-color:#337ab7;color:#337ab7'></span></label>        
                    </div>
                  </div>
                  <div class='row'>
                    <div class='col-md-5'>
                      <br>
                    </div>
                  </div>
                  <div class='row'>
                    <div class='btn-group btn-group-justified'>
                      <a href='#' class='btn btn-primary breakfast' disabled='disabled' >Breakfast</a>
                      <a href='#' class='btn btn-primary lunch' disabled= 'disabled' >Lunch</a>
                      <a href='#' class='btn btn-primary dinner' disabled= 'disabled' >Dinner</a>
                    </div>
                  </div>
             </div>"

      ths = e.currentTarget
      window.events = e
      $(".popover").remove()
      $(ths).popover
        trigger: 'manual'
        container: 'body'
        html: true
        title: 'Sponsor Info<a href="#" class="close" data-dismiss="alert">x</a>'
        content: content

      #if $(ths).
      $(ths).popover('show')
      $(ths).on 'shown.bs.popover', ->
        month = ($(ths).closest("td").data('month') + 1).toString()
        month = if month.toString().length < 2 then '0'+ month.toString() else month
        current_date = $(ths).closest("td").data('year')+ '/'+ month + '/' + $(ths).html()
        current_val = null
        current_val = gon.dates_details[current_date]
        if current_val != null || current_val != '' || current_val != undefined
          if !current_val.breakfast
            $(".breakfast").attr('disabled',false).css({"background-color":"#24ec24"})
          if !current_val.lunch
            $(".lunch").attr('disabled',false).css({"background-color":"#24ec24"})
          if !current_val.dinner
            $(".dinner").attr('disabled',false).css({"background-color":"#24ec24"})

          if current_val.breakfast
            $(".breakfast").css({"pointer-events":"none"})
          if current_val.lunch
            $(".lunch").css({"pointer-events":"none"})
          if current_val.dinner
            $(".dinner").css({"pointer-events":"none"})
  

    click: (e) ->
      ths = e.currentTarget
      $(ths).popover('hide')

    select: (e) ->
      ths = e.currentTarget
      $(ths).popover('hide')

  }, '[data-handler=selectDay] a:not(.ui-state-active)' 

  $(document).on 'click', '.popover .close', ->
    $(this).parents('.popover').popover 'hide'
    return
  