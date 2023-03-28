<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jQuery UI Dialog - Modal form</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
</head>
<body>

<!-- Modal Dialog -->
<div id="dialog-form" title="회사소개를 작성해주세요" style="">
  <form>
    <fieldset>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all">
      <label for="email">Email</label>
      <input type="text" name="email" id="email" class="text ui-widget-content ui-corner-all">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" class="text ui-widget-content ui-corner-all">
    </fieldset>
  </form>
</div>

<!-- Button to Open Modal Dialog -->
<button id="create-user">Create User</button>

<script>
  $(function() {
    // Initialize Modal Dialog
    $("#dialog-form").dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Create User": function() {
          // TODO: Handle Form Submit
        },
        Cancel: function() {
          $(this).dialog("close");
        }
      },
      close: function() {
        // TODO: Reset Form
      }
    });
    
    // Open Modal Dialog Button Click Handler
    $("#create-user").on("click", function() {
      $("#dialog-form").dialog("open");
    });
  });
</script>

</body>
</html>



</body>
</html>