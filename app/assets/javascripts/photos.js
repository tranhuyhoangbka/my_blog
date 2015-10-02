$(document).ready(function(){
  $("#btn-show-one").click(function() {
    $(".show-result").text(I18n.t("alert") + ' \n' + I18n.t("notice"));
    $(".modal-show").click();
  });
});
