$(function(){
  hideSubmitButtons();
  addScoreListener();
})

function hideSubmitButtons() {
  $("form[class$='score'] input[type='submit']").addClass("hidden");
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

  $numInput.change(function(){
    $(this).parents("form").submit();
  });
}

