$(function(){
  addTemplateSelectListener();
  addSelectAllListeners();
})

function addTemplateSelectListener() {
  var $customEmail = $("div#custom-email")
  $("select#email_template").change(function(){
    if ($(this).val() === "") {
      $customEmail.show();
    }
    else {
      $customEmail.hide();
    }
  });
}

function addSelectAllListeners() {
  $("button#guardians").click(function(e){
    e.preventDefault();
    var iteration=$(this).data('iteration')||1
    var $guardians = $("input[id^='email_guardian_ids']")
    // Button toggles between case 1 behavior and case 2 behavior on alternate clicks
    switch (iteration) {
      case 1:
        $guardians.prop( "checked", true );
        $(this).text("Deselect All");
        break;    
      case 2:
        $guardians.prop( "checked", false );
        $(this).text("Select All");
        break;
    }
    iteration++;
    if (iteration>2) iteration=1
    $(this).data('iteration',iteration)
  });

  $("button#students").click(function(e){
    e.preventDefault();
    var iteration=$(this).data('iteration')||1
    var $students = $("input[id^='email_student_ids']")
    // Button toggles between case 1 behavior and case 2 behavior on alternate clicks
    switch (iteration) {
      case 1:
        $students.prop( "checked", true );
        $(this).text("Deselect All");
        break;    
      case 2:
        $students.prop( "checked", false );
        $(this).text("Select All");
        break;
    }
    iteration++;
    if (iteration>2) iteration=1
    $(this).data('iteration',iteration)
  });
}