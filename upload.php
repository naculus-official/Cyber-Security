<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $image_data = $data['image'];

    // 去掉 'data:image/png;base64,' 前綴
    $image_data = str_replace('data:image/png;base64,', '', $image_data);
    $image_data = str_replace(' ', '+', $image_data);
    $image_data = base64_decode($image_data);

    // 保存圖片
    $file_path = 'uploaded_image.png';
    if (file_put_contents($file_path, $image_data)) {
        echo json_encode(['message' => '圖片上傳成功！']);
    } else {
        echo json_encode(['message' => '圖片上傳失敗。']);
    }
} else {
    echo json_encode(['message' => '無效的請求方法。']);
}
