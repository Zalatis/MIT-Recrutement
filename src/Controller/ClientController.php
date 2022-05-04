<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ClientRepository;
use App\Repository\ContactRepository;
use Symfony\Component\Form\FormFactoryInterface;
use Twig\Environment;
use App\Form\AddClientFormType;
use App\Entity\Client;
use App\Entity\Contact;
use Datetime;

class ClientController
{
    /** FormFactoryInterface */
    private $formFactory;

    /** Environment */
    private $twig;

    /** ClientRepository */
    private $clientRepository;

    /** ContactRepository */
    private $contactRepository;

    /** UrlGeneratorInterface */
    private $urlGenerator;

    public function __construct(
        FormFactoryInterface $formFactory, 
        Environment $twig, 
        ClientRepository $clientRepository,
        ContactRepository $contactRepository,
        UrlGeneratorInterface $urlGenerator
    ){
        $this->formFactory = $formFactory;
        $this->twig = $twig;
        $this->clientRepository = $clientRepository;
        $this->contactRepository = $contactRepository;
        $this->urlGenerator = $urlGenerator;
    }

    /**
     * @Route("/", name="homepage")
     */
    public function showAllClientsAction(Request $request): Response
    {
        $form = $this->formFactory
            ->create(AddClientFormType::class)
            ->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            
            $contact = new Contact();
            $contact->setFirstName($form->get('contactFirstName')->getData());
            $contact->setLastName($form->get('contactLastName')->getData());
            $contact->setMail($form->get('contactEmail')->getData());
            $contact->setPhone($form->get('contactPhone')->getData());
            $contact->setCountry($form->get('contactCountry')->getData());
            $contact->setCreationDate(new Datetime());
        
            $this->contactRepository->save($contact);

            $client = new Client();
            $client->setContact($contact);
            $client->setCountry($form->get('contactCountry')->getData());
            $client->setDenomination($form->get('denomination')->getData());
            $client->setCreationDate(new Datetime());

            $this->clientRepository->save($client);

            $request->getSession()->getFlashBag()->add('notice', "Le nouveau client a bien été créé !");
        }
    
        return new Response($this->twig->render('homepage.html.twig', [
            'clients' => $this->clientRepository->findAllClients(),
            'form' => $form->createView()
        ]));
    }
}