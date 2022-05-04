<?php

namespace App\Entity;

use App\Entity\Contact;
use App\Entity\Client;
use App\Repository\OrderRepository;
use Doctrine\ORM\Mapping as ORM;
use \Datetime;

/**
 * @ORM\Entity(repositoryClass=OrderRepository::class)
 * @ORM\Table(name="commande")
 */
class Order
{

    /**
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer", name="id_commande")
     */
    private $id;

    /**
    * @ORM\OneToOne(targetEntity="Contact")
    * @ORM\JoinColumn(name="id_contact", referencedColumnName="id_contact", nullable=false)
    */
    private $contact;

    /**
    * @ORM\ManyToOne(targetEntity="Client", inversedBy="orders")
    * @ORM\JoinColumn(name="id_client", referencedColumnName="id_client", nullable=false)
    */
    private $client;

    /**
     * @ORM\Column(type="float", name="fld_montant")
     */
    private $amount;

    /**
     * @ORM\Column(type="float", name="fld_montantFraisdePort")
     */
    private $shippingAmount;

    /**
     * @ORM\Column(type="integer", name="fld_preparee")
     */
    private $prepared;

    /**
     * @ORM\Column(type="integer", name="fld_expediee")
     */
    private $expedied;

    /**
     * @ORM\Column(type="integer", name="fld_payee")
     */
    private $paid;

    /**
     * @ORM\Column(type="datetime", name="fld_dateCreation")
     */
    private $creationDate;

    /**
     * @ORM\Column(type="datetime", name="fld_datePreparation")
     */
    private $preparationDate;

    /**
     * @ORM\Column(type="datetime", name="fld_datePaiement")
     */
    private $paymentDate;

    /**
     * @ORM\Column(type="datetime", name="fld_dateExpedition")
     */
    private $expeditionDate;

    
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


    public function getAmount(): string
    {
        return $this->amount; 
    }

    public function setAmount(float $amount): void
    {
        $this->amount = $amount;
    }

    public function getShippingAmount(): string
    {
        return $this->shippingAmount; 
    }

    public function setShippingAmount(float $shippingAmount): void
    {
        $this->shippingAmount = $shippingAmount;
    }

    public function isPrepared(): bool
    {
        return $this->prepared === 0 ? false : true;
    }

    public function setPrepared(int $prepared): void
    {
        $this->prepared = $prepared;
    }

    public function isExpedied(): bool
    {
        return $this->expedied === 0 ? false : true;
    }

    public function setExpedied(int $expedied): void
    {
        $this->expedied = $expedied;
    }

    public function isPaid(): bool
    {
        return $this->paid === 0 ? false : true;
    }

    public function setPaid(int $paid): void
    {
        $this->paid = $paid;
    }

    public function getCreationDate(): Datetime
    {
        return $this->creationDate;
    }

    public function setCreationDate(Datetime $creationDate): void
    {
        $this->creationDate = $creationDate;
    }

    public function getPreparationDate(): ?Datetime
    {
        return $this->preparationDate;
    }

    public function setPreparationDate(Datetime $preparationDate): void
    {
        $this->preparationDate = $preparationDate;
    }

    public function getPaymentDate(): ?Datetime
    {
        return $this->paymentDate;
    }

    public function setPaymentDate(Datetime $paymentDate): void
    {
        $this->paymentDate = $paymentDate;
    }

    public function getExpeditionDate(): ?Datetime
    {
        return $this->expeditionDate;
    }

    public function setExpeditionDate(Datetime $expeditionDate): void
    {
        $this->expeditionDate = $expeditionDate;
    }
}