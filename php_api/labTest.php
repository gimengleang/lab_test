<?php 
    class dbConn{
        private $servername = 'localhost';
        private $username = 'root';
        private $password = '';
        private $dbname = 'choumengleang';

        public function connect(){
            try{
                $conn = new mysqli(
                    $this->servername,
                    $this->username,
                    $this->password,
                    $this->dbname,
                );
                return $conn;
            }catch (Exception $e){
                echo "Error: " . $e->getMessage();
            }
        }
    }