var password_field = document.getElementById('password');
    var password_visual = document.getElementById('password_visual');
    var password_eye = document.getElementById('password_eye');

  $(document).on('click', 'password_visual', function(){
    console.log("turbolinks loaded");
    if(password_eye.classList.contains("glyphicon-eye-open"))
      {
        password_eye.classList.remove("glyphicon-eye-open");
        password_eye.classList.add("glyphicon-eye-close");
        password_field.type = "text";
      }

      else
      {
        password_eye.classList.add("glyphicon-eye-open");
        password_eye.classList.remove("glyphicon-eye-close");
        password_field.type = "password";
      }
}); 
  