<?php
include 'config.php';
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(-1);

// Connect to db
try {
    $conn = new PDO("mysql:host=" . DBHOST . ";port=" . DBPORT . ";dbname=" .DBBASE, DBUSER, DBPASS);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->exec("SET NAMES utf8");
}
catch(PDOException $e) {
    die("La connexion à la DB à échoué: " . $e-getMessage());
}
?>

<head>
    <title>Clients</title>
    <link rel="stylesheet" href="./assets/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="./assets/css/responsive.dataTables.min.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    
    <script src="./assets/js/jquery-3.6.0.slim.min.js"></script>
    <script src="./assets/js/jquery.dataTables.min.js"></script>
    <script src="./assets/js/dataTables.responsive.min.js"></script>
    <script src="./assets/js/styles_values.js"></script>
</head>

<body>

<?php
// Get data from db
$sql = "SELECT fld_raisonSociale, fld_nom, fld_prenom, fld_mail, fld_telephone, coalesce(COUNT(fld_datePaiement), 0) as nb_payees
FROM client
LEFT OUTER JOIN contact ON client.id_contact = contact.id_contact
LEFT OUTER JOIN commande ON client.id_client = commande.id_client
GROUP BY client.id_client";
$result = $conn->prepare($sql);
$result->execute();
?>

<!-- Section table -->
<section class="all_users"><table id="MyTable" class="display nowrap" width="100%"><thead><tr><th>Raison sociale</th><th>Nom du contact</th><th>Prénom du contact</th><th>Mail du contact</th><th>Téléphone du contact</th><th>Nombre de commandes payées</th></tr></thead><tbody>
<?php
    if ($result) {
        $rows = $result->fetchAll();
            foreach($rows as $row) {
                echo "<tr><td>" . $row["fld_raisonSociale"]. "</td><td>" . $row["fld_nom"]. "</td><td>" . $row["fld_prenom"]. "</td><td>" . $row["fld_mail"]. "</td><td>" . $row["fld_telephone"]. "</td><td>" . $row["nb_payees"]. "</td></tr>";
            }
    }
?>
</tbody></table></section>

<?php
$sql = "SELECT id_pays,
        CONCAT(fld_isoPays, ' (' , fld_devise, ')') AS countries FROM pays";
$pays = $conn->prepare($sql);
$pays->execute();
?>

<section class="add_client">
    <form action="add_client.php" method="post">
        <input type="hidden" name="add_client" value="1">
        <label for="social_reason">Raison Sociale</label><input type="text" class="form-control" name="social_reason" id="social_reason" value="">
        <label for="name">Nom</label><input type="text" class="form-control " name="name" id="name" value="" required>
        <label for="surname">Prénom</label><input type="text" class="form-control " name="surname" id="surname" value="" required>
        <label for="mail">Mail</label><input type="email" class="form-control " name="mail" id="mail" value="" required>
        <label for="phone">Numéro de téléphone</label><input type="tel" class="form-control " name="phone" id="phone" pattern="^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$" value="" required>
        <label for="country">Pays</label><select class="form-control " name="country" id="country" value="" required>
        <option value="" disabled selected>-- Sélectionnez le code Pays --</option>
        <?php 
        foreach($pays as $item) { 
            echo "<option value =$item[id_pays]>$item[countries]</option>";
        }
        ?>
        <input type="submit" value="Enregistrer">
    </form>
</section>
</body>