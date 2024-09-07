<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>圖片上傳與浮水印</title>
    <style>
        #preview {
            margin-top: 20px;
            max-width: 100%;
            max-height: 300px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="imageForm">
        <input type="file" id="imageInput" accept="image/*"><br><br>
        <button type="button" id="uploadButton">上傳圖片</button>
    </form>

    <canvas id="canvas" style="display:none;"></canvas>
    <img id="preview" alt="圖片預覽">

    <script>
        document.getElementById('imageInput').addEventListener('change', handleImage);
        document.getElementById('uploadButton').addEventListener('click', uploadImage);

        function handleImage(e) {
            const reader = new FileReader();

            reader.onload = function(event) {
                const img = new Image();
                img.onload = function() {
                    const canvas = document.getElementById('canvas');
                    const context = canvas.getContext('2d');

                    canvas.width = img.width;
                    canvas.height = img.height;
                    context.drawImage(img, 0, 0);

                    // 添加重複浮水印
                    const text = '浮水印';
                    const fontSize = 48;
                    context.font = `${fontSize}px serif`;
                    context.fillStyle = 'rgba(255, 255, 255, 0.5)';
                    context.textAlign = 'center';
                    context.textBaseline = 'middle';
                    
                    const textWidth = context.measureText(text).width;
                    const xIncrement = textWidth + 30; 
                    const yIncrement = fontSize + 30;

                    for (let y = 0; y < canvas.height; y += yIncrement) {
                        for (let x = 0; x < canvas.width; x += xIncrement) {
                            context.save();
                            context.translate(x + textWidth / 2, y + fontSize / 2);
                            context.rotate(-Math.PI / 4);
                            context.fillText(text, 0, 0);
                            context.restore();
                        }
                    }

                    // 顯示預覽
                    const previewImage = document.getElementById('preview');
                    previewImage.src = canvas.toDataURL('image/png');
                };
                img.src = event.target.result;
            };

            reader.readAsDataURL(e.target.files[0]);
        }

        function uploadImage() {
            const canvas = document.getElementById('canvas');
            const imageData = canvas.toDataURL('image/png');

            const xhr = new XMLHttpRequest();
            xhr.open('POST', './upload.php', true);
            xhr.setRequestHeader('Content-Type', 'application/json');

            xhr.onreadystatechange = function() {
                if(xhr.readyState === 4 && xhr.status === 200) {
                    alert('圖片上傳成功！');
                }
            };

            const data = JSON.stringify({ image: imageData });
            xhr.send(data);
        }
    </script>
</body>
</html>