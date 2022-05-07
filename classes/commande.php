<?php

class Commande extends Model 
{
    public function getCountByIDContact($id_contact)
    {
        $result = $this->mysqli->query('
            SELECT COUNT(*) as nb_commande
            FROM commande
            WHERE id_contact = '.(int)$id_contact.'
        ');

        return $result->fetch_row()[0];
    }
}