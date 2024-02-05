document.addEventListener('DOMContentLoaded', function() {
  const avatarInput = document.getElementById('avatar-input');
  const preview = document.getElementById('preview');

  avatarInput.addEventListener('change', function(event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    
    reader.onload = function() {
      preview.src = reader.result;
    }

    if (file) {
      reader.readAsDataURL(file);
    }
  });
});
