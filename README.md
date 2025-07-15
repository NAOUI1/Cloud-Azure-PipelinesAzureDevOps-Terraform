# ☁️ Azure Cloud - Azure DevOps Pipelines & Terraform

Ce projet a pour objectif de déployer des ressources Azure de manière automatisée en utilisant **Terraform** et des pipelines Azure DevOps. Il permet notamment de provisionner des groupes de ressources, des comptes de stockage et des App Services via une infrastructure as code (IaC).

---

## 📌 Introduction

Ce projet démontre comment automatiser la gestion d'infrastructure Azure avec **Terraform**, en intégrant le déploiement via **Azure DevOps Pipelines**.  
L'objectif est de faciliter la création, la mise à jour et la suppression d'environnements cloud reproductibles et maintenables dans le temps.

---

## 🚀 Getting Started

### 📥 Installation et Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- [Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.5.0`
- Un compte Azure avec les droits nécessaires pour créer des ressources
- Azure CLI `>= 2.45.0`
- Un environnement Azure DevOps (pour les pipelines)

### 📦 Dépendances Terraform

| Provider | Version  |
|:------------|:------------|
| `azurerm` | `3.38.0` |

### 📚 Modules

| Nom | Source | Version |
|:-----|:---------|:------------|
| `appservice` | `./modules/appservice` | N/A |
| `storage`    | `./modules/storage`    | N/A |

---

## 📝 Usage

1. Clonez le dépôt :
   ```bash
   git clone https://github.com/NAOUI1/Cloud-Azure-PipelinesAzureDevOps-Terraform.git
   cd Cloud-Azure-PipelinesAzureDevOps-Terraform
Configurez vos variables dans variables.auto.tfvars ou en ligne de commande.

Initialisez Terraform :

bash
Copier
Modifier
terraform init
# Vérifiez le plan d'exécution :

bash
Copier
Modifier
terraform plan

# Appliquez l'infrastructure :

bash
Copier
Modifier
terraform apply

## ⚙️ Variables
| Nom                    | Description                                  | Type     | Défaut       | Obligatoire |
| :--------------------- | :------------------------------------------- | :------- | :----------- | :---------- |
| `LOCATION`             | La région Azure pour déployer les ressources | `string` | `westeurope` | Non         |
| `resource_group_name`  | Le nom du groupe de ressources               | `string` | N/A          | Oui         |
| `storage_account_name` | Le nom du compte de stockage                 | `string` | N/A          | Oui         |
| `container_name`       | Le nom du container                          | `string` | N/A          | Oui         |


## 📤 Outputs :

| Nom                    | Description |
| :--------------------- | :---------- |
| `appservice`           | N/A         |
| `storage_account_tier` | N/A         |


## 🧪 Build & Test :
# Pour tester votre configuration :

bash
Copier
Modifier
terraform validate
terraform plan
Un pipeline Azure DevOps peut aussi être configuré pour déclencher automatiquement ces étapes à chaque push.

## 🤝 Contribuer
Les contributions sont les bienvenues !
# Merci de suivre ces étapes :

1. Fork le projet

2. Créez votre branche de feature :

bash
Copier
Modifier
git checkout -b feature/NouvelleFeature

3. Commitez vos modifications :

bash
Copier
Modifier
git commit -m "Ajout d'une nouvelle fonctionnalité"

4. Poussez votre branche :

bash
Copier
Modifier
git push origin feature/NouvelleFeature

5. Ouvrez une Pull Request

## 📌 Notes
Pensez à vérifier la version des providers et modules avant tout déploiement en production.

Ce projet peut être étendu pour inclure des bases de données, des API Management ou d'autres services Azure.

## 📚 Références

- Terraform Azure Provider Documentation

- Azure DevOps Pipelines Documentation

- Terraform Module Documentation
