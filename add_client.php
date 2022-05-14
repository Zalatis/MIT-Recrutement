<?php
include 'config.php';

// Create connection using pdo and values in config.php
try {
    $conn = new PDO("mysql:host=" . DBHOST . ";port=" . DBPORT . ";dbname=" . DBBASE, DBUSER, DBPASS);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->exec("SET NAMES utf8");
}
catch(PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}



if (isset($_POST['add_client']) && $_POST['add_client'] == 1) {
    $id_pays = $_POST['country'];
    $fld_raisonSociale = $_POST['social_reason'];
    $fld_nom = $_POST['name'];
    $fld_prenom = $_POST['surname'];
    $fld_mail = $_POST['mail'];
    $fld_telephone = $_POST['phone'];
    $fld_dateCreation = date('Y-m-d H:i:s');
    // check if all fields are filled except for fld_raisonSociale
    if(!empty($fld_nom) && !empty($fld_prenom) && filter_var($fld_mail, FILTER_VALIDATE_EMAIL) && preg_match("/^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$/", $fld_telephone)){
    // Check if id_pays is in db
    $sql = "SELECT id_pays FROM pays WHERE id_pays = ?";
    $result = $conn->prepare($sql);
    $result->execute(array($id_pays));
    $rows = $result->fetchAll();
    if (count($rows) == 0) {
        die("Le pays choisi n'existe pas");
    }
    else {
    // Add contact
    $stmt = $conn->prepare("INSERT INTO contact 
    (`id_client`, `id_pays`, `fld_nom`, `fld_prenom`, `fld_mail`, `fld_telephone`, `fld_dateCreation`) 
    VALUES (1, :id_pays, :fld_nom, :fld_prenom, :fld_mail, :fld_telephone, :fld_dateCreation)");
    $stmt->bindParam(':id_pays', $id_pays);
    $stmt->bindParam(':fld_nom', $fld_nom);
    $stmt->bindParam(':fld_prenom', $fld_prenom);
    $stmt->bindParam(':fld_mail', $fld_mail);
    $stmt->bindParam(':fld_telephone', $fld_telephone);
    $stmt->bindParam(':fld_dateCreation', $fld_dateCreation);
    $stmt->execute();
    $id_contact = $conn->lastInsertId();
    echo $id_contact;

    // Add client
    $stmt = $conn->prepare("INSERT INTO client 
    (`id_contact`, `id_pays`, `fld_raisonSociale`, `fld_dateCreation`) 
    VALUES (:id_contact, :id_pays, :fld_raisonSociale, :fld_dateCreation)");
    $stmt->bindParam(':id_contact', $id_contact);
    $stmt->bindParam(':id_pays', $id_pays);
    $stmt->bindParam(':fld_raisonSociale', $fld_raisonSociale);
    $stmt->bindParam(':fld_dateCreation', $fld_dateCreation);
    $stmt->execute();
    $id_client = $conn->lastInsertId();
    // echo space
    echo " / ";
    echo $id_client;
    
    // Update contact
    $stmt = $conn->prepare("UPDATE contact
    SET `id_client` = :id_client, `id_pays` = :id_pays, `fld_nom` = :fld_nom, `fld_prenom` = :fld_prenom, `fld_mail` = :fld_mail, `fld_telephone` = :fld_telephone, `fld_dateCreation` = :fld_dateCreation
    WHERE `id_contact` = :id_contact");
    $stmt->bindParam('id_client', $id_client);
    $stmt->bindParam('id_pays', $id_pays);
    $stmt->bindParam('fld_nom', $fld_nom);
    $stmt->bindParam('fld_prenom', $fld_prenom);
    $stmt->bindParam('fld_mail', $fld_mail);
    $stmt->bindParam('fld_telephone', $fld_telephone);
    $stmt->bindParam('fld_dateCreation', $fld_dateCreation);
    $stmt->bindParam('id_contact', $id_contact);
    $stmt->execute();
    header('Location: index.php');
    }
    } elseif (empty($fld_nom) || empty($fld_prenom) || empty($fld_mail) || empty($fld_telephone) || preg_match("/^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$/", $fld_telephone) || !filter_var($fld_mail, FILTER_VALIDATE_EMAIL)){
        $response = array(
            "status" => "alert-danger",
            "message" => "Tous les champs sont obligatoires à l'exception de Raison Sociale."
        );
    }


}
