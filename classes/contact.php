<?php

class Contact extends Model 
{
    public $id_client = null;
    public $id_contact;
    public $id_pays;
    public $fld_nom;
    public $fld_prenom;
    public $fld_mail;
    public $fld_telephone;
    public $fld_dateCreation;


    public function getByID($id_contact)
    {
        $result = $this->mysqli->query('
            SELECT *
            FROM contact
            WHERE id_contact = '.(int)$id_contact.'
        ');

        return $result->fetch_assoc();
    }

    public function add()
    {
        $stmt = $this->mysqli->prepare('
            INSERT INTO contact 
            (`id_client`, `id_pays`, `fld_nom`, `fld_prenom`, `fld_mail`, `fld_telephone`, `fld_dateCreation`) 
            VALUES (1, ?, ?, ?, ?, ?, ?)
        ');

        $stmt->bind_param(
            'isssss', 
            $this->id_pays, 
            $this->fld_nom, 
            $this->fld_prenom, 
            $this->fld_mail,
            $this->fld_telephone,
            $this->fld_dateCreation
        );
        $stmt->execute();

        $this->id_contact = $stmt->insert_id;
    }

    public function update()
    {
        $stmt = $this->mysqli->prepare('
            UPDATE contact 
            SET id_client = ?, id_pays = ?, fld_nom = ?, fld_prenom = ?, fld_mail = ?, fld_telephone = ?, fld_dateCreation = ?
            WHERE id_contact = ?
        ');

        $stmt->bind_param(
            'iisssssi', 
            $this->id_client, 
            $this->id_pays, 
            $this->fld_nom, 
            $this->fld_prenom, 
            $this->fld_mail,
            $this->fld_telephone,
            $this->fld_dateCreation,
            $this->id_contact
        );
        $stmt->execute();
    }
}