if (document.URL.match( /rooms/ )) {
document.addEventListener('DOMContentLoaded', function(){
  const ImageList1 = document.getElementById('preview-list_1');
  const ImageList2 = document.getElementById('preview-list_2');
  document.getElementById('post_image_1').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const imageElement = document.createElement('div');
    imageElement.className = 'image_preview';
    const blobImage = document.createElement('img');
    blobImage.className = 'blob_image';
    blobImage.setAttribute('src', blob);

    imageElement.appendChild(blobImage);
    ImageList1.appendChild(imageElement);
  });
  document.getElementById('post_image_2').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const imageElement = document.createElement('div');
    imageElement.className = 'image_preview';
    const blobImage = document.createElement('img');
    blobImage.className = 'blob_image';
    blobImage.setAttribute('src', blob);

    imageElement.appendChild(blobImage);
    ImageList2.appendChild(imageElement);
  });
});
}