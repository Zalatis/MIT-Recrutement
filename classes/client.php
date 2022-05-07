<?php

class Client extends Model 
{
    public $id_client;
    public $id_contact;
    public $id_pays;
    public $fld_raisonSociale;
    public $fld_dateCreation;

    public function __construct()
    {
        parent::__construct();
    }

    public function getAllResume($sort = [])
    {
        // Order BY
        $orderby = [];
        if (count($sort) > 0) {
            foreach ($sort as $key => $type) {
                $orderby[] = $key.' '.$type;
            }
        }

        $result = $this->mysqli->query('
            SELECT c.id_client, c.id_contact, c.id_pays, c.fld_raisonSociale, 
                c2.fld_nom, c2.fld_prenom, c2.fld_mail, c2.fld_telephone, 
                COUNT(c3.id_commande) as nb_commandes
            FROM client c 
            LEFT JOIN contact c2 ON c2.id_contact = c.id_contact
            LEFT JOIN commande c3 ON c3.id_client = c.id_client
            '.(count($orderby) > 0 ? 'ORDER BY '.implode(',', $orderby) : '').'
            GROUP BY c.id_client
        ');

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function add()
    {
        $stmt = $this->mysqli->prepare('
            INSERT INTO client 
            (`id_contact`, `id_pays`, `fld_raisonSociale`, `fld_dateCreation`) 
            VALUES (?, ?, ?, ?)
        ');

        $stmt->bind_param(
            'iiss', 
            $this->id_contact, 
            $this->id_pays, 
            $this->fld_raisonSociale, 
            $this->fld_dateCreation
        );
        $stmt->execute();

        $this->id_client = $stmt->insert_id;
    }
}