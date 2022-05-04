<?php

namespace App\Entity;

use App\Entity\Client;
use App\Repository\ContactRepository;
use Doctrine\ORM\Mapping as ORM;
use \Datetime;

/**
 * @ORM\Entity(repositoryClass=ContactRepository::class)
 * @ORM\Table(name="contact")
 */
class Contact
{

    /**
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer", name="id_contact")
     */
    private $id;

    /**
    * @ORM\OneToOne(targetEntity="Client", mappedBy="contact")
    */
    private $client;

    /**
    * @ORM\OneToOne(targetEntity="Country")
    * @ORM\JoinColumn(name="id_pays", referencedColumnName="id_pays", nullable=false)
    */
    private $country;

    /**
     * @ORM\Column(type="string", name="fld_nom", length=255)
     */
    private $firstName;

    /**
     * @ORM\Column(type="string", name="fld_prenom", length=255)
     */
    private $lastName;

    /**
     * @ORM\Column(type="string", name="fld_mail", length=255)
     */
    private $mail;

    /**
     * @ORM\Column(type="string", name="fld_telephone", length=255)
     */
    private $phone;

    /**
     * @ORM\Column(type="datetime", name="fld_dateCreation")
     */
    private $creationDate;

    
    public function getId(): int
    {
        return $this->id;
    }

    public function getClient(): Client
    {
        return $this->client;
    }

    public function setClient(Client $client): void
    {
        $this->client = $client;
    }

    public function getCountry(): Country
    {
        return $this->country;
    }

    public function setCountry(Country $country): void
    {
        $this->country = $country;
    }

    public function getFirstName(): string
    {
        return $this->firstName; 
    }

    public function setFirstName(string $firstName): void
    {
        $this->firstName = $firstName;
    }

    public function getLastName(): string
    {
        return $this->lastName; 
    }

    public function setLastName(string $lastName): void
    {
        $this->lastName = $lastName;
    }

    public function getMail(): ?string
    {
        return $this->mail; 
    }

    public function setMail(string $mail): void
    {
        $this->mail = $mail;
    }

    public function getPhone(): ?string
    {
        return $this->phone; 
    }

    public function setPhone(string $phone): void
    {
        $this->phone = $phone;
    }

    public function getCreationDate(): Datetime
    {
        return $this->creationDate;
    }

    public function setCreationDate(Datetime $creationDate): void
    {
        $this->creationDate = $creationDate;
    }
}