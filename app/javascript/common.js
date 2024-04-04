document.addEventListener("turbo:load", function() {
  const form = document.getElementById('user-form'); // 追加したフォームのIDを指定する

  if (form) { // フォームが存在するかチェック
    const avatarInput = form.querySelector('#avatar-input');
    const preview = form.querySelector('#preview');

    avatarInput.addEventListener('change', function(event) {
      const file = event.target.files[0];
      const reader = new FileReader();
      
      reader.onload = function() {
        preview.src = reader.result;
      }

      if (file) {
        reader.readAsDataURL(file);
      }
      console.log('変更')
    });
  }
});
