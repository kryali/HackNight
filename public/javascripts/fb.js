function post_to_url(path, params, method) {
    method = method || "post"; // Set method to post by default, if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    form.setAttribute("authenticity_token", AUTH_TOKEN);

    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        hiddenField.setAttribute("authenticity_token", AUTH_TOKEN);

        form.appendChild(hiddenField);
    }

    document.body.appendChild(form);    // Not entirely sure if this is necessary
    form.submit();
}

function fb_login(){ 
  //Actions to take upon user entering the site
  FB.getLoginStatus(function(response) {
    if(response.session) {
//      console.log(response);
      FB.api('/me', function(user) {
        if(user != null) {
          //window.token = response.session.access_token;
          //If they are already logged in, show dat face!
          //$("#fb-profile > h2").append(user.name);
          //$("#fb-profile > img").attr("src","http://graph.facebook.com/" + user.id + "/picture");
          /*
          $.post("/fb_add_hacker", hacker, function(data){
            //alert("Sent the add request bro, STATUS: " + data);
          });
          */
          var hacker = {
            name: user.name,
            email: user.email,
            access_token: response.session.access_token,
            image_url: "http://graph.facebook.com/" + user.id + "/picture",
            fb_id: user.id,
            authenticity_token: AUTH_TOKEN
          };
          post_to_url("/fb_add_hacker", hacker, "post");
        } else {
          //alert("something went wrong :(");
        }
      });
    } else {
      //Show the login button
//   $("#fb-login").css("display","block")
    }
  });

  //Actions to take upon the user logging in
  FB.Event.subscribe('auth.login', function(response) {
    if(response.session) {
      //Hide dat button!
      $("#fb-login").css("display","none");

      FB.api('/me', function(user) {
       if(user != null) {
          //If they are already logged in, show dat face!
          console.log(user);
          $("#fb-profile > img").attr("src","http://graph.facebook.com/" + user.id + "/picture");
//          post_to_url('/text',{'name': user.name, 'image_url': "http://graph.facebook.com/" + user.id + "/picture"},"post")
          var hacker = {
            name: user.name,
            email: user.email,
            access_token: response.session.access_token,
            image_url: "http://graph.facebook.com/" + user.id + "/picture",
            fb_id: user.id,
            authenticity_token: AUTH_TOKEN
          };
          post_to_url("/fb_add_hacker", hacker, "post");
          // alert("Logged in!");
        }
      });
    } else {
      //Login failed??
    }
  });
};
 $(document).ready(function() {
  $("#fb-login").click( function(){
    fb_login();
  });

  FB.init({
    appId:'105681736187371', cookie:true, 
    status:true, xfbml:true 
  });
});
