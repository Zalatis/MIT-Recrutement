<?php

class IndexController extends Controller
{
    public function init()
    {
        $aResults = [];

        // New client ?
        if (isset($_POST['new_client']) && $_POST['new_client'] == 1) {
            $this->addClient();
        }

        // Objects 
        $oContact = new Contact();
        $oClient = new Client();
        $oCommande = new Commande();
        $oPays = new Pays();

        // Get all clients
        $aClients = $oClient->getAllResume();

        return [
            'clients' => $aClients,
            'pays' => $oPays->getAll()
        ];
    }

    public function addClient()
    {
        $oPays = new Pays();

        $id_pays = $_POST['id_pays'];
        $fld_raisonSociale = $_POST['fld_raisonSociale'];
        $fld_nom = $_POST['fld_nom'];
        $fld_prenom = $_POST['fld_prenom'];
        $fld_mail = $_POST['fld_mail'];
        $fld_telephone = $_POST['fld_telephone'];
        $dateCreation = date('Y-m-d H:i:s');

        // Check id_pays ?
        if (!$oPays->existsID($id_pays)) {
            die('Le pays n\'existe pas, merci de contacter le webmaster.');
        }

        // Add contact
        $oContact = new Contact();
        $oContact->id_pays = $id_pays;
        $oContact->fld_nom = $fld_nom;
        $oContact->fld_prenom = $fld_prenom;
        $oContact->fld_mail = $fld_mail;
        $oContact->fld_telephone = $fld_telephone;
        $oContact->fld_dateCreation = $dateCreation;
        $oContact->add();

        // Add client model
        $oClient = new Client();
        $oClient->id_contact = $oContact->id_contact;
        $oClient->id_pays = $id_pays;
        $oClient->fld_raisonSociale = $fld_raisonSociale;
        $oClient->fld_dateCreation = $dateCreation;
        $oClient->add();

        $oContact->id_client = $oClient->id_client;
        $oContact->update();

        header('Location: '.$_SERVER['PHP_SELF']);
    }
}