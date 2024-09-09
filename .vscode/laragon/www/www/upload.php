<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $imageTmpPath = $_FILES['image']['tmp_name'];
        $destination = 'uploaded_image.png';

        if (move_uploaded_file($imageTmpPath, $destination)) {
            echo json_encode(['message' => '圖片上傳成功！']);
        } else {
            echo json_encode(['message' => '圖片上傳失敗。']);
        }
    } else {
        echo json_encode(['message' => '未檢測到圖片數據或上傳中有錯誤。']);
    }
} else {
    echo json_encode(['message' => '無效的請求方法。']);
}