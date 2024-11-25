<?php 

include 'function.php';

$result = array("success"=>0,'error'=>0); 
if(isset($_POST['product_name']) && isset($_POST['description']) && isset($_POST['category']) && isset($_POST['barcode']) && isset($_POST['expired_date']) && isset($_POST['qty']) && isset($_POST['unit_pricein']) && isset($_POST['unit_priceout'])){
    $product_name = $_POST['product_name'];
    $description = $_POST['description'];
    $category = $_POST['category'];
    $barcode = $_POST['barcode'];
    $expired_date = $_POST['expired_date'];
    $qty = $_POST['qty'];
    $unit_pricein = $_POST['unit_pricein'];
    $unit_priceout = $_POST['unit_priceout'];

    $fields = array('product_name', 'description', 'category', 'barcode', 'expired_date', 'qty', 'unit_pricein', 'unit_priceout');
    $values = array($product_name, $description, $category, $barcode, $expired_date, $qty, $unit_pricein, $unit_priceout);
    $func = new functions();
    $insert_product = $func->insert_product('newproduct', $fields, $values);
    if($insert_product == true){
        $result['success'] = 1;
        $result['msg_success'] = 'Product created successfully';
            echo json_encode($result);
    } else {
        $result['error'] = 2;
        $result['msg_error'] = "Product not created";
            echo json_encode($result);
    }
} else {
    $result['error'] = 1;
    $result['msg_error'] = "Access denied";
    echo json_encode($result);
}