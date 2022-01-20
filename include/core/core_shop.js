$(document).ready(function($){
	$(document.body).on("click",".app-cart", function(){
		send_ajax( $(this).data("link"),$(this).data() ).then( function(data){
            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
            get_count_cart();
        });
	});
})

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

function get_count_cart()
{
	send_ajax( "frontend/get_count_cart",{} ).then( function(data){
        $(".app-count-cart").text(data);
    });
}