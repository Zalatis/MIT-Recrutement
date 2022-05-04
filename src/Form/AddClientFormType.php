<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use App\Entity\Country;


class AddClientFormType extends AbstractType
{
    
    public function buildForm(FormBuilderInterface $builder,array $options) : void 
    {
        $builder
            ->add('denomination', TextType::class, ['label' => 'Raison sociale'])
            ->add('contactFirstName', TextType::class, ['label' => 'Nom du contact'])
            ->add('contactLastName', TextType::class, ['label' => 'Prénom du contact'])
            ->add('contactEmail', TextType::class, ['label' => 'Email'])
            ->add('contactPhone', TextType::class, ['label' => 'Téléphone'])
            ->add('contactCountry', EntityType::class, [
                'class' => Country::class,
                'choice_label' => 'isoCountry',
                'expanded' => false,
                'multiple' => false
            ]);
    }
}