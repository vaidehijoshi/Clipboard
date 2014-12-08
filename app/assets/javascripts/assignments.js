$(function(){
  hideSubmitButtons();
  addScoreListener();
})

function hideSubmitButtons() {
  $("input[type='submit'].score-submit").hide();
}

function addScoreListener() {
  $numInput = $("input#score_points_earned");
  // $numInput.on('keyup change click', function (e) {
  //   if ( $(this).data("previousValue") != $(this).val() ) {
  //       console.log("changed");           
  //       $(this).data("previousValue", $(this).val());
  //       // $(this).parent("form").submit();
  //   }      
  // });
  // $numInput.each(function () {
  //     $(this).data("previousValue", $(this).val());
  // });

  $numInput.keydown(function(event){
    if(event.keyCode === 13) {
      event.preventDefault();
      $(this).trigger("blur");
    }
  });

  $numInput.change(function(){
    $form = $(this).parents("form");
    if ($(this).val() === "") {
      $form.find("input[name='_method']").val("delete");
    }
    $form.submit();
  });
}


