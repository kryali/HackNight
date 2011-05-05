$(function(){
  FB.init({ 
    appId:'105681736187371', cookie:true, 
    status:true, xfbml:true 
  });

  //Actions to take upon user entering the site
  FB.getLoginStatus(function(response) {
    if(response.session) {
      window.token = response.session.access_token;
      console.log(response);
      FB.api('/me', function(user) {

        if(user != null) {
          console.log(user);
          //If they are already logged in, show dat face!
          $("#fb-profile > h2").append(user.name);
          $("#fb-profile > img").attr("src","http://graph.facebook.com/" + user.id + "/picture");
        }
      });
    } else {
      //Show the login button
      $("#fb-login").css("display","block")
    }
  });

  //Actions to take upon the user logging in
  FB.Event.subscribe('auth.login', function(response) {
    if(response.session) {
      console.log(response);
      //Hide dat button!
      $("#fb-login").css("display","none");

      FB.api('/me', function(user) {
        if(user != null) {
//          console.log(user);
          //If they are already logged in, show dat face!
          $("#fb-profile > img").attr("src","http://graph.facebook.com/" + user.id + "/picture");
//          post_to_url('/text',{'name': user.name, 'image_url': "http://graph.facebook.com/" + user.id + "/picture"},"post")
        }
      });

    } else {
      //Login failed??
    }
  });
  function post_to_url(path, params, method) {
      method = method || "post"; // Set method to post by default, if not specified.

      // The rest of this code assumes you are not using a library.
      // It can be made less wordy if you use one.
      var form = document.createElement("form");
      form.setAttribute("method", method);
      form.setAttribute("action", path);

      for(var key in params) {
          var hiddenField = document.createElement("input");
          hiddenField.setAttribute("type", "hidden");
          hiddenField.setAttribute("name", key);
          hiddenField.setAttribute("value", params[key]);

          form.appendChild(hiddenField);
      }

      document.body.appendChild(form);    // Not entirely sure if this is necessary
      form.submit();
  }
  
});
