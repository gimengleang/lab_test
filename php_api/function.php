<?php 

    class functions{
        private $db;
        private $sql;
        private $result;
        
        function __construct(){
            require_once('labTest.php');

            $this->db = new dbConn();

            $this->db->connect();
        }

        function __destruct(){
            $this->db->connect()->close();
        }

       public function insert_product($table, $field, $value) {
    $count = count($field);

    $this->sql = "INSERT INTO " . $table. "("; // Added space after 'INSERT INTO'
    for ($i = 0; $i < $count; $i++) {
        $this->sql .= $field[$i];
        if ($i < $count - 1) {
            $this->sql .= ",";
        } else {
            $this->sql .= ") VALUES (";
        }
    }
    for ($i = 0; $i < $count; $i++) {
        $this->sql .= "'" . $value[$i] . "'";
        if ($i < $count - 1) {
            $this->sql .= ",";
        } else {
            $this->sql .= ")";
        }
    }

    $this->result = $this->db->connect()->query($this->sql);
    if ($this->result) {
        return "Product Inserted Successfully";
    } else {
        return "Error: " . $this->db->connect()->error; // Enhanced error handling
    }
}

    }