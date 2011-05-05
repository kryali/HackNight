$(function(){
  FB.init({
    appId:'105681736187371', cookie:true, 
    status:true, xfbml:true 
  });

  //Actions to take upon user entering the site
  FB.getLoginStatus(function(response) {
    if(response.session) {
//      console.log(response);
      FB.api('/me', function(user) {
        if(user != null) {
          //window.token = response.session.access_token;
          //If they are already logged in, show dat face!
          $("#fb-profile > h2").append(user.name);
          $("#fb-profile > img").attr("src","http://graph.facebook.com/" + user.id + "/picture");
          var hacker = {
            name: user.name,
            email: user.email,
            access_token: response.session.access_token,
            image_url: "http://graph.facebook.com/" + user.id + "/picture",
            fb_id: user.id
          };
          $.post("/fb_add_hacker", hacker, function(data){
            //alert("Sent the add request bro, STATUS: " + data);
          });
        } else {
          //alert("something went wrong :(");
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
      //Hide dat button!
      $("#fb-login").css("display","none");

      FB.api('/me', function(user) {
       if(user != null) {
          //If they are already logged in, show dat face!
          console.log(user);
          $("#fb-profile > img").attr("src","http://graph.facebook.com/" + user.id + "/picture");
//          post_to_url('/text',{'name': user.name, 'image_url': "http://graph.facebook.com/" + user.id + "/picture"},"post")
        }
      });

    } else {
      //Login failed??
    }
  });
});
