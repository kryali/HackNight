if(jQuery){

/*
/*
        var options = {
        target: '#submit-form', //Div tag where content info will be loaded in
        url:'../../imgur', //The php file that handles the file that is uploaded
        beforeSubmit: function() {
            $('#submit-form').html('UPLOADING!!!'); //Including a preloader, it loads into the div tag with id uploader
          },
        success:  function() {
            //Here code can be included that needs to be performed if Ajax request was successful
            $('#submit-form').html('FUCKING DONE UPLOADING');
          }
        };


    $("form").submit(function() {
      if($("input:file").val()==""){
        // This occurs when there is no file in the file upload field
        return true;
      } else {
        $(this).ajaxSubmit(options);
        return false;
        // Do fancy overlay stuff here...
        /*
        $.post('../../imgur', function(data) {
          $("#project_image_url")[0].value = data;
        });
        return false;
      };
    });
  $('form').ajaxForm({
    url: '../../imgur',
    beforeSubmit: function(a,f,o) {
      $('#submit-form').html('Submitting...');
      return true; 
    }, 
    success: function(data) {
      $('#submit-form').html('Got Data: ' + data);
      var $out = $('#uploadOutput');
      $out.html('Form success handler received: <strong>' + typeof data + '</strong>');
      if (typeof data == 'object' && data.nodeType)
      data = elementToString(data.documentElement, true);
      else if (typeof data == 'object')
      data = objToString(data);
      $out.append('<div><pre>'+ data +'</pre></div>');
    }
  });

*/

}
