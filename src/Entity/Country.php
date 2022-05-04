<?php

namespace App\Entity;

use App\Entity\Client;
use App\Repository\CountryRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CountryRepository::class)
 * @ORM\Table(name="pays")
 */
class Country
{

    /**
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer", name="id_pays")
     */
    private $id;

    /**
     * @ORM\Column(type="string", name="fld_isoPays", length=255)
     */
    private $isoCountry;

    /**
     * @ORM\Column(type="string", name="fld_devise", length=255)
     */
    private $currency;


    
    public function getId(): int
    {
        return $this->id;
    }

    public function getIsoCountry(): string
    {
        return $this->isoCountry; 
    }

    public function setIsoCountry(string $isoCountry): void
    {
        $this->isoCountry = $isoCountry;
    }

    public function getCurrency(): string
    {
        return $this->currency; 
    }

    public function setCurrency(string $currency): void
    {
        $this->currency = $currency;
    }
}