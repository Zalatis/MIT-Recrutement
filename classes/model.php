<?php

class Model 
{
    public $mysqli = null;

    public function __construct()
    {
        $this->mysqli = new mysqli(DBHOST, DBUSER, DBPASS, DBBASE);

        if (mysqli_connect_errno()) {
            die('Unable to connect to mariaBD, please contact the webmaster.');
        }
    }
}