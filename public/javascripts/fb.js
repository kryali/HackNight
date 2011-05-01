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
          console.log(user);
          //If they are already logged in, show dat face!
          $("#fb-profile > img").attr("src","http://graph.facebook.com/" + user.id + "/picture");
        }
      });

    } else {
      //Login failed??
    }
  });
});
