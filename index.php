<?php

require_once('conf.php');

$controller = new IndexController();
$vars = $controller->init();
$clients = $vars['clients'];
$pays = $vars['pays'];

?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Clients</title>
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="stylesheet" href="assets/css/sortable.css" />
    <script src="assets/js/sortable.js"></script>
  </head>
  <body>
    <main>
      <h1>Gestion des clients</h1>
      <section class="show_clients">
        <h2>Liste des clients</h2>
        <table class="sortable-theme-bootstrap" data-sortable>
          <thead>
            <tr>
                <th>Raison social</th>
                <th>Nom du contact</th>
                <th>Prénom du contact</th>
                <th>Mail du contact</th>
                <th>Téléphone du contact</th>
                <th>Nombre de commande</th>
            </tr>
          </thead>
          <tbody>
          <?php foreach ($clients as $client) { ?>
            <tr>
                <td><?php echo $client['fld_raisonSociale']; ?></td>
                <td><?php echo $client['fld_nom']; ?></td>
                <td><?php echo $client['fld_prenom']; ?></td>
                <td><?php echo $client['fld_mail']; ?></td>
                <td><?php echo $client['fld_telephone']; ?></td>
                <td><?php echo $client['nb_commandes']; ?></td>
            </tr>
          <?php } ?>
          </tbody>
        </table>
      </section>
      <section class="add_client">
        <h2>Ajouter un nouveau client</h2>
        <form action="" method="post">
          <input type="hidden" name="new_client" value="1">
        <ul>
          <li><label for="fld_raisonSociale">Raison Sociale</label><input type="text" name="fld_raisonSociale" placeholder="Raison Sociale"></li>
          <li><label for="fld_nom">Nom du contact</label><input type="text" name="fld_nom" placeholder="Nom du contact"></li>
          <li><label for="fld_prenom">Prénom du contact</label><input type="text" name="fld_prenom" placeholder="Prénom du contact"></li>
          <li><label for="fld_mail">Mail du contact</label><input type="text" name="fld_mail" placeholder="Mail du contact"></li>
          <li><label for="fld_telephone">Téléphone du contact</label><input type="text" name="fld_telephone" placeholder="Téléphone du contact"></li>
          <li>
            <label for="id_pays">Pays du contact</label>
            <select name="id_pays">
              <?php foreach ($pays as $item) { ?>
              <option value="<?php echo $item['id_pays']; ?>"><?php echo $item['fld_isoPays'].' ('.$item['fld_devise'].')'; ?></option>
              <?php } ?>
            </select>
          </li>
        </ul>
        <div>
          <button type="submit">Enregistrer le nouveau client</button>
        </div>
        </form>
      </section>
    </main>
  </body>
</html>
