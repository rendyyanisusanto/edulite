$(document).ready(function($) {
var img = $('.call-media').data('val');
var aft = '';
var name = 'foto[]';

var getUrl = window.location;
var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
var htmlup = ''; 



if( typeof($('.call-media').data('name')) != "undefined" && $('.call-media').data('name') !== null){
  name = $('.call-media').data('name');
}


if( typeof(img) != "undefined" && img !== null){
  aft = img.split(',');
  $.each(aft, function(index, val) {
     htmlup+="<div class='col-xs-4 imggaleri'><input type='hidden' name='"+name+"' value='"+val+"'><img src='"+baseUrl+'/include/media/'+val+"' style='min-height: 100px;' class='img img-responsive'></div>";
  });
}
console.log(aft);
var divup = '<div class="panel panel-flat"><div class="panel-body"><div class="col-xs-2" ><button class="btn btn-success" type="button" id="addmedia">Add Media</button></div><div class="col-xs-10">'+htmlup+'<div class="media-new" style="width: 100%; height: 100px; overflow-y: scroll;"></div></div></div></div>';
divup+='<div id="modal_large" class="modal fade" tabindex="-1" style="display: none;"><div class="modal-dialog modal-lg">';
divup+='              <div class="modal-content">';
divup+='                <div class="modal-header">';
divup+='                  <button type="button" class="close" data-dismiss="modal">×</button>';
divup+='                  <h5 class="modal-title">Upload Media</h5>';
divup+='                </div>';
divup+='                <div class="modal-body">';
divup+='                    <h6 class="text-semibold">Upload File</h6>';
divup+='                  <form class="frm_up">';
divup+='                    <input type="file" name="file_upload" class="file_upload">';
divup+='                    <br>';
divup+='                  </form>';
divup+='                    <button class="btn btn-success btn-upload" type="button">Upload</button>';
divup+='                  <hr>';
divup+='                  <h6 class="text-semibold">Galeri</h6>';
divup+='                  <div class="col-xs-12">';
divup+='                    <div class="galeri" style="width: 100%; height: 300px; overflow-y: scroll;">';
divup+='                      ';
divup+='                    </div>';
divup+='                  </div>';
divup+='                </div>';
divup+='                <div class="modal-footer">';
divup+='                  <button type="button" class="btn btn-link legitRipple" data-dismiss="modal">Close<span class="legitRipple-ripple" style="left: 46.1096%; top: 21.0526%; transform: translate3d(-50%, -50%, 0px); width: 225.28%; opacity: 0;"></span></button>';
divup+='                  <button type="button" class="btn btn-primary legitRipple btn-simpan">Simpan</button>';
divup+='                </div>';
divup+='              </div>';
divup+='            </div>';
divup+='          </div>';

$('.call-media').html(divup);

$('#addmedia').on('click', function(){
	get_galeri();
	$('#modal_large').modal("show");
});
$(document.body).on('click', '.btn-upload', function(event) {
	event.preventDefault();
	var formData = new FormData();
	formData.append('file_upload', $('.file_upload')[0].files[0]); 
            send_ajax_file( 'media/add_media',formData).then( function(data){
                var response = JSON.parse(data);
                console.log(response);
                get_galeri();
                toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
           });

});
function get_galeri()
{
	send_ajax( 'media/get_galeri',{} ).then( function(data){
            $('.galeri').html(data);
        });
}
$.fn.hasBorder = function() {   
  if ((this.outerWidth() - this.innerWidth() > 0) ||  (this.outerHeight() - this.innerHeight() > 0)){
        return true;
    }
    else{
        return false;
    }
};
var selectedImgsArr = [];
    $(document.body).on('click', '.img-galeri' ,function(){
      if($(this).hasClass("selected-image"))
           $(this).removeClass("selected-image");
      else
           $(this).addClass("selected-image");
      console.log($(this).hasBorder())
   });

  $(document.body).on('click','.btn-simpan', function(){
    $(".selected-image").each(function() {  
	   imgsrc = $(this).attr('data-img');
	   htmlsrc = $(this).attr('src');
	    var html_set = "<div class='col-xs-4 imggaleri'><input type='hidden' name='"+name+"' value='"+imgsrc+"'><img src='"+htmlsrc+"' style='min-height: 100px;' class='img img-responsive'></div>";
	    $('.media-new').append(html_set);
	});  
	$('#modal_large').modal('toggle'); 
   })

   $(document.body).on('click', '.imggaleri', function(event) {
   	event.preventDefault();
   	$(this).remove();
   });
});

