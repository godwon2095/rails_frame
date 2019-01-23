//= require active_admin/base
//= require activeadmin_addons/all
//= require active_material
//= require tinymce
//= require imageviewer

TinyMCERails.configuration.default = {
  selector: "textarea.tinymce",
  toolbar: ["styleselect | bold italic | undo redo","link | uploadimage"],
  plugins: "link,uploadimage"
};
TinyMCERails.initialize('default', {
  relative_urls : false,             /// 어드민 페이지에서 가끔 발생하는
  remove_script_host : false,        /// 상대 url을 해결해주는
  convert_urls : true,               /// 코드입니다
});

$(function () {
    var viewer = ImageViewer();
    $('img').click(function () {
        var imgSrc = this.src
        viewer.show(imgSrc);
    });
});
