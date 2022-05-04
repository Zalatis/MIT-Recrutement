<?php

namespace App\Entity;

use App\Entity\Contact;
use App\Entity\Country;
use App\Repository\ClientRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\PersistentCollection;
use Doctrine\Common\Collections\ArrayCollection;
use \Datetime;

/**
 * @ORM\Entity(repositoryClass=ClientRepository::class)
 * @ORM\Table(name="client")
 */
class Client
{

    /**
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer", name="id_client")
     */
    private $id;

    /**
    * @ORM\OneToOne(targetEntity="Contact", inversedBy="client")
    * @ORM\JoinColumn(name="id_contact", referencedColumnName="id_contact", nullable=false)
    */
    private $contact;

    /**
    * @ORM\OneToOne(targetEntity="Country")
    * @ORM\JoinColumn(name="id_pays", referencedColumnName="id_pays", nullable=false)
    */
    private $country;

    /**
     * @ORM\Column(name="fld_raisonSociale", type="string", length=255, nullable=true)
     */
    private $denomination;

    /**
     * @ORM\Column(type="datetime", name="fld_dateCreation")
     */
    private $creationDate;

    /**
     * 
     * @ORM\OneToMany(targetEntity="App\Entity\Order", mappedBy="client")
     */
    private $orders;

    public function __construct()
    {
        $this->orders = new ArrayCollection();
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getContact(): Contact
    {
        return $this->contact;
    }

    public function setContact(Contact $contact): void
    {
        $this->contact = $contact;
    }

    public function getCountry(): Country
    {
        return $this->country;
    }

    public function setCountry(Country $country): void
    {
        $this->country = $country;
    }

    public function getDenomination(): ?string
    {
        return $this->denomination; 
    }

    public function setDenomination(string $denomination): void
    {
        $this->denomination = $denomination;
    }

    public function getCreationDate(): Datetime
    {
        return $this->creationDate;
    }

    public function setCreationDate(Datetime $creationDate): void
    {
        $this->creationDate = $creationDate;
    }

    public function getOrders(): PersistentCollection
    {
        return $this->orders;
    }

    public function addOrder(Order $order): void
    {
        if(!in_array($order, $this->orders))
            $this->order->add($order);

    }

    public function removeOrder(Order $order): void 
    {
        if(in_array($order, $this->orders))
            $this->order->removeElement($order);
    }
}