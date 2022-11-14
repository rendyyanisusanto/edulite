$(document).ready(function($) {
  
    if (window.location.hash.substr(1)!='') {
      set_content(window.location.hash.substr(1));
    }

    $(document.body).on('click', '.app-item' ,function(){
        set_content($(this).attr('href'));
        return false;
    });
    $(document.body).on('click', '#select_all' ,function(){
      if(this.checked){
        $('.checkbox').each(function(){
          this.checked = true;
        });
        }else{
        $('.checkbox').each(function(){
                    this.checked = false;
        });
        }
    });
        
    $(document.body).on('click', '.checkbox' ,function(){
        if($('.checkbox:checked').length == $('.checkbox').length){
          $('#select_all').prop('checked',true);
        }else{
          $('#select_all').prop('checked',false);
        }
    });
    
    $(window).on('popstate', function(event) {
      
      set_content(window.location.hash.substr(1));
    });


});

function blockui(block)
{
    $(block).block({
            
            message: '<i class="icon-spinner4 spinner"></i>',
            overlayCSS: {
                backgroundColor: '#0E8F92',
                opacity: 0.9,
                cursor: 'wait'
            },
            css: {
                border: 0,
                padding: 0,
                color: '#fff',
                backgroundColor: 'transparent'
            }
        });
}

function unblockui(block)
{
  $(block).unblock();
}
function set_content(url, data_send="")
{
  $('#focus-set').get(0).focus();
  $('.se-pre-con').css('display','block');
  var url_set=url;
        
  $.ajax({
    url: url_set,
    datatype:'html',
    type:'POST',
    data:data_send,
    success: function(result){
     
      // window.history.pushState(null,null, url_set);
      window.location.hash = url_set;
      $(".se-pre-con").fadeOut("slow");
      $(".app-content").html(result);  
      
  }});
   
}

function send_ajax(url_get, data_get)
{
  return $.ajax({
    url : url_get,
    type: "POST",
    data: data_get,
    success: function () {
    },
    error: function (jXHR, textStatus, errorThrown) {
    }
    });
}

function send_ajax_file(url_get, data_get)
{
  return $.ajax({
    url : url_get,
    type: "POST",
    data: data_get,
    processData:false,
    contentType:false,
    cache:false,
    success: function () {
    },
    error: function (jXHR, textStatus, errorThrown) {
    }
    });
}

function noty(text, type)
{
  new Noty({
            text: 'You successfully read this important alert message.',
            type: 'success'
        }).show();
}

function random_string(lngt)
{
  var result = '';
  var chars = 'ABCDEFGHIJKLMNOPQRSTUVWQYZabcdefghijklmnopqrstuvwxyz1234567890';
  var chars_lgt = chars.length;
  for (var i = 0; i < chars_lgt; i++) {
    result += chars.charAt(Math.floor(Math.random()*chars_lgt));
  }
  return result;
}




