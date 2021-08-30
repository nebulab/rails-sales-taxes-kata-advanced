window.onload=function(){
  (function () {
    const catImage = document.getElementById('cat-image')
    fetch('https://api.thecatapi.com/v1/images/search', {
    })
      .then(response => response.json())
      .then(data => {
        catImage.src = data[0].url
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  })();
}
