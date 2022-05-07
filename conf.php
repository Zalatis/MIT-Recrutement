<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

define('DBHOST', '127.0.0.1');
define('DBUSER', 'root');
define('DBPASS', 'NeWqWhIKk6RA');
define('DBBASE', 'test');


require_once('classes/model.php');
require_once('classes/client.php');
require_once('classes/commande.php');
require_once('classes/contact.php');
require_once('classes/pays.php');
require_once('controllers/controller.php');
require_once('controllers/indexController.php');