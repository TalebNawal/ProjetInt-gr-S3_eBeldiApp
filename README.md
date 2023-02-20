# eBeldi App

eBeldi est une application fullstack de E-commerce qui a pour valeur ajoutée de s’assurer que les petits commerçants marocains des produits alimentaires Beldi pourront persister à vendre leurs produits. De surplus, ils pourront le faire dans un cycle plus élargi sur le plan national.

<p >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/splach.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/Accueil.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/Sign in.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/Sign up.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/Home.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/huile.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/Detail.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/panier.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/Adresse.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/pay.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/DetailOrder.jpeg" >
  <img width="200" src="https://github.com/TalebNawal/eBeldiApp/blob/main/Serch.jpeg" >
</p>

## Fonctionnalités

- Email & Password Authentification
- État d'authentification persistant
- Rechercher des produits
- Filtrage des produits (basé sur la catégorie)
- détails du produit
- Noter un produit
- Obtenir l'offre du jour
- Panier
- Payer avec la carte bancaire ou bien à la livraison
- Affichage de mes commandes
- Affichage des détails et de l'état de la commande
- Se déconnecter
- panneau de vendeur
    - Affichage de tous les produits
    - Ajout de produits
    - Suppression de produits
    - Affichage des commandes
    - Modification du statut de la commande
    - Affichage des gains totaux
    - Affichage des revenus basés sur la catégorie (sur le graphique)



## Exécution locale

Après avoir cloné ce référentiel, migrez vers le dossier ```eBeldiApp```. Ensuite, suivez les étapes suivantes :
- Créer un projet et un cluster MongoDB
- Cliquez sur Connecter, suivez le processus où vous obtiendrez l'uri.- Remplacez l'uri MongoDB par la vôtre dans ```server/index.js```.
- Rendez-vous dans le fichier ```lib/constants/global_variables.dart```, remplacez l'adresse IP par votre adresse IP.
- Créer un projet Cloudinary, activer le fonctionnement non signé dans les paramètres.

Exécutez ensuite les commandes suivantes pour exécuter votre application :

### Du côté serveur

```bash
  cd server
  npm install
  npm run dev (for continuous development)
  OR
  npm start (to run script 1 time)
```

### Du côté Client 

```bash
  flutter pub get
  flutter run ou bien si vous aurez une erreur essayer flutter run --no-sound-null-safety
```

## Technologies utilisées

**Server**: Node.js, Express, Mongoose, MongoDB, Cloudinary

**Client**: Flutter, Provider
    
## Feedback

Si vous avez des commentaires, veuillez me contacter à talebnawal575@gmail.com
