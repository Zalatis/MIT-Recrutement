<?php

class Pays extends Model 
{
    public $id_pays;
    public $fld_isoPays;
    public $fld_devise;

    public function getAll()
    {
        $result = $this->mysqli->query('
            SELECT *
            FROM pays
        ');

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function existsID($id_pays)
    {
        $result = $this->mysqli->query('
            SELECT 1
            FROM pays
            WHERE id_pays = '.(int)$id_pays.'
        ');

        return $result->fetch_row()[0];
    }
}