
window.addEventListener('load', () => {
  if (document.getElementById('new-user-icon-upload')) {
    const ImageList = document.getElementById('image-preview');

    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'sign-up-icon')

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('new-user-icon-select').addEventListener('change', function (e) {
      const imageContent = document.querySelector('.sign-up-icon'); // もとの画像の要素を取得
      const file = e.target.files[0];
      if (file) { // 画像が選択されていれば
        imageContent.remove(); // もとの画像を削除する
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      }
    });
  };
});